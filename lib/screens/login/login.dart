import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/services/login.service.dart';
import 'package:rideal/enviroment/cities.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  User user = User();
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
              ),
              new DropdownButtonFormField(
                items: Cities.cities.map(
                  (key,value) {
                    return MapEntry(
                      value,
                      DropdownMenuItem<String>(
                        value: value,
                        child: Text(key),
                        ));
                  }).values.toList(),
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
    _formKey.currentState.save();
    LoginService loginService = new LoginService();
    bool resp = await loginService.login(this.user);
    print(resp);
  }
}