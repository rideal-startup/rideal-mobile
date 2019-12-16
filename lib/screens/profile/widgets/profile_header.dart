import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/widgets/circle_image.dart';

class ProfileHeader extends StatelessWidget {
  final User currentUser;
  final int nFriends;
  final Function onFriendsTap;

  const ProfileHeader({
    Key key, 
    this.currentUser,
    this.nFriends,
    this.onFriendsTap

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 25, bottom: 10),
                child: CircleImage(
                  currentUser.photoLink,
                  size: 90,
                  isUrl: true
                ),
              ),
              _textInfo(10, "Awards"),
              _textInfo(nFriends, "Friends", onTap: this.onFriendsTap),
              _textInfo(currentUser.points, "Score")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                currentUser.name + ' ' + currentUser.surname,
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
              Text(
                '@' + currentUser.username,
                style: TextStyle(
                    fontSize: 15.0,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _textInfo(int number, String description, {Function onTap}) {
    return InkWell(
        onTap: () {
          if (onTap != null)
            onTap();
        },
        child: Padding(
        padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                number.toString(), 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(description)
            ],
          ),
      ),
    );
  }
}

