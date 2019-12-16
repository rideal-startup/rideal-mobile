import 'package:flutter/material.dart';
import 'package:rideal/services/i18n.dart';

class RidealingButton extends StatefulWidget {
  final Function onTap;

  const RidealingButton({Key key, this.onTap}) : super(key: key);

  @override
  _RidealingButtonState createState() => _RidealingButtonState();
}

class _RidealingButtonState extends State<RidealingButton> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
          this.widget.onTap();
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[_imInButton(), _ridealingButton()],
      ),
    );
  }

  Widget _imInButton() {
    return AnimatedContainer(
      height: selected ? 000.0 : 125.0,
      color: selected ? Colors.green : Colors.blue,
      alignment: 
        selected ? Alignment.center : AlignmentDirectional.topCenter,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: Padding(
          padding: const EdgeInsets.only(top: 22.5),
          child: Text(
            I18n.of(context).translate('i-am-in'),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
    );
  }

  Widget _ridealingButton() {
    return AnimatedContainer(
      height: selected ? 125.0 : 0.0,
      color: selected ? Colors.green : Colors.blue,
      alignment:
      selected ? Alignment.topCenter : AlignmentDirectional.topCenter,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      child: Padding(
        padding: const EdgeInsets.only(top: 22.5),
        child: Text(
          "Ridealing!",
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}
