import 'package:flutter/material.dart';
import 'package:homathonapp/AllStores.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Some App',
      home: UserHomePage(),
    );
  }
}

class UserHomePage extends StatelessWidget {
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
            Icons.build,
            size: 50,
          ),
          title: Text("سباكة ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "محلات السباكة والكهرباء بالقرب منك",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllStores(),
              ),
            );
          },
        ),
        SizedBox(height: 40),
        ListTile(
          leading: Icon(
            Icons.local_convenience_store,
            size: 50,
          ),
          title: Text("بقالة ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "  البقالات بالقرب منك",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllStores(),
              ),
            );
          },
        ),
        SizedBox(height: 40),
        ListTile(
          leading: Icon(
            Icons.local_pharmacy,
            size: 50,
          ),
          title: Text("صيدلية ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "  الصيدليات بالقرب منك",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllStores(),
              ),
            );
          },
        ),
        SizedBox(height: 40),
        ListTile(
          leading: Icon(
            Icons.kitchen,
            size: 50,
          ),
          title: Text("اسطوانة غاز ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "   محلات الغاز بالقرب منك",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllStores(),
              ),
            );
          },
        ),
        SizedBox(height: 40),
        ListTile(
          leading: Icon(
            Icons.border_clear,
            size: 50,
          ),
          title: Text("مغسلة ملابس ", textDirection: TextDirection.rtl),
          subtitle: Text(
            "مغاسل الملابس بالقرب منك",
            textDirection: TextDirection.rtl,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllStores(),
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
