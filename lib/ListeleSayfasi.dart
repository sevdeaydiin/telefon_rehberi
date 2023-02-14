import 'package:flutter/material.dart';
import 'package:telefon_rehberi/main.dart';

class Listele extends StatefulWidget {
  var kayitSayisi;
  Listele({this.kayitSayisi});

  @override
  State<Listele> createState() => _ListeleState();
}

class _ListeleState extends State<Listele> with MyStil {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Contacts',
        style: stil,
      )),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(color: Colors.white38),
                ]),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: ListView.builder(
                  itemCount: int.parse(widget.kayitSayisi.toString()),
                  itemBuilder: (BuildContext context, int index) {
                    return MyColumn(index);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column MyColumn(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 400,
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      child: Text(
                    '${rehbereEklenen[index].name}',
                    style: stil,
                  )),
                  Expanded(
                      child: Text('${rehbereEklenen[index].lastname}',
                          style: stil)),
                  Expanded(
                      child: Text('${rehbereEklenen[index].phoneNumber}',
                          style: stil)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyStil {
  TextStyle stil = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
}
