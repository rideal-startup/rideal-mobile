import 'package:flutter/material.dart';
import 'package:rideal/models/stop.dart';

class StopAutoComplete extends StatefulWidget {
  final List<Stop> stops;
  final Function onSelected;

  const StopAutoComplete({Key key, this.stops, this.onSelected}) : super(key: key);

  @override
  StopAutoCompleteState createState() => StopAutoCompleteState();
}

class StopAutoCompleteState extends State<StopAutoComplete> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Card(
        child: AnimatedContainer(
          duration: Duration(microseconds: 500),
          height: 200,
          child: SingleChildScrollView(
            child: Column(
                children: this.widget.stops
                    .map((s) => InkWell(
                      child: ListTile(title: Text(s.name)),
                      onTap: () {
                        this.widget.onSelected(s);
                      },
                    ))
                    .toList()),
          ),
        ),
      ),
    );
  }
}
