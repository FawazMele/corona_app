import 'package:flutter/material.dart';

import 'ConfirmOrder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Some App',
      home: AllStores(),
    );
  }
}

class AllStores extends StatelessWidget {
  Widget getListView(BuildContext context) {
    var listView = ListView(
      children: <Widget>[
        Text(
          "اختيار نوع الخدمة",
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
        ),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text("بقالة بن رزق  ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "بقالة بن رزق للمواد الغذائية والتموينات   ",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text("بقالة نور الدين ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "تموينات نور الدين ",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text("بقالة الجزيرة  ", textDirection: TextDirection.rtl),
          subtitle: Text(
            " متجر تموينات غذائية الجزيرة",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text("بقالة سلة الروضة ", textDirection: TextDirection.rtl),
          subtitle: Text(
            " تموينات سلة الروضة للمواد الغذائية",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text(" بقالة ابن خلدون", textDirection: TextDirection.rtl),
          subtitle: Text(
            "متجر ابن خلدون للمواد الغذائية والتموينات",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text(" ميني ماركت المها  ", textDirection: TextDirection.rtl),
          subtitle: Text(
            " بقالة المها للمواد الغذائية والتموينات ",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text(" بقالة أبو سارة ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "متجر أبو سارة للمواد الغذائية والتموينات",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
        SizedBox(height: 20),
        ListTile(
          leading: Icon(
            Icons.store,
            size: 50,
          ),
          title: Text(" بقالة عمر الصايغ ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "ميني ماركت عمر للمواد الغذائية والتموينات",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConfirmOrder(),
              ),
            );
          },
        ),
      ],
    );
    return listView;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اختيار نوع الخدمة'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Container(child: getListView(context)),
      ),
    );
  }
}
