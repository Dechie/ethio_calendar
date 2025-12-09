import 'package:intl/intl.dart';

import '../constants/ethiopian_months.dart';
import '../models/ethiopian_date.dart';
import 'bahire_hassab.dart';

class CalendarUtils {
    static bool checkIsLeapYear(int year) {
        return (year + 5500) % 4 == 3;
    }

    int getDaysInEthiopianMonth(int year, int month) {
        if (month == 13) {
           return checkIsLeapYear(year) ? 6 : 5;
        }
        return 30;
    }

    int getDaysInGregorianMonth(int year, int month) {
        return DateTime(year, month + 1, 0).day;
    }

    int getFirstDayOfEthiopianMonth(int year) {
        return BahireHassabCalculator.getYearStartDay(year);
    }
    String formatEthiopianDate(EthiopianDate date) {
        return "${EthiopianMonths.months[date.month]} ${date.day}, ${date.year}";
    }

    String formatGregorianDate(DateTime date) {
        // use intl
        return DateFormat('yyyy-MM-dd').format(date);
    }

    bool isSameDay(DateTime date1, DateTime date2) {
        return date1.year == date2.year && 
                date1.month == date2.month &&
                date1.day == date2.day;
    }

    bool isToday(DateTime date) {
        final now = DateTime.now();
        return isSameDay(date, now);
    }

    DateTime getStartOfWeek(DateTime date) {
        int weekDay = date.day; // 1 = Monday, 7 = Sunday
        return date.subtract(Duration(days: weekDay - 1));
    }

    DateTime getEndOfWeek(DateTime date) {
        return getStartOfWeek(date).add(Duration(days: 6));
    }

    List<DateTime> getWeekDates(DateTime date) {
        DateTime start = getStartOfWeek(date);
        return List.generate(7, (index) => start.add(Duration(days: index)));
    }

    EthiopianDate getNextEthiopianMonth(EthiopianDate date) {
        if (date.month == 13) {
            // Pagume -> next year, Meskerem
            return EthiopianDate(
                year: date.year + 1,
                month: 1,
                day: 1
            );
        } else if (date.month == 12) {
            // Nehase -> Pagume
            return EthiopianDate(
                year: date.year,
                month: 13,
                day: 1
            );
        } else {
            return EthiopianDate(
                year: date.year,
                month: date.month + 1,
                day: 1
            );
        }
    }

    EthiopianDate getPreviousEthiopianMonth(EthiopianDate date) {
        if (date.month == 1) {
            // Meskerem -> Nehase
            int pagumeDate = checkIsLeapYear(date.year) ? 6 : 5;
            return EthiopianDate(
                year: date.year - 1,
                month: 13,
                day: pagumeDate
            );
        } else {
            return EthiopianDate(
                year: date.year,
                month: date.month - 1,
                day: 1
            );
        }
    }
}