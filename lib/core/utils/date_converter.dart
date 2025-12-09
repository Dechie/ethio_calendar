import '../models/ethiopian_date.dart';
import 'calendar_utils.dart';

class DateConverter {
        DateTime ethiopianToGregorian(int ethYear, int ethMonth, int ethDay) {
        // Ethiopian year starts on September 11 (or 12 in leap years)
        // Calculate the base gregorian year
        int baseGregYear = ethYear + 7;

        // check if we need to adust for the year boundary
        // Ethiopian ew Year is Septempber 11 or 12
        bool isEthLeapYear = CalendarUtils.checkIsLeapYear(ethYear);
        int newYearDay = isEthLeapYear ? 12 : 11;

        // calculate days from Ethiopian New Year
        int daysFromNewYear = 0;

        // Add days from completed months
        for (int m = 1; m < ethMonth; m++) {
            if (m == 13) {
                // Pagume
                daysFromNewYear += isEthLeapYear ? 6 : 5;

            } else {
                daysFromNewYear += 30;
            }
        }
        
        // Add days in current month
        daysFromNewYear += ethDay - 1;

        // Calculate Gregorian date
        DateTime ethNewYear = DateTime(baseGregYear, 9, newYearDay);
        DateTime gregDate = ethNewYear.add(Duration(days: daysFromNewYear));

        // Adjust year if we've crossed into next Gregorian year
        if (gregDate.month < 9 || (gregDate.month == 9 && gregDate.day < newYearDay)) {
            baseGregYear++;
            ethNewYear = DateTime(baseGregYear, 9, newYearDay);
            gregDate = ethNewYear.add(Duration(days: daysFromNewYear));
        }

        return gregDate;

    }

    EthiopianDate gregorianToEthiopian(DateTime gregDate) {
        int gregYear = gregDate.year;
        int gregMonth = gregDate.month;
        int gregDay = gregDate.day;

        // Calculate Ethiopian year (approximately 7-8) years behind
        int ethYear = gregYear - 7;

        // Determin if Ethiopian year is a leap year
        bool isEthLeapYear = CalendarUtils.checkIsLeapYear(ethYear);
        int newYearDay = isEthLeapYear ? 12 : 11;

        // Calculate Ethiopian new year date
        DateTime ethNewYear = DateTime(gregYear, 9, newYearDay);

        // if current date is before Ethiopian new year, use 
        // previous year's new year
        if (gregDate.isBefore(ethNewYear)) {
            ethYear--;
            isEthLeapYear = CalendarUtils.checkIsLeapYear(ethYear);
            newYearDay = isEthLeapYear ? 12 : 11;
            ethNewYear = DateTime(gregYear - 1, 9, newYearDay);
        }

        // Calculate days from Ethiopian New Year
        int daysFromNewYear = gregDate.difference(ethNewYear).inDays;

        // convert days to Ethiopian month and day
        int ethMonth = 1;
        int ethDay = 1;
        int remainingDays = daysFromNewYear;

        // Ethiopian months (1-12 have 30 days each)
        for (int m = 1; m <= 12 && remainingDays >= 30; m++){
            ethMonth = m + 1;
            remainingDays -= 30;
        }

        // Handle Pagume (13th month)
        int pagumeDays = isEthLeapYear ? 6 : 5;
        if (remainingDays >= pagumeDays) {
            ethMonth = 13;
            ethDay = remainingDays - pagumeDays + 1;
        } else {
            ethDay = remainingDays + 1;
        }

        return EthiopianDate(
            year: ethYear,
            month: ethMonth,
            day: ethDay,
        );
    }

    bool isValidEthiopiandate(int year, int month, int day) {
        if (month < 1 || month > 13) return false;
        if (day < 1) return false;

        if (month == 13) {
            bool isLeap = CalendarUtils.checkIsLeapYear(year);
            return day <= (isLeap ? 6 : 5);
        } else {
            return day <= 30;
        }
    }
}