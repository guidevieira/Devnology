import 'package:Devnology/app/components/buttonNetwork/buttonNetwork.dart';
import 'package:Devnology/app/components/or/or.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Devnology"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final fontColor = Color(0xff22252A);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: Color(0xff03F45C)),
        ),
        brightness: Brightness.dark,
        backgroundColor: fontColor,
        automaticallyImplyLeading: false,
        centerTitle: false,
        actions: [
          FlatButton(
            child: Icon(Icons.more_vert, size: 32, color: Color(0xff03F45C)),
            onPressed: () => {/*actions*/},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: new InputDecoration(
                    hintText: "Username or Email",
                    labelText: "Username or Email",
                    labelStyle: new TextStyle(color: fontColor)),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                decoration: new InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: new TextStyle(color: fontColor)),
              ),
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Ink(
                    color: fontColor,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Center(
                        child: Text(
                          'LOG IN',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Or(),
              SizedBox(height: 40),
              ButtonNetwork(
                fontColor: fontColor,
                img: "http://pngimg.com/uploads/twitter/twitter_PNG34.png",
                title: 'LOGIN WITH TWITTER',
              ),
              SizedBox(height: 30),
              ButtonNetwork(
                fontColor: fontColor,
                img:
                    "http://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19751.png",
                title: 'LOGIN WITH FACEBOOK',
              ),
              SizedBox(height: 30),
              ButtonNetwork(
                fontColor: fontColor,
                img: "http://pngimg.com/uploads/google/google_PNG19635.png",
                title: 'LOGIN WITH GOOGLE',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
