import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String path;
  final bool isUrl;
  final double size;

  CircleImage(this.path, {this.size = 80.0, this.isUrl = false});

  @override
  Widget build(BuildContext context) {
    final imageW = !isUrl ? AssetImage(path): NetworkImage(path);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: imageW
        )
      )
    );
  }
}