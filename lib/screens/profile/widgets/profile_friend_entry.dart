
import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/widgets/circle_image.dart';

class ProfileFriendEntry extends StatelessWidget {
  final String state;
  final User user;

  final Function onAdd;
  final Function onAccept;
  final Function onCancel;
  
  const ProfileFriendEntry({
    Key key, 
    this.state, 
    this.user, 
    this.onAdd, 
    this.onAccept, 
    this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fullName = user.name + ' ' + user.surname;
    if (state == 'Pending' && fullName.length > 10)
      fullName = fullName.substring(0, 10) + '...';

    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CircleImage(
                user.photoLink,
                size: 60,
                isUrl: true
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
                  fullName,
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
            _raisedButton("Accept", Colors.pink[200], () {
              if (this.onAccept != null)
                this.onAccept();
            }),
            _raisedButton("Cancel", Colors.transparent, () {
              if (this.onCancel != null)
                this.onCancel();
            }),
          ],
        ),
      );
    if (state == 'None')
      return Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: _raisedButton("Add", Colors.pink[200], () {
          if (this.onAdd != null)
            this.onAdd();
        }),
      );
    if (state == 'Friend')
      return Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: _raisedButton("Delete", Colors.pink[200], () {
          if (this.onAdd != null)
            this.onAdd();
        }),
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