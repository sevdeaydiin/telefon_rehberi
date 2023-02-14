import 'package:flutter/material.dart';
import 'package:telefon_rehberi/EkleSayfasi.dart';
import 'package:telefon_rehberi/HomePage.dart';
import 'GirisSayfasi.dart';
import 'Users.dart';

List<Users> user = [];
List<Ekle> rehbereEklenen = [];

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: GirisSayfasi(),
    );
  }
}

//isim ve telefon numarası olmadan ekleme yapılamaz
//kullanıcı adı ve şifre olmadan kayıt olunamaz
