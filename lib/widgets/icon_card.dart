import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final Widget child;
  final Image icon;

  const IconCard(
      {this.startColor, this.endColor, this.child, this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
          padding:
              const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: endColor.withOpacity(0.6),
                    offset: const Offset(1.1, 4.0),
                    blurRadius: 8.0),
              ],
              gradient: LinearGradient(
                colors: [startColor, endColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(54.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 54, left: 16, right: 16, bottom: 8),
              child: child,
            ),
          )),
      Positioned(
        top: 5,
        left: 0,
        child: Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          alignment: Alignment(0, 0),
          child: icon,
        ),
      ),
    ]);
  }
}
