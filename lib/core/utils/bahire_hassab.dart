import '../models/holiday.dart';
import '../constants/strings.dart';

class BahireHassabCalculator {
    final int year;

    // calculated values
    int ameteAlem = 0;
    String? wengelawi;
    bool leapYear = false;
    int meteneRabiet = 0;
    int tinteKemer = 0;
    String? yearStartDay;
    int medeb = 0;
    int wenber = 0;
    int abektie = 0;
    int metqi = 0;
    int tewsak = 0;
    int mebajaHamer = 0;
    String bealeMetqi = "";
    int? ninevehDay;

    // Holidays
    Holiday? gena;
    Holiday? meskel;
    Holiday? timket;
    Holiday? nineveh;
    Holiday? abiyTsome;
    Holiday? debreZeyit;
    Holiday? hossana;
    Holiday? siklet;
    Holiday? tinsaye;
    Holiday? rikbeKahnat;
    Holiday? erget;
    Holiday? peraklitos;
    Holiday? tsomeHawaryat;
    Holiday? tsomeDihnet;

    BahireHassabCalculator(this.year);

    static int getYearStartDay(int year) {
        return (year + 5500) % 7;
    }
    static int getAmeteAlem(int year) {
        return year + 5500;
    }

    static String getWengelawi(int year) {
        final ameteAlem = getAmeteAlem(year);
        return AppStrings.wengelawis[ameteAlem % 4];
    }
    static int getMeteneRabiet(int year) {
        return getAmeteAlem(year) ~/ 4;
    }
    static int getTinteKemer(int year) {
        int ameteAlem = getAmeteAlem(year);
        return (ameteAlem + getMeteneRabiet(year)) % 7;
    }
    static String findYearStartDay(int year) {
        return AppStrings.weekDays[getYearStartDay(year)];
    }
    void calculate() {
        // Step 1: Calculate ameteAlem
        ameteAlem = year + 5500;

        // Step 2: Calculate Wengelawi (evangelist)
        
        wengelawi = AppStrings.wengelawis[ameteAlem % 4];

        leapYear = (wengelawi == AppStrings.wengelawis[3]); // lukas

        // Step 3: Calculate Metene Rabiet
        meteneRabiet = ameteAlem ~/ 4; // divide without decimal

        // Step 4: Calculate Tinte Kemer (New year day of week)
        tinteKemer = (ameteAlem + meteneRabiet) % 7;

        
        yearStartDay = AppStrings.weekDays[tinteKemer];

        // Step 5: Calculate Medeb and Wenber
        medeb = ameteAlem % 19;
        wenber = medeb == 0 ? 18 : medeb - 1;

        // Step 6: Calculate Abeqtie and Metqi
        abektie = (wenber * 11) % 30;
        metqi = (wenber * 19) % 30;

        // Step 7: Calculate Beale Metqi
        bool isTikimt = metqi < 14;
        int tempMetqi = metqi; // temporarily hold metqi value
        if (isTikimt) tempMetqi += 30;

        int dayIndex = AppStrings.weekDays.indexOf(yearStartDay!);

        int incremented = 2;
        
        while (incremented <= tempMetqi) {
            incremented++;
            dayIndex = (dayIndex + 1) % AppStrings.weekDays.length;
        } 

        bealeMetqi = AppStrings.weekDays[dayIndex];

        // Step 8: Calculate Tewsak
       
        List<int> tewsakOffsets = [6, 5, 4, 3, 2, 8, 7];
        int bealeMetqiIndex = AppStrings.weekDays.indexOf(bealeMetqi);
        tewsak = bealeMetqiIndex >= 0 ? tewsakOffsets[bealeMetqiIndex] : 0;
        
        // Step 9: Calculate Mebaja Hamer
        mebajaHamer = metqi + tewsak;

        mebajaHamer = mebajaHamer % 30; 
        // if it's >30, it will give us 0-30 value, else it will leave it as is

        // Step 10: Calculate Nineveh Day
        ninevehDay = isTikimt ? (150 + mebajaHamer) : (120 + mebajaHamer);

        // Step 11: Calculate all holidays
        calculateHolidays();

    }

    String findBealeMetqi(int metqi, bool isTikimt, String yearStartDay) {
        if (isTikimt) metqi += 30;

        int dayIndex = AppStrings.weekDays.indexOf(yearStartDay);

        int incremented = 2;
        
        while (incremented <= metqi) {
            incremented++;
            dayIndex = (dayIndex + 1) % AppStrings.weekDays.length;
        }

        return AppStrings.weekDays[dayIndex];

    }

    void calculateHolidays() {
        int startOfYear = tinteKemer;

        // Fixed holidays
        // meskel: 17 days after new year
        meskel = Holiday(daysFromYearStart: 17) 
                    ..calculateMonth()
                    ..calculateDayOfWeek(startOfYear);

        // gena: 119 days after new year
        gena = Holiday(daysFromYearStart: 119)
                    ..calculateMonth()
                    ..calculateDayOfWeek(startOfYear);

        // timket: 131 days after new year
        timket = Holiday(daysFromYearStart: 131)
                    ..calculateMonth()
                    ..calculateDayOfWeek(startOfYear);
        
        // Nineveh and related fasts
        int theNineveh = ninevehDay!;
        nineveh ??= Holiday(daysFromYearStart: ninevehDay!)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);
        

        // Nineveh and related fasts
        // abiyTsome: 14 days after nineveh
        abiyTsome ??= Holiday(daysFromYearStart: theNineveh + 14)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);

        // debrezeyit: 41 days after nineveh
        debreZeyit ??= Holiday(daysFromYearStart: theNineveh + 41)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);

        // hossana: 62 days after nineveh
        hossana ??= Holiday(daysFromYearStart: theNineveh + 62)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);
        
        // siklet: 67 days after nineveh
        siklet ??= Holiday(daysFromYearStart: theNineveh + 67)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);

        // tinsaye: 69 days after nineveh
        tinsaye ??= Holiday(daysFromYearStart: theNineveh + 69)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);

        // rikbeKahnat: 93 days after nineveh
        rikbeKahnat ??= Holiday(daysFromYearStart: theNineveh + 93)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);
        
        // erget: 108 days after nineveh
        erget ??= Holiday(daysFromYearStart: theNineveh + 108)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);
        
        // peraklitos: 118 days after nineveh
        peraklitos ??= Holiday(daysFromYearStart: theNineveh + 118)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);
        
        // tsomeHawaryat: 119 days after nineveh
        tsomeHawaryat ??= Holiday(daysFromYearStart: theNineveh + 119)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);
        
        // tsomeDihnet: 121 days after nineveh
        tsomeDihnet ??= Holiday(daysFromYearStart: theNineveh + 121)
                        ..calculateMonth()
                        ..calculateDayOfWeek(startOfYear);
        
    }
}