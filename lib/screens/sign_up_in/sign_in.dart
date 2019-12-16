import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    return Scaffold(
      appBar: AppBar(
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
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: this._formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
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
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
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
              Container(
                width: screenSize.width,
                child: RaisedButton(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  onPressed: _submit,
                  color: Colors.blueGrey,
                ),
                margin: EdgeInsets.only(
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
      SignInUpService loginService = SignInUpService();
      bool logInResponse = await loginService.login(this.user);
      if (logInResponse){
        Navigator.pushReplacement(
          context,
          FadingRoute(builder: (context) => LoadingScreen()),
        );
      } else {
        Fluttertoast.showToast(
          msg: "Invalid credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.redAccent,
          textColor: Colors.black,
          fontSize: 16.0
        );
      }
    }
  }
}