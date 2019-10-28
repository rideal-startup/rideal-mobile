import 'package:flutter/material.dart';
import 'package:rideal/widgets/circle_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: CircleImage(
            'assets/images/profile.jpg',
            size: 100,
          ),
        ),
        Text(
          'Guillermo Diaz',
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ),
        Text(
          '@willyrexYT',
          style: TextStyle(
              fontSize: 17.0,
              fontStyle: FontStyle.italic,
              fontFamily: 'Montserrat'),
        ),
      ],
    );
  }
}

