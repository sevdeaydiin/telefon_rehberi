import 'package:flutter/material.dart';
import 'package:telefon_rehberi/HomePage.dart';
import 'package:telefon_rehberi/UyeKaydi.dart';
import 'Users.dart';
import 'main.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> with MyStyle {
  TextEditingController girisKullaniciAdi = new TextEditingController();
  TextEditingController girisParola = new TextEditingController();
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
                    MyTextField(girisKullaniciAdi,
                        Icons.account_circle_outlined, 'Username: ', false),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyTextField(girisParola, Icons.vpn_key, 'Password:', true),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: () {
                        for (int i = 0; i < user.length; i++) {
                          print(
                              '$i.kullanici ${user[i].uyeAdi} ${user[i].username} ${user[i].password}');
                          if (user[i].username == girisKullaniciAdi.text &&
                              user[i].password == girisParola.text) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage(
                                          giden: user[i].uyeAdi,
                                        )));
                          } else if (user[i].username == null ||
                              user[i].password == null) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: new Text(
                                        "Can't login without registration!"),
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
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: new Text(
                                        "Kullanıcı adı ya da parola hatalı"),
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
                          }
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
                              'Sign in',
                              style: MyStyle().myStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UyeKaydi()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyContainer(),
                          Text(
                            'Sign up',
                            style: MyStyle().myStyle.copyWith(fontSize: 18),
                          ),
                          MyContainer()
                        ],
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

  TextField MyTextField(TextEditingController myController, IconData myIcon,
      String text, bool tf) {
    return TextField(
      controller: myController,
      style: MyStyle().myStyle,
      cursorColor: Colors.white,
      obscureText: tf,
      decoration: InputDecoration(
          prefixIcon: Icon(
            myIcon,
            color: Colors.white,
          ),
          hintText: '$text',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );
  }

  Container MyContainer() {
    return Container(
      height: 2,
      width: 75,
      color: Colors.white,
    );
  }
}

class MyStyle {
  TextStyle myStyle = TextStyle(color: Colors.white);
}
