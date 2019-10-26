import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/line.dart';
import 'package:rideal/models/stop.dart';
import 'package:rideal/screens/line_detail/line_detail.dart';


class LineSelector extends StatefulWidget {
  bool show;
  final Stop stop;

  LineSelector({this.stop, this.show = false});

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
        children: this.widget.stop.lines.map((l) {
          return Transform.translate(
            offset: Offset(offset, 0 ), 
            child: _drawLine(l)
          );
        }).toList()
      ),
    );
  }


  Widget _drawLine(Line l) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.black38,
            ),
            child: Text(
              l.name, 
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Colors.white, 
              ),
            ),
          ),
          RaisedButton(
            color: l.color,
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LineDetailScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(FontAwesomeIcons.subway, color: Colors.white,)
            ) 
          ),
        ],
      ),
    );
  }
}