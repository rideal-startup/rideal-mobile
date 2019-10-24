import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PublicTransportEnabler extends StatefulWidget {
  final IconData icon;
  final Function onChange;

  PublicTransportEnabler(this.icon, {this.onChange});

  @override
  _PublicTransportEnablerState createState() => _PublicTransportEnablerState();
}

class _PublicTransportEnablerState extends State<PublicTransportEnabler> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Icon(this.widget.icon, size: 30,),
              ),
              Switch(
                value: enabled,
                activeColor: Colors.pink[200],
                onChanged: (val) {
                  setState(() {this.enabled = val; });
                  if (this.widget.onChange != null) this.widget.onChange(val);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterTransport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PublicTransportEnabler(FontAwesomeIcons.shuttleVan),
          PublicTransportEnabler(FontAwesomeIcons.busAlt),
          PublicTransportEnabler(FontAwesomeIcons.train),
        ],
      )
    );
  }
}
