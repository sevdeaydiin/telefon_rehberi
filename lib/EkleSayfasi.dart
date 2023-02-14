import 'package:flutter/material.dart';
import 'package:telefon_rehberi/GirisSayfasi.dart';
import 'package:telefon_rehberi/main.dart';

class Ekle extends StatefulWidget {
  String? lastname;
  String? name;
  String? phoneNumber;
  Ekle({this.name, this.lastname, this.phoneNumber});

  @override
  State<Ekle> createState() => _EkleState();
}

class _EkleState extends State<Ekle> with MyStyle {
  TextEditingController newName = new TextEditingController();
  TextEditingController newLastname = new TextEditingController();
  TextEditingController newNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
                    MyTextField(
                        newName, Icons.account_circle_outlined, 'Name:'),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyTextField(newLastname, Icons.account_circle_outlined,
                        'Lastname:'),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyTextField(newNumber, Icons.phone, 'Phone:'),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: () {
                        Ekle yeniKisi = new Ekle(
                          name: newName.text,
                          lastname: newLastname.text,
                          phoneNumber: newNumber.text,
                        );
                        if (newName.text == '' || newNumber.text == '') {
                          print('hello');
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text(
                                      "Name and phone number field cannot be left blank!"),
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
                        } else if (newNumber.text.contains(RegExp(r'[a-z]'))) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: new Text(
                                      "Phone number cannot contain letters!"),
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
                          rehbereEklenen.add(yeniKisi);
                          Navigator.of(context).pop();
                        }
                        for (int i = 0; i < rehbereEklenen.length; i++) {
                          print(rehbereEklenen[i].phoneNumber);
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
                              'Add',
                              style: MyStyle().myStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
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

  TextField MyTextField(
      TextEditingController myController, IconData myIcon, String text) {
    return TextField(
      controller: myController,
      style: MyStyle().myStyle,
      cursorColor: Colors.white,
      decoration: InputDecoration(
          prefixIcon: Icon(
            myIcon,
            //Icons.account_circle_outlined,
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
