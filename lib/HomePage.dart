import 'package:flutter/material.dart';
import 'package:telefon_rehberi/BulDuzenleSilSayfasi.dart';
import 'package:telefon_rehberi/EkleSayfasi.dart';
import 'package:telefon_rehberi/ListeleSayfasi.dart';
import 'package:telefon_rehberi/UyeKaydi.dart';
import 'package:telefon_rehberi/main.dart';
import 'GirisSayfasi.dart';

class HomePage extends StatefulWidget {
  String? giden;
  HomePage({this.giden});

  @override
  State<HomePage> createState() => _HomePageState();
}

final text1 = 'Add Phone';
final text2 = 'Find-Update-Delete';
final text3 = 'Contacts';
final text4 = 'Login';

class _HomePageState extends State<HomePage> with MyStyle {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.giden.toString()),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: size.height * .5,
            width: size.width * .85,
            decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(color: Colors.white38),
                ]),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButton(
                      myStyle: myStyle,
                      text: text1,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyButton(
                      myStyle: myStyle,
                      text: text2,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyButton(
                      myStyle: myStyle,
                      text: text3,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyButton(
                      myStyle: myStyle,
                      text: text4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.myStyle,
    required this.text,
  }) : super(key: key);

  final TextStyle myStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    EkleyeGidis() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Ekle()));
    }

    BulmayaGidis() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BulDuzenleSil()));
    }

    return InkWell(
      onTap: () {
        if (text == text1) {
          EkleyeGidis();
        } else if (text == text2) {
          BulmayaGidis();
        } else if (text == text3) {
          print(rehbereEklenen.length);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Listele(
                        kayitSayisi: rehbereEklenen.length,
                      )));
        } else {
          Navigator.pop(context);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
              text,
              style: MyStyle().myStyle.copyWith(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
