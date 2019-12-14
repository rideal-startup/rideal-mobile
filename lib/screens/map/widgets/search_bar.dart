import 'package:flutter/material.dart';
import 'package:rideal/services/i18n.dart';

class SearchBar extends StatefulWidget {
  final Function onTextUpdate;
  final TextEditingController controller;

  const SearchBar({
    Key key, 
    this.onTextUpdate,
    this.controller}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  
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
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            Expanded(
              child: TextField(
                controller: widget.controller,
                textCapitalization: TextCapitalization.characters,
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                onChanged: this.widget.onTextUpdate,
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
