import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Line extends StatelessWidget {
  final Color color;

  const Line({Key key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
          shape: CircleBorder(),
          onPressed: () {},
          color: color,
          textColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Icon(FontAwesomeIcons.subway),
          )),
    );
  }
}

class LineSelector extends StatefulWidget {
  bool show;
  List<Line> lines;
  LineSelector({this.lines = const [], this.show = false});

  @override
  _LineSelectorState createState() => _LineSelectorState();
}

class _LineSelectorState extends State<LineSelector> 
    with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<double> animation;
  double offset = 100;
  
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));

    animation = Tween<double>(begin: offset, end: 0).animate(_controller)
      ..addListener(() {
        setState(() { offset = animation.value; });
      });

    super.initState();
  }

  @override
  void didUpdateWidget(LineSelector oldWidget) {
    if (this.widget.show) {
      _controller.reset();
      _controller.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    if (!this.widget.show)
      return Container();
    
    return Container(
      alignment: Alignment.bottomRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: this.widget.lines.map((l) {
          return Transform.translate(
            offset: Offset(offset, 0 ), 
            child: l
          );
        }).toList()
      ),
    );
  }
}
