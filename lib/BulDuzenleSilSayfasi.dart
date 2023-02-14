import 'package:flutter/material.dart';
import 'package:telefon_rehberi/EkleSayfasi.dart';
import 'package:telefon_rehberi/GirisSayfasi.dart';
import 'package:telefon_rehberi/main.dart';

class BulDuzenleSil extends StatefulWidget {
  const BulDuzenleSil({Key? key}) : super(key: key);

  @override
  State<BulDuzenleSil> createState() => _BulDuzenleSilState();
}

TextEditingController findName = new TextEditingController();
TextEditingController findLastname = new TextEditingController();
TextEditingController findNumber = new TextEditingController();
String hintTextAd = 'Name: ';
String hintTextSoyad = 'Lastname: ';
String hintTextNumara = 'Phone Number: ';

class _BulDuzenleSilState extends State<BulDuzenleSil> with MyStyle {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: size.height * .65,
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
                    Expanded(
                      child: MyTextField(
                          findName, Icons.account_circle_outlined, hintTextAd),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Expanded(
                      child: MyTextField(findLastname,
                          Icons.account_circle_outlined, hintTextSoyad),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Expanded(
                      child:
                          MyTextField(findNumber, Icons.phone, hintTextNumara),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyButton(
                      myStyle: myStyle,
                      text: 'Find',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyButton(
                      myStyle: myStyle,
                      text: 'Update',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyButton(
                      myStyle: myStyle,
                      text: 'Delete',
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyButton(
                      myStyle: myStyle,
                      text: 'Home Page',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  InkWell MyButton({required TextStyle myStyle, required String text}) {
    int b = 0;
    bool bulundu = true;
    bool bul() {
      if ((findName.text != '' && findLastname.text != '') ||
          (findName.text != '' && findNumber.text != '') ||
          (findLastname.text != '' && findNumber.text != '')) {
        findName.text = '';
        findLastname.text = '';
        findNumber.text = '';
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Just enter information in one field"),
                actions: <Widget>[
                  new ElevatedButton(
                    child: new Text("Ok"),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            });
      } else {
        for (int i = 0; i < rehbereEklenen.length; i++) {
          if (rehbereEklenen[i].name == findName.text) {
            findLastname.text = rehbereEklenen[i].lastname.toString();
            findNumber.text = rehbereEklenen[i].phoneNumber.toString();
            b = i;
            return true;
          } else if (rehbereEklenen[i].lastname == findLastname.text) {
            findName.text = rehbereEklenen[i].name.toString();
            findNumber.text = rehbereEklenen[i].phoneNumber.toString();
            b = i;
            return true;
          } else if (rehbereEklenen[i].lastname == findLastname.text) {
            findName.text = rehbereEklenen[i].name.toString();
            findLastname.text = rehbereEklenen[i].lastname.toString();
            b = i;
            return true;
          }
        }
      }
      bulundu = false;
      return false;
    }

    sil() {
      if (bulundu == true) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Emin misiniz?"),
                actions: <Widget>[
                  new ElevatedButton(
                    child: new Text("Evet"),
                    onPressed: () {
                      setState(() {
                        rehbereEklenen.removeAt(b);
                        findNumber.text = '';
                        findLastname.text = '';
                        findName.text = '';
                        print('yeni kayıt');
                        for (int i = 0; i < rehbereEklenen.length; i++) {
                          print(rehbereEklenen[i].name);
                          print(rehbereEklenen[i].lastname);
                          print(rehbereEklenen[i].phoneNumber);
                        }
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                  new ElevatedButton(
                    child: new Text("Hayır"),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            });
      }
    }

    duzenle() {
      if (bulundu == true) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text("Emin misiniz?"),
                actions: <Widget>[
                  new ElevatedButton(
                    child: new Text("Evet"),
                    onPressed: () {
                      print('guncellenecek index: $b');

                      //rehbereEklenen[b].name = findName.text;
                      print(rehbereEklenen[b].name = findName.text);
                      rehbereEklenen[b].lastname = findLastname.text;
                      rehbereEklenen[b].phoneNumber = findNumber.text;

                      findName.text = '';
                      findLastname.text = '';
                      findNumber.text = '';
                      print('yeni liste');
                      for (int i = 0; i < rehbereEklenen.length; i++) {
                        print(rehbereEklenen[i].name);
                        print(rehbereEklenen[i].lastname);
                        print(rehbereEklenen[i].phoneNumber);
                      }
                      print('evet');
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                  new ElevatedButton(
                    child: new Text("Hayır"),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    },
                  ),
                ],
              );
            });
      } else {
        print("kayıt bulunamadı");
      }
    }

    return InkWell(
      onTap: () {
        setState(() {
          if (text == 'Home Page') {
            Navigator.pop(context);
          } else if (text == 'Find') {
            bul();
          } else if (text == 'Delete') {
            sil();
          } else if (text == 'Update') {
            duzenle();
          }
        });
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

  TextFormField MyTextField(
      TextEditingController myController, IconData myIcon, String text) {
    return TextFormField(
      controller: myController,
      style: MyStyle().myStyle,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          prefixIcon: Icon(
            myIcon,
            color: Colors.white,
          ),
          hintText: text,
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }
}
