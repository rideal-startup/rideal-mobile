import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/loading/loading.dart';
import 'package:rideal/screens/sign_up_in/sign_up_in.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/utils.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pushReplacement(
            context,
            FadingRoute(builder: (context) => SignUpInPage()),
          ),
        ),
        automaticallyImplyLeading: true,
        title: new Text('Sign In'),
        centerTitle: true,
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: this._formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'mRajoy',
                  labelText: 'Username'
                ),
                onSaved: (String username) {
                  user.username = username;
                },
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please enter a username";
                  }
                  return null;
                },
              ),
              new TextFormField(
                obscureText: true,
                decoration: new InputDecoration(
                  hintText: 'Password',
                  labelText: 'Enter your password'
                ),
                onSaved: (String password) {
                  user.password = password;
                },
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please enter a password";
                  }
                  if(value.length < 8) {
                    return "Password is too short";
                  }
                  return null;
                },
              ),
              new Container(
                width: screenSize.width,
                child: new RaisedButton(
                  child: new Text(
                    'Sign In',
                    style: new TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: _submit,
                  color: Colors.blueGrey,
                ),
                margin: new EdgeInsets.only(
                  top: 20.0
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      SignInUpService loginService = new SignInUpService();
      bool logInResponse = await loginService.login(this.user);
      if(logInResponse){
        Navigator.pushReplacement(
          context,
          FadingRoute(builder: (context) => LoadingScreen()),
        );
      }
    }
  }
}