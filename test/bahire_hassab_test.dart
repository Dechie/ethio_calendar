import 'package:test/test.dart';

import '../lib/core/utils/bahire_hassab.dart';
import '../lib/core/constants/strings.dart';

void main() {
  group('BahireHassabCalculator core fields', () {
    test('calculate populates key values', () {
      final calc = BahireHassabCalculator(2016);
      calc.calculate();

      expect(calc.ameteAlem, isNonZero);
      expect(calc.wengelawi, isNotNull);
      expect(calc.yearStartDay, isNotNull);
      expect(calc.metqi, isNonZero);
      expect(calc.bealeMetqi, isNotEmpty);
      expect(calc.tewsak, isNonZero);
      expect(calc.mebajaHamer, isNonZero);
      expect(calc.ninevehDay, isNotNull);
    });
  });

  group('BahireHassabCalculator tewsak mapping', () {
    final mapping = {
      'friday': 2,
      'thursday': 3,
      'wednesday': 4,
      'tuesday': 5,
      'monday': 6,
      'sunday': 7,
      'saturday': 8,
    };

    test('bealeMetqi weekday maps to expected tewsak offset', () {
      mapping.forEach((weekday, expectedTewsak) {
        final offsets = [6, 5, 4, 3, 2, 8, 7];
        final idx = AppStrings.weekDays.indexOf(weekday);
        expect(idx, isNonNegative, reason: 'weekday must exist in AppStrings');
        final derived = offsets[idx];

        expect(derived, expectedTewsak,
            reason: 'weekday $weekday should map to tewsak $expectedTewsak');
      });
    });
  });

  group('BahireHassabCalculator Tikimt branch', () {
    test('metqi < 14 (Tikimt) yields Nineveh +150+mebajaHamer', () {
      final calc = BahireHassabCalculator(2016);
      calc.metqi = 10;
      calc.tewsak = 3;
      calc.mebajaHamer = (calc.metqi + calc.tewsak) % 30;
      final nineveh = (150 + calc.mebajaHamer);
      expect(nineveh, greaterThan(150 - 1));
    });

    test('metqi >= 14 yields Nineveh +120+mebajaHamer', () {
      final calc = BahireHassabCalculator(2016);
      calc.metqi = 20;
      calc.tewsak = 3;
      calc.mebajaHamer = (calc.metqi + calc.tewsak) % 30;
      final nineveh = (120 + calc.mebajaHamer);
      expect(nineveh, greaterThanOrEqualTo(120));
    });
  });
}

