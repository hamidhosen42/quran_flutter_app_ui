// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_class/Classes/classes.dart';

class SurahPage extends StatefulWidget {
  final Surah surah;
  const SurahPage(this.surah, {Key? key}) : super(key: key);

  @override
  _SurahPageState createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List<Ayat> ayats = [];

  @override
  void initState() {
    for (int i = 0; i < widget.surah.ayats.length; i++) {
      ayats.add(Ayat(
        ayat: widget.surah.ayats[i]["Ayat"],
        ayatNo: widget.surah.ayats[i]["Ayat No"],
        banglaTranslation: widget.surah.ayats[i]["Bangla Translation"],
        englishTranslation: widget.surah.ayats[i]["English Translation"],
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF91C3A6),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF469565),
        title: Text(
          widget.surah.name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: ayats.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xFF469565),
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, -1),
                        color: Colors.black26,
                        blurRadius: 7)
                  ]),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ayats[index].ayatNo.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment(1, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ayats[index].ayat,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bangla",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Text(ayats[index].banglaTranslation,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("English",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(ayats[index].englishTranslation,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
