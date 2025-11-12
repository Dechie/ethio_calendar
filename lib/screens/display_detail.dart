import 'package:flutter/material.dart';

import '../models/year_details.dart';

class DisplayDetails extends StatelessWidget {
  final YearDetails details;

  const DisplayDetails({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, String> amgToEng1 = {
      "matewos": "ዘመነ ማቴዎስ",
      "markos": "ዘመነ ማርቆስ",
      "lukas": "ዘመነ ሉቃስ",
      "yohannes": "ዘመነ ዮሐንስ",
    };

    Map<String, String> amgToEng2 = {
      "monday": "ሰኞ",
      "tuesday": "ማክሰኞ",
      "wednesday": "ረቡዕ",
      "thursday": "ሐሙስ",
      "friday": "አርብ",
      "saturday": "ቅዳሜ",
      "sunday": "እሁድ"
    };
    final leapYearVal = details.leapYear ? "6" : "5";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('ባሕረ ሀሳብ'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  top: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.amber,
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                    leading: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: ClipRRect(
                        clipBehavior: Clip.antiAlias,
                        borderRadius: BorderRadius.circular(10),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.asset(
                            "assets/images/${details.wengelawi}.png",
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                    title: TitleText(
                      text: amgToEng1[details.wengelawi]!,
                    ),
                    subtitle: SubtitleText(
                      text: details.yearNumber.toString(),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: Card(
                  elevation: 10,
                  color: Colors.amber,
                  child: ListTile(
                    title: SubtitleText(
                      text:
                          'ዓመቱ የሚጀምርበት ቀን: ${amgToEng2[details.yearStartDay]}',
                    ),
                    subtitle: SubtitleText(
                      text: 'ጳጉሜን: $leapYearVal',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Card(
                    color: Colors.amber,
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: [
                          const Center(
                            child: SubtitleText(text: 'በዓላት እና አጽዋማት'),
                          ),

                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SubtitleText(text: 'መስቀል'),
                                  SubtitleText(text: 'ገና'),
                                  SubtitleText(text: 'ጥምቀት'),
                                  SubtitleText(text: 'ጾመ ነነዌ'),
                                  SubtitleText(text: 'ዐቢይ ጾም'),
                                  SubtitleText(text: 'ደብረ ዘይት'),
                                  SubtitleText(text: 'ሆሣዕና'),
                                  SubtitleText(text: 'ስቅለት'),
                                  SubtitleText(text: 'ትንሣኤ'),
                                  SubtitleText(text: 'ርክበ ካህናት'),
                                  SubtitleText(text: 'ዕርገት'),
                                  SubtitleText(text: 'ጰራቅሊጦስ'),
                                  SubtitleText(text: 'ጾመ ሐዋርያት'),
                                  SubtitleText(text: 'ጾመ ድኅነት'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SubtitleText(
                                    text:
                                        '${details.meskel?.dayOfWeek}፣ ${details.meskel?.month} ${details.meskel?.monthDay}',
                                  ),
                                  SubtitleText(
                                    text:
                                        ' ${details.gena?.dayOfWeek}፣ ${details.gena?.month} ${details.gena?.monthDay}',
                                  ),
                                  SubtitleText(
                                    text:
                                        '${details.timket?.dayOfWeek}፣ ${details.timket?.month} ${details.timket?.monthDay}',
                                  ),
                                  SubtitleText(
                                    text:
                                        '${details.nineveh?.dayOfWeek}፣ ${details.nineveh?.month} ${details.nineveh?.monthDay}',
                                  ),
                                  SubtitleText(
                                      text:
                                          '${details.abiyTsome?.dayOfWeek}፣ ${details.abiyTsome?.month} ${details.abiyTsome?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.debreZeyit?.dayOfWeek}፣ ${details.debreZeyit?.month} ${details.debreZeyit?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.hossana?.dayOfWeek}፣ ${details.hossana?.month} ${details.hossana?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.siklet?.dayOfWeek}፣ ${details.siklet?.month} ${details.siklet?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.tinsaye?.dayOfWeek}፣ ${details.tinsaye?.month} ${details.tinsaye?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.rikbeKahnat?.dayOfWeek}፣ ${details.rikbeKahnat?.month} ${details.rikbeKahnat?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.erget?.dayOfWeek}፣ ${details.erget?.month} ${details.erget?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.peraklitos?.dayOfWeek}፣ ${details.peraklitos?.month} ${details.peraklitos?.monthDay}'),
                                  SubtitleText(
                                      text:
                                          '${details.tsomeHawaryat?.dayOfWeek}፣ ${details.tsomeHawaryat?.month} ${details.tsomeHawaryat?.monthDay}'),
                                  SubtitleText(
                                    text:
                                        '${details.tsomeDihnet?.dayOfWeek}፣ ${details.tsomeDihnet?.month} ${details.tsomeDihnet?.monthDay}',
                                  ),
                                ],
                              ),
                            ],
                          ), // row
                        ],
                      ), //column
                    ), // pading
                  ),
                ),
              ),
            ],
          ),
        ), // columen
      ), // continer
    );
  } // scaffold
}

class SubtitleText extends StatelessWidget {
  final String text;

  const SubtitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      );
}

class TitleText extends StatelessWidget {
  final String text;

  const TitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      );
}
