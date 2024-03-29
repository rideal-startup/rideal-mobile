import 'package:flutter/material.dart';
import 'package:rideal/models/city.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/loading/loading.dart';
import 'package:rideal/screens/sign_up_in/sign_up_in.dart';
import 'package:rideal/services/cities.service.dart';
import 'package:rideal/services/sign_in_up.service.dart';
import 'package:rideal/utils.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final cityService = CitiesService();
    
  User user = User();
  List<City> cities = [];
  String dropdownValue;

  @override
  void initState() {
    this.cityService.getAllCities().then((res) {
      this.cities = res;
      dropdownValue = cities[0].id;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (cities.length == 0)
      return Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[200]),
        ),
      );

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
        title: new Text('Sign Up'),
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
                  hintText: 'Username',
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
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Name',
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
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Surname',
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
              DropdownButtonFormField(
                items: this.cities.map((c) {
                  return DropdownMenuItem<String>(
                    value: c.id,
                    child: Text(c.name),
                  );
                }).toList(),
                value: dropdownValue,
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                onSaved: (String city) {
                  user.city = cities.firstWhere((c) => c.id == city);
                },
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'you@example.com',
                  labelText: 'E-mail Address'
                ),
                onSaved: (String email) {
                  user.email = email;
                },
                validator: (value) {
                  Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = RegExp(pattern);
                  if(value.isEmpty) {
                    return "Please enter an e-mail";
                  }
                  if (!regex.hasMatch(value)) {
                    return 'Enter Valid Email';
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
                  if (value.isEmpty) {
                    return "Please enter a password";
                  }
                  if (value.length < 8) {
                    return "Password is too short";
                  }
                  return null;
                },
              ),
              Container(
                width: screenSize.width,
                child: RaisedButton(
                  child: Text(
                    'Sign Up',
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
      SignInUpService loginService = new SignInUpService();
      bool signUpResponse = await loginService.signUp(this.user);
      if(signUpResponse){
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
}