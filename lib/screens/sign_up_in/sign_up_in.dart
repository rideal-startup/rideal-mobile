import 'package:flutter/material.dart';
import 'package:rideal/screens/sign_up_in/sign_in.dart';
import 'package:rideal/screens/sign_up_in/sign_up.dart';
import 'package:rideal/utils.dart';

class SignUpInPage extends StatefulWidget {
  SignUpInPage({Key key}) : super(key: key);

  @override
  _SignUpInPageState createState() => _SignUpInPageState();
}

class _SignUpInPageState extends State<SignUpInPage> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Rideal!'),
        centerTitle: true,
      ),
      body: Container(
        padding: new EdgeInsets.all(20.0),
        child: Column (
          children: <Widget>[
            new Container (
            width: screenSize.width,
            child: new RaisedButton(
              child: new Text(
              'Sign Up',
                style: new TextStyle(
                  color: Colors.white
                ),
              ),
            onPressed: () => _onPressSignUp(context),
            color: Colors.blueGrey,
            ),),
            new Container (
            width: screenSize.width,
            child: new RaisedButton(
              child: new Text(
              'Sign In',
                style: new TextStyle(
                  color: Colors.white
                ),
              ),
            onPressed: () => _onPressSignIn(context),
            color: Colors.blueGrey,
            ),),
          ],)
    ),);
  }
}

void _onPressSignUp(BuildContext context) {
  Navigator.pushReplacement(
    context,
    FadingRoute(builder: (context) => SignUpPage()),
  );
}

void _onPressSignIn(BuildContext context) {
  Navigator.pushReplacement(
    context,
    FadingRoute(builder: (context) => SignInPage()),
  );
}