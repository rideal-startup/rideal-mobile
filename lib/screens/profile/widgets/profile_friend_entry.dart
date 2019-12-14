
import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/widgets/circle_image.dart';

class ProfileFriendEntry extends StatelessWidget {
  final String state;
  final User user;

  const ProfileFriendEntry({Key key, this.state, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CircleImage(
                'assets/images/profile.jpg',
                size: 60,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(user.username),
                ),
                Text(
                  user.name + ' '+ user.surname,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            _button()
          ],
        ),
      ),
    );
  }

  Widget _button() {
    if (state == 'Pending')
      return Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            _raisedButton("Accept", Colors.pink[200], () {}),
            _raisedButton("Cancel", Colors.transparent, () {}),
          ],
        ),
      );
    return Container();
    
  }

  Widget _raisedButton(String text, Color color, Function onPressed) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: 30,
        width: 80,
            child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(color: Colors.grey[50])
          ),
          color: color,
          child: Text(text, style: TextStyle(fontSize: 10),),
          onPressed: onPressed,
        ),
      ),
    );
  }
}