import 'package:Devnology/app/components/MultiSheet/multi_sheet.dart';
import 'package:Devnology/app/components/toast/CustomTostOverlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  var txt = TextEditingController();
  var txt2 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  var rates;

  changeCountry(String text) async {
    var res = await controller.getRates(currency_from);
    rates = text;
    double convert = res[currency_to] * (double.tryParse(text) ?? 0);

    txt.text =
        NumberFormat.currency(locale: 'pt_BR', symbol: "").format(convert);
    setState(() {});
  }

  String currency_from = "BRL";
  String currency_to = "USD";

  final fontColor = Color(0xff22252A);

  void showCustomToastOverlay(String msg) {
    CustomToastOverlay().show(context,
        mainText: msg,
        backgroundColor: fontColor,
        mainTextColor: Colors.white,
        toastLength: Duration(milliseconds: 3000));
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  widget.title,
                  style: TextStyle(color: Color(0xff03F45C)),
                ),
                backgroundColor: fontColor,
                actions: [
                  FlatButton(
                    child: Icon(
                      Icons.timer,
                      size: 25,
                      color: Color(0xff03F45C),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/history');
                    },
                  ),
                  FlatButton(
                    child: Icon(
                      Icons.exit_to_app,
                      size: 25,
                      color: Color(0xff03F45C),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/'),
                  ),
                ],
                automaticallyImplyLeading: false,
              ),
              body: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50),
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            FeaturesBrightness(
                                filter: (e) {
                                  controller.getRates(e);
                                  changeCountry(txt2.text);
                                  setState(() {
                                    currency_from = e;
                                  });
                                },
                                rates: rates,
                                currency: currency_from),
                            Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              child: SizedBox(
                                width: 200,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: txt2,
                                  showCursor: true,
                                  autofocus: false,
                                  autocorrect: false,
                                  onChanged: (text) {
                                    //Todo
                                    changeCountry(text);
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                  ),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      elevation: 10.0,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            FeaturesBrightness(
                                filter: (e) {
                                  changeCountry(txt2.text);
                                  setState(() {
                                    currency_to = e;
                                  });
                                },
                                rates: rates,
                                currency: currency_to),
                            Container(
                              margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                              child: SizedBox(
                                width: 200,
                                child: TextField(
                                  controller: txt,
                                  showCursor: true,
                                  autofocus: false,
                                  autocorrect: false,
                                  readOnly: true,
                                  onChanged: (text) => {
                                    //Todo
                                  },
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                                  ),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        child: RaisedButton(
                          color: fontColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            controller.saveHistory(
                              txt.text,
                              txt2.text,
                              currency_from,
                              currency_to,
                            );
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            showCustomToastOverlay("Saved successfully");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Center(
                              child: Text(
                                'SAVE',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )));
  }
}
