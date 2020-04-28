import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'SelectUser.dart';

void main() {
  runApp(MaterialApp(
    home: ConfirmOrder(),
  ));
}

class Selection {
  const Selection(this.name);

  final String name;
}

class ConfirmOrder extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ConfirmOrder> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final databaseReference = Firestore.instance;
  List<Selection> state = <Selection>[
    const Selection('سلبي'),
    const Selection('ايجابي')
  ];
  List<Selection> type = <Selection>[
    const Selection('مخالط'),
    const Selection('متعلق بالسفر')
  ];
  List<Selection> buildingType = <Selection>[
    const Selection('فيلا'),
    const Selection(' عمارة'),
    const Selection(' مجمع سكني'),
    const Selection(' عمارة'),
    const Selection(' ملحق')
  ];
  List<Selection> districts = <Selection>[
    const Selection('ينبع'),
    const Selection('العلا'),
    const Selection('الحناكية'),
    const Selection('المدينة')
  ];

  Selection selectedDistrict;
  Selection selectedState;
  Selection selectedType;
  Selection selectedBuilding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('تطبيق حالات كورونا'),
        ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'تسجيل الحالات',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'حالة جديدة ',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'الاسم',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                    controller: ageController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'العمر',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                    controller: genderController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'الجنس',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(24, 15, 24, 0),
                  child: TextField(
                    controller: nationalityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'الجنسية',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 15, 24, 0),
                  child: Row(children: <Widget>[
                    DropdownButton<Selection>(
                      hint: new Text(" نوع الحالة"),
                      value: selectedType,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedType = newValue;
                        });
                      },
                      items: type.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    DropdownButton<Selection>(
                      hint: new Text(" المحافظة"),
                      value: selectedDistrict,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedDistrict = newValue;
                        });
                      },
                      items: districts.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    DropdownButton<Selection>(
                      hint: new Text("نوع المبنى"),
                      value: selectedBuilding,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedBuilding = newValue;
                        });
                      },
                      items: buildingType.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    DropdownButton<Selection>(
                      hint: new Text("نتيجة الاصابة"),
                      value: selectedState,
                      onChanged: (Selection newValue) {
                        setState(() {
                          selectedState = newValue;
                        });
                      },
                      items: state.map((Selection user) {
                        return new DropdownMenuItem<Selection>(
                          value: user,
                          child: new Text(
                            user.name,
                            style: new TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                  ]),
                ),
                Container(
                    height: 70,
                    padding: EdgeInsets.fromLTRB(24, 20, 24, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('رفع الحالة للموقع الحالي'),
                      onPressed: () async {
                        Position position = await Geolocator()
                            .getCurrentPosition(
                                desiredAccuracy: LocationAccuracy.high);

                        databaseReference
                            .collection("cases")
                            .getDocuments()
                            .then((QuerySnapshot snapshot) {
                          snapshot.documents
                              .forEach((f) => print('${f.data}}'));
                        });

                        await databaseReference
                            .collection("cases")
                            .document()
                            .setData({
                          'name': nameController.text,
                          'age': ageController.text,
                          'gender': genderController.text,
                          'nationality': nationalityController.text,
                          'type': selectedType.name.toString(),
                          'district': selectedDistrict.name.toString(),
                          'state': selectedState.name.toString(),
                          'location': new GeoPoint(
                              position.latitude, position.longitude)
                        });

                        Widget okButton = FlatButton(
                          child: Text("موافق"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SelectUser()),
                            );
                          },
                        );
                        showDialog(
                            context: context,
                            child: new AlertDialog(
                              title: new Text("تمت اضافة حالة جديدة"),
                              content: new Text(ageController.text +
                                  " " +
                                  genderController.text +
                                  " " +
                                  nameController.text +
                                  position.toString()),
                              actions: [
                                okButton,
                              ],
                            ));
                      },
                    )),
              ],
            )));
  }
}
