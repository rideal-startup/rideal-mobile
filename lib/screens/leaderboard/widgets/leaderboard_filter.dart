import 'package:flutter/material.dart';
import 'package:rideal/services/i18n.dart';

class LeaderboardFilter extends StatefulWidget {
  LeaderboardFilter({Key key}) : super(key: key);

  @override
  _LeaderboardFilterState createState() => _LeaderboardFilterState();
}

class _LeaderboardFilterState extends State<LeaderboardFilter> {
  String dropdownValue = 'dropdown-national';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 0, 5),
          child: Text(I18n.of(context).translate('ranking')),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(170, 0, 0, 5),
          child: DropdownButton<String>(
            value: dropdownValue,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.white),
            underline: Container(
              height: 2,
              color: Colors.white,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>["dropdown-national", "dropdown-friends"]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(I18n.of(context).translate(value)),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
