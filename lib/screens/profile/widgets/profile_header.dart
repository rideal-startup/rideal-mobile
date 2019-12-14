import 'package:flutter/material.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/widgets/circle_image.dart';

class ProfileHeader extends StatelessWidget {
  final User currentUser;
  
  const ProfileHeader({
    Key key, this.currentUser,
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
                padding: const EdgeInsets.only(right: 35, bottom: 10),
                child: CircleImage(
                  'assets/images/profile.jpg',
                  size: 90,
                ),
              ),
              _textInfo(10, "Awards"),
              _textInfo(10, "Friends"),
              _textInfo(currentUser.points, "Score")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Guillermo Diaz',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
              Text(
                '@willyrexYT',
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

  Widget _textInfo(int number, String description) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
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
    );
  }
}

