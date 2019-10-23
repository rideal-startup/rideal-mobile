import 'package:flutter/material.dart';
import 'package:rideal/services/i18n.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      right: 15,
      left: 15,
      child: Container(
        // color: Colors.transparent,
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: <Widget>[
            IconButton(
              splashColor: Colors.grey,
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  hintText: AppLocalizations.of(context).translate('search-hint')
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
