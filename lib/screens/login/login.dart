import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/enviroment/cities.dart';
import 'package:rideal/services/sign_in_up.service.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
  String dropdownValue = "/cities/5dd043e25043225f571cc6ef";
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Login'),
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
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'Pablo',
                  labelText: 'Name'
                ),
                onSaved: (String name) {
                  user.name = name;
                },
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please enter a name";
                  }
                  return null;
                },
              ),
              new TextFormField(
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  hintText: 'Abascal',
                  labelText: 'Surname'
                ),
                onSaved: (String surname) {
                  user.surname = surname;
                },
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please enter a Surname";
                  }
                  return null;
                },
              ),
              new DropdownButtonFormField(
                items: Cities.cities.map(
                  (key,value) {
                    return MapEntry(
                      key,
                      DropdownMenuItem<String>(
                        value: value,
                        child: Text(key),
                        ));
                  }).values.toList(),
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                onSaved: (String city) {
                  user.city = city;
                },
              ),
              new TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: new InputDecoration(
                  hintText: 'you@example.com',
                  labelText: 'E-mail Address'
                ),
                onSaved: (String email) {
                  user.email = email;
                },
                validator: (value) {
                  Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if(value.isEmpty) {
                    return "Please enter an e-mail";
                  }
                  if (!regex.hasMatch(value)) {
                    return 'Enter Valid Email';
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
                    'Sign Up',
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
      bool signUpResp = await loginService.signUp(this.user);
      print(signUpResp);
      bool logInRespo = await loginService.login(this.user);
      print(logInRespo);
    }
  }
}