
import 'package:flutter/material.dart';

class ProfileInfoEntry extends StatelessWidget {
  final String _header;
  final String _info;
  final IconData _icon;

  const ProfileInfoEntry({Key key, icon, header, info}) : this._icon = icon, this._header = header, this._info = info, super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[600],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
              ),
              width: MediaQuery.of(context).size.width*0.95,
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Icon(this._icon, size: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(this._header+":"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                    child: Text(this._info),
                  ),
                ],
              ),
            ),
          ),
    );
  }
}