import 'package:flutter/material.dart';
import 'package:homathonapp/UserHomePage.dart';

void main() {
  runApp(MaterialApp(
    home: SelectUser(),
  ));
}

class SelectUser extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SelectUser> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('اختيار نوع المستخدم'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'قم باختيار نوع المستخدم',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    )),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('الدخول كمزود خدمة'),
                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => ServiceProviderHomePage()),
//                          );
                        })),
                SizedBox(height: 40),
                Container(
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('الدخول كمستخدم عادي'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UserHomePage()),
                          );
                        })),
              ],
            )));
  }
}
