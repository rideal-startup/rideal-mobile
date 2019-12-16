import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rideal/models/city.dart';
import 'package:rideal/models/user.dart';
import 'package:rideal/screens/profile/widgets/profile_info_entry.dart';
import 'package:rideal/services/i18n.dart';
import 'package:rideal/services/users.service.dart';

class BasicINfoProfile extends StatelessWidget {

  UserService userService = UserService();
  User currentUser = User(
    email: 'fsadf',
    name: 'fasdfas',
    city: City(),
    points: 99,
    friends: List<String>(),

  ); // TODO: LOAD USER

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        // shrinkWrap: true,
        // physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: <Widget>[
              //first
              ProfileInfoEntry(
                  header: I18n.of(context).translate("E-mail"),
                  info: currentUser?.email,// "harrydickinson@gmail.com",
                  icon: Icons.email,
                  modificable: true,
                  ),
              ProfileInfoEntry(
                  header: I18n.of(context).translate("City"),
                  info: currentUser?.city, // "Lleida",
                  icon: Icons.location_city,
                  modificable: true,
                  ),
              ProfileInfoEntry(
                  header: I18n.of(context).translate("Score"),
                  info: currentUser?.points.toString(), //"100",
                  modificable: false,
                  icon: Icons.score),
              ProfileInfoEntry(
                header: I18n.of(context).translate("Friends"),
                info: currentUser?.friends?.length.toString(), // "5",
                icon: Icons.people,
                modificable: false,
              ),
              /*ProfileInfoEntry(
                header: I18n.of(context).translate("Trophys"),
                info: "3",
                icon: FontAwesomeIcons.award,
              ),
              ProfileInfoEntry(
                header: I18n.of(context).translate("Transports-rided"),
                info: "43",
                icon: Icons.train,
              ),*/
              Container(
                height: 100,
                //right: 10,
                //bottom: 15,
                child: FloatingActionButton(
                  child: Icon(Icons.save),
                  //Widget to display inside Floating Action Button, can be `Text`, `Icon` or any widget.
                  onPressed: () {
                    saveUserChanges();
                    //Code to execute when Floating Action Button is clicked
                    //...
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void saveUserChanges(){
      this.userService.saveUser(this.currentUser);
    }
}
