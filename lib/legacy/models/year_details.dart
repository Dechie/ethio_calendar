class Holiday {
  int? firstValue;
  int monthDay = 0;
  String? month;
  String? dayOfWeek;
  Holiday({
    this.firstValue,
  });

  void calculateDayOfWeek(int yearStart) {
    List dayss = ["ሰኞ", "ማክሰኞ", "ረቡዕ", "ሐሙስ", "አርብ", "ቅዳሜ", "እሁድ"];

    int dayIndex = (yearStart + firstValue! - 1) % 7;
    dayOfWeek = dayss[dayIndex];
  }

  void calculateMonth() {
    int matchValue = (firstValue! / 30).floor();
    monthDay = firstValue! % 30;

    List<String> theMonths = [
      "መስከረም",
      "ጥቅምት",
      "ህዳር",
      "ታህሳስ",
      "ጥር",
      "የካቲት",
      "መጋቢት",
      "ሚያዝያ",
      "ግንቦት",
      "ሰኔ",
      "ሐምሌ"
    ];

    monthDay = firstValue! % 30;
    if (monthDay == 0) {
      monthDay = 30;
      matchValue--;
    }
    month = theMonths[matchValue];
  }
}

enum Month {
  tir,
  yekatit,
  megabit,
  miyazya,
  ginbot,
  senie,
}

class YearDetails {
  String? yearStartDay;
  String? wengelawi;
  String? bealeMetqi;
  bool leapYear;
  int yearNumber;
  int ameteAlem = 0;
  int medeb = 0;
  int wenber = 0;
  int abektie = 0;
  int metqi = 0;
  int tewsak = 0;
  int mebajaHamer = 0;
  Month hamerMonth = Month.tir;
  int? ninevehDay;
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
  int meteneRabiet = 0;

  int tinteKemer = 0;
  List<String> matchStartDay = [
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday",
    "sunday",
  ];

  Map<String, int> matchTewsak = {
    "sunday": 7,
    "monday": 6,
    "tuesday": 5,
    "wednesday": 4,
    "thursday": 3,
    "friday": 2,
    "saturday": 8
  };

  int theNineveh = 0;
  YearDetails({
    this.gena,
    this.timket,
    this.meskel,
    required this.yearNumber,
    this.yearStartDay,
    required this.hamerMonth,
    this.wengelawi,
    required this.leapYear,
    this.ninevehDay,
    this.nineveh,
    this.abiyTsome,
    this.debreZeyit,
    this.hossana,
    this.siklet,
    this.tinsaye,
    this.rikbeKahnat,
    this.erget,
    this.peraklitos,
    this.tsomeHawaryat,
  });
  void calculateValues() {
    ameteAlem = yearNumber + 5500;

    List<String> matchWengelawi = ["yohannes", "matewos", "markos", "lukas"];
    var ameteTest = ameteAlem % 4;
    wengelawi = matchWengelawi[ameteTest];
    if (wengelawi == "lukas") {
      leapYear = true;
    }

    meteneRabiet = (ameteAlem / 4).floor();

    tinteKemer = (ameteAlem + meteneRabiet) % 7;

    yearStartDay = matchStartDay[tinteKemer];

    medeb = ameteAlem % 19;

    wenber = medeb - 1;

    abektie = (wenber * 11) % 30;

    metqi = (wenber * 19) % 30;

    // if metqi is > 14, beale-metqi will be in meskerem, else tikimt
    bool isTikimt = metqi < 14;
    bealeMetqi = findBealeMetqi(metqi, isTikimt, yearStartDay!);

    tewsak = matchTewsak[bealeMetqi]!;

    mebajaHamer = metqi + tewsak;

    ninevehDay = isTikimt ? (150 + mebajaHamer) : (120 + mebajaHamer);

    /*
          ******** THE REASON I USED ??= OPERATOR **********
          so I had a class YearDetails, and one of its members was a variable nineveh which is 
          a nullable instance of another class Holiday, i.e ```Holiday? nineveh;```  Holiday class 
          has a member firstValue, so I was trying to do: 
          nineveh?.firstValue = someValue;

          ***   BUT THE PROBLEM IS: ***

          The `firstValue` member of the `Holiday` class is not nullable, and when you use the safe 
          navigation operator (`?.`), it returns `null` if any of the preceding elements in the chain are `null`.

          ***   SOLUTION  ***

          So to resolve the error, use the null-aware assignment operator (`??=`) to assign a value only if `nineveh` is null:

          nineveh ??= Holiday(); // Create a new Holiday instance if nineveh is null
          nineveh?.firstValue = someValue; // Use ! to assert that nineveh is not null


          The null-aware assignment operator (`??=`) assigns the value on the right-hand side (`Holiday()`) to 
          the left-hand side (`nineveh`) only if `nineveh` is `null`. By using the `!` operator (`nineveh!.firstValue`),
           you're asserting that `nineveh` is not null, allowing you to access its `firstValue` member.

    */

    int startOfYear = tinteKemer;
    meskel = Holiday(firstValue: 17)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    gena = Holiday(firstValue: 119)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    timket = Holiday(firstValue: 131)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    nineveh ??= Holiday(firstValue: ninevehDay!)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    //;
    //nineveh?.calculateMonth();
    //nineveh?.calculateDayOfWeek(startOfYear);
    theNineveh = ninevehDay!;

    abiyTsome ??= Holiday(firstValue: theNineveh + 14)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    print(theNineveh);
    // abiyTsome?.calculateMonth()

    //;

    debreZeyit ??= Holiday(firstValue: theNineveh + 41)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    //debreZeyit?.calculateMonth();

    hossana ??= Holiday(firstValue: theNineveh + 62)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    //hossana?.calculateMonth();

    siklet ??= Holiday(firstValue: theNineveh + 67)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);

    // siklet?.calculateMonth();

    tinsaye ??= Holiday(firstValue: theNineveh + 69)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);

    //  tinsaye?.calculateMonth();

    rikbeKahnat ??= Holiday(firstValue: theNineveh + 93)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);

    // rikbeKahnat?.calculateMonth();

    erget ??= Holiday(firstValue: theNineveh + 108)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    //;
    //erget?.calculateMonth();

    peraklitos ??= Holiday(firstValue: theNineveh + 118)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    //;
    //peraklitos?.calculateMonth();

    tsomeHawaryat ??= Holiday(firstValue: theNineveh + 119)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    //;
    //tsomeHawaryat?.calculateMonth();

    tsomeDihnet ??= Holiday(firstValue: theNineveh + 121)
      ..calculateMonth()
      ..calculateDayOfWeek(startOfYear);
    //;
    //tsomeDihnet?.calculateMonth();
  }

  String findBealeMetqi(int metqi, bool isTikimt, String yearStart) {
    // iterating the days array in a circular fashion
    // for a number of times equal to the value of metqi
    if (isTikimt) {
      metqi += 30;
    } else {}
    int startIndex = 0;

    for (String find in matchStartDay) {
      if (yearStart == find) {
        startIndex = matchStartDay.indexOf(find);
      }
    }

    int incremental = 2;
    // idk why it has to be this, but the value is always behind by one
    // i.e. one less than expected
    int iterate = startIndex;

    while (incremental <= metqi) {
      incremental++;
      iterate = (iterate + 1) % matchStartDay.length;
    }

    return matchStartDay[iterate];
  }
}

