import 'package:Devnology/app/components/cardHistory/cardHistory.dart';
import 'package:Devnology/app/components/toast/CustomTostOverlay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'history_controller.dart';

class HistoryPage extends StatefulWidget {
  final String title;
  const HistoryPage({Key key, this.title = "History"}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends ModularState<HistoryPage, HistoryController> {
  var txt = TextEditingController();
  var txt2 = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  List history = [];

  init() async {
    db.collection("users").snapshots().listen((result) async {
      history = [];
      result.docs.asMap().forEach((index, e) {
        //todo
        history.add(e.data());
        history[index]["id"] = e.id;
      });
      setState(() {});
    });
  }

  final fontColor = Color(0xff22252A);

  void showCustomToastOverlay(String msg) {
    CustomToastOverlay().show(context,
        mainText: msg,
        backgroundColor: fontColor,
        mainTextColor: Colors.white,
        toastLength: Duration(milliseconds: 3000));
  }

  deleteHistory(String id) async {
    db.collection("users").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xff03F45C)),
        ),
        backgroundColor: fontColor,
        centerTitle: true,
        leading: FlatButton(
          child: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Color(0xff03F45C),
          ),
          onPressed: () => Navigator.pushNamed(context, '/home'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: history.length != 0
              ? Column(
                  children: history.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          CardHistory(item: item, deleteHistory: deleteHistory),
                    );
                  }).toList(),
                )
              : Center(
                  child: Text("EMPTY",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18))),
        ),
      ),
    );
  }
}
