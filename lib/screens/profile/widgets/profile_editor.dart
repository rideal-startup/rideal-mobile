import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/services/users.service.dart';
import 'package:rideal/widgets/circle_image.dart';

class ProfileEditor extends StatefulWidget {
  final User currentUser;

  const ProfileEditor({Key key, this.currentUser}) : super(key: key);
  
  @override
  _ProfileEditorState createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  final userService = UserService(); 
  final _formKey = GlobalKey<FormState>();
  
  User user;

  @override
  void initState() {
    user = widget.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editing profile"),
        actions: <Widget>[
          InkWell(
            onTap: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                this.userService.update(user).then((_) {
                  Navigator.pop(context);
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Icon(Icons.save),
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _header(),
          _form()
        ],
      ),
    );
  }

  Widget _header() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Container(
            alignment: Alignment(0, 0),
            child: CircleImage(
              user.photoLink,
              size: 120,
              isUrl: true
            ),
          ),
        ),

        FlatButton(
          child: Text(
            "Update profile picture", 
            style: TextStyle(color: Colors.pink[200]),
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _form() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
      child: Form(
        key: this._formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText: "Username"
                ),
                initialValue: user.username,
                keyboardType: TextInputType.text,
                onSaved: (String username) {
                  user.username = username;
                },
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email"
                ),
                initialValue: user.email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (String email) {
                  user.email = email;
                },
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
            ),
            TextFormField(
              initialValue: "600483754",
              decoration: InputDecoration(
                hintText: "693885027",
                labelText: "Phone Number"
              ),
              keyboardType: TextInputType.text,
              onSaved: (String phone) {
              },
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter a phone number";
                }
                
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}