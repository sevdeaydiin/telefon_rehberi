import 'main.dart';
import 'package:flutter/material.dart';
import 'GirisSayfasi.dart';
import 'Users.dart';

class UyeKaydi extends StatefulWidget {
  @override
  State<UyeKaydi> createState() => _UyeKaydiState();
}

class _UyeKaydiState extends State<UyeKaydi> with MyStyle {
  TextEditingController membername = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();

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
                    MyTextField(membername, Icons.account_circle_outlined,
                        'Member Name:', false),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyTextField(username, Icons.account_circle_outlined,
                        'Username:', false),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    MyTextField(password, Icons.vpn_key, 'Password: ', true),
                    SizedBox(
                      height: size.height * 0.08,
                    ),
                    InkWell(
                      onTap: () {
                        Users users = new Users(
                            uyeAdi: membername.text,
                            username: username.text,
                            password: password.text);
                        user.add(users);
                        Navigator.of(context).pop();

                        for (int i = 0; i < user.length; i++) {
                          print(user[i].username);
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
                              'Sign up',
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
