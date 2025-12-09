import 'package:eotc_holidays/core/constants/strings.dart';

class Holiday {
  int? daysFromYearStart; // Days from start of year
  int monthDay = 0;
  String? month;
  String? dayOfWeek;

  Holiday({this.daysFromYearStart});

  void calculateDayOfWeek(int yearStart) {
    int dayIndex = (yearStart + daysFromYearStart! - 1) % 7;
    dayOfWeek = AppStrings.daysAmharic[dayIndex];
  }

  void calculateMonth() {
    int matchValue = (daysFromYearStart! / 30).floor();
    monthDay = daysFromYearStart! % 30;

    if (monthDay == 0) {
      monthDay = 30;
      matchValue--;
    }
    month = AppStrings.monthsAmharic[matchValue];
  }
}
