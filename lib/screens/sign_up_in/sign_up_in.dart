import 'package:flutter/material.dart';
import 'package:rideal/screens/loading/loading.dart';
import 'package:rideal/screens/sign_up_in/sign_in.dart';
import 'package:rideal/screens/sign_up_in/sign_up.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/utils.dart';

class SignUpInPage extends StatefulWidget {
  SignUpInPage({Key key}) : super(key: key);

  @override
  _SignUpInPageState createState() => _SignUpInPageState();
}

class _SignUpInPageState extends State<SignUpInPage> {
  final authSercive = SignInUpService();

  @override
  Widget build(BuildContext context) {
    // If user was already logged in rediret him
    authSercive.isLoggedIn.then((isLoggedIn) {
      if (isLoggedIn)
        Navigator.pushReplacement(
          context,
          FadingRoute(builder: (context) => LoadingScreen())
        );
    });

    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Rideal!'),
        centerTitle: true,
      ),
      body: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                width: screenSize.width,
                child: RaisedButton(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _onPressSignUp(context),
                  color: Colors.blueGrey,
                ),
              ),
              Container(
                width: screenSize.width,
                child: RaisedButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () => _onPressSignIn(context),
                  color: Colors.blueGrey,
                ),
              ),
            ],
          )
        ),
    );
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
