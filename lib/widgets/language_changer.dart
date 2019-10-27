import 'package:flutter/material.dart';
import 'package:rideal/services/i18n.dart';
import 'package:rideal/utils.dart';
import 'dart:ui' as ui;

class LanguageChanger extends StatefulWidget {
  @override
  _LanguageChangerState createState() => _LanguageChangerState();
}

class _LanguageChangerState extends State<LanguageChanger> {
  String radioValue;

  @override
  void initState() {
    radioValue = localeSubject.hasValue 
                  ? localeSubject.value.languageCode 
                  : ui.window.locale.languageCode;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(I18n.of(context).translate('language')),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(I18n.of(context).translate('spanish')),
              Radio(
                value: 'es',
                groupValue: radioValue,
                onChanged: _handleRadioChange,
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(I18n.of(context).translate('english')),
              Radio(
                value: 'en',
                groupValue: radioValue,
                onChanged: _handleRadioChange,
              )
            ],
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(I18n.of(context).translate('close')),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  void _handleRadioChange(String val) {
    setLocale(val);
    setState(() { radioValue = val; });
  }
}