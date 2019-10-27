import 'package:flutter/material.dart';
import 'package:rideal/widgets/circle_image.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                child: CircleImage('assets/images/profile.jpg'),
              
            ),
            Container(
              child: Text(
                'Guillermo Diaz',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat'),
              ),
            ),
            Container(
                child: Text(
              '@willyrexYT',
              style: TextStyle(
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Montserrat'),
            )),
            /*Container(
                height: 30.0,
                width: 200,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.grey,
                  color: Colors.grey,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        'Manage Friends',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Montserrat'),
                      ),
                    ),
                  ),
                )),*/
          ],
        )
      ],
    );
  }
}

class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
