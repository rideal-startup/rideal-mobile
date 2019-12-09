import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/stop.dart';

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
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Icon(
                    this.widget.icon,
                    size: 30,
                  ),
                ),
              ),
              Switch(
                value: enabled,
                activeColor: Colors.pink[200],
                onChanged: (val) {
                  setState(() {
                    this.enabled = val;
                  });
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
<<<<<<< HEAD
  final List<StopType> _toShow = [
    StopType.Bus, StopType.Metro, StopType.Train
  ];
=======
  final List<StopType> _toShow = [StopType.Bus, StopType.Metro, StopType.Tram];
>>>>>>> develop
  final Function onChange;

  FilterTransport({Key key, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      height: 70,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PublicTransportEnabler(
            FontAwesomeIcons.subway,
            onChange: (val) {
              _updateToShow(StopType.Metro, val);
            },
          ),
          PublicTransportEnabler(
            FontAwesomeIcons.bus,
            onChange: (val) {
              _updateToShow(StopType.Bus, val);
            },
          ),
          PublicTransportEnabler(
            FontAwesomeIcons.tram,
            onChange: (val) {
              _updateToShow(StopType.Train, val);
            },
          ),
        ],
      )
    );
=======
        height: 70,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: PublicTransportEnabler(
                FontAwesomeIcons.subway,
                onChange: (val) {
                  _updateToShow(StopType.Metro, val);
                },
              ),
            ),
            Expanded(
              child: PublicTransportEnabler(
                FontAwesomeIcons.bus,
                onChange: (val) {
                  _updateToShow(StopType.Bus, val);
                },
              ),
            ),
            Expanded(
              child: PublicTransportEnabler(
                FontAwesomeIcons.tram,
                onChange: (val) {
                  _updateToShow(StopType.Tram, val);
                },
              ),
            ),
          ],
        ));
>>>>>>> develop
  }

  void _updateToShow(StopType type, bool val) {
    if (!val)
      _toShow.remove(type);
    else
      _toShow.add(type);

    onChange(_toShow);
  }
}
