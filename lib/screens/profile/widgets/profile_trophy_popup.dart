import 'package:flutter/material.dart';
import 'package:rideal/services/i18n.dart';

class TrophyPopUp extends StatefulWidget {
  final Function onFilterPress;

  const TrophyPopUp({Key key, this.onFilterPress}) : super(key: key);
  @override
  _TrophyPopUpState createState() => _TrophyPopUpState();
}

class _TrophyPopUpState extends State<TrophyPopUp> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Container(
        // color: Colors.transparent,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: <Widget>[
            IconButton(
              splashColor: Colors.grey,
              icon: Icon(Icons.filter_list),
              onPressed: this.widget.onFilterPress,
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    hintText:
                        I18n.of(context).translate('search-hint')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
