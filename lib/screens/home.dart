import 'package:flutter/material.dart';

import '../models/year_details.dart';
import '../screens/display_detail.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int? result;

  final _inputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('ባሕረ ሀሳብ'),
        actions: [
          IconButton(
            onPressed: () {
              showAboutDialog(
                applicationName: 'Bahire Hassab App',
                context: context,
                children: const [
                  Text('Created by: Dechasa Teshome'),
                  Text('dechassa0@gmail.com'),
                ],
              );
            },
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child: SubtitleText(
                  text:
                      'ዘመኑን (ዓመተ ምህረቱን) ከታች ባለው ሳጥን ያስገቡ። ስለ ዓመቱ ያሉ መረጃዎችን፣ የበዓላትና የአጽዋማትን ቀን ያገኛሉ።',
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: _inputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  labelText: 'ዓ.ም.',
                ),
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calculate,
        child: const Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  YearDetails calculateYearDetails(int? enteredYear) {
    var yd = YearDetails(
      yearNumber: enteredYear!,
      leapYear: false,
      hamerMonth: Month.tir,
    );

    yd.calculateValues();

    return yd;
  }

  @override
  void initState() {
    super.initState();
  }

  void _calculate() {
    setState(() {
      result = int.tryParse(_inputController.text);
    });
    //final enteredYear e

    int? res = int.tryParse(_inputController.text);
    print(res);
    final yearDetails = calculateYearDetails(res);

    _inputController.clear();
    print(yearDetails.yearStartDay);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => DisplayDetails(details: yearDetails),
      ),
    );
  }
}
