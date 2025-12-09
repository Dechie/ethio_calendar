import 'package:test/test.dart';

import '../lib/core/utils/calendar_utils.dart';
import '../lib/core/models/ethiopian_date.dart';
import '../lib/core/utils/bahire_hassab.dart';
import '../lib/core/constants/strings.dart';
import '../lib/core/constants/ethiopian_months.dart';
import '../lib/core/models/holiday.dart';   
import '../lib/core/models/year_details.dart';
import '../lib/core/utils/date_converter.dart';


void main() {
  final utils = CalendarUtils();

  group('CalendarUtils leap year', () {
    test('returns true for known leap year pattern', () {
      expect(CalendarUtils.checkIsLeapYear(2015), isTrue);
    });

    test('returns false for non-leap year pattern', () {
      expect(CalendarUtils.checkIsLeapYear(2016), isFalse);
    });
  });

  group('CalendarUtils Ethiopian month length', () {
    test('months 1-12 are 30 days', () {
      for (var m = 1; m <= 12; m++) {
        expect(utils.getDaysInEthiopianMonth(2016, m), 30);
      }
    });

    test('Pagume is 6 days on leap year', () {
      expect(utils.getDaysInEthiopianMonth(2015, 13), 6);
    });

    test('Pagume is 5 days on non-leap year', () {
      expect(utils.getDaysInEthiopianMonth(2016, 13), 5);
    });
  });

  group('CalendarUtils Gregorian month length', () {
    test('February varies with leap year', () {
      expect(utils.getDaysInGregorianMonth(2024, 2), 29);
      expect(utils.getDaysInGregorianMonth(2023, 2), 28);
    });

    test('Thirty-day and thirty-one-day months', () {
      expect(utils.getDaysInGregorianMonth(2024, 4), 30);
      expect(utils.getDaysInGregorianMonth(2024, 5), 31);
    });
  });

  group('CalendarUtils month navigation', () {
    test('next month from Nehase goes to Pagume', () {
      final next = utils.getNextEthiopianMonth(EthiopianDate(year: 2016, month: 12, day: 15));
      expect(next.year, 2016);
      expect(next.month, 13);
      expect(next.day, 1);
    });

    test('next month from Pagume goes to Meskerem of next year', () {
      final next = utils.getNextEthiopianMonth(EthiopianDate(year: 2016, month: 13, day: 3));
      expect(next.year, 2017);
      expect(next.month, 1);
      expect(next.day, 1);
    });

    test('previous month from Meskerem goes to Pagume with correct length', () {
      final prev = utils.getPreviousEthiopianMonth(EthiopianDate(year: 2016, month: 1, day: 5));
      expect(prev.year, 2015);
      expect(prev.month, 13);
      expect(prev.day, 5);
    });

    test('previous month from Meskerem accounts for leap Pagume', () {
      final prev = utils.getPreviousEthiopianMonth(EthiopianDate(year: 2015, month: 1, day: 2));
      expect(prev.year, 2014);
      expect(prev.month, 13);
      expect(prev.day, 6);
    });
  });

  group('CalendarUtils date comparison', () {
    test('isSameDay matches identical dates', () {
      final d1 = DateTime(2024, 9, 11);
      final d2 = DateTime(2024, 9, 11, 23, 59, 59);
      expect(utils.isSameDay(d1, d2), isTrue);
    });

    test('isSameDay differentiates days', () {
      final d1 = DateTime(2024, 9, 11);
      final d2 = DateTime(2024, 9, 12);
      expect(utils.isSameDay(d1, d2), isFalse);
    });
  });
}

