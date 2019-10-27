// SecondScreen.dart

import 'package:flutter/material.dart';
import 'package:rideal/screens/profile/widgets/profile_trophy_entry.dart';

class TrophyListProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Column(
            children: <Widget>[
              //first
              Container(
      child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[500],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(30),
              ),
              width: MediaQuery.of(context).size.width*0.95,
                child: Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Icon(Icons.monetization_on, size: 40,color:Colors.grey[600] ,),
                  ),
                  
            Expanded(
              child: TextField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.go,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    )//hintText: I18n.of(context).translate('search-hint')),
              ),
            ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Icon(Icons.find_in_page, size: 40,color:Colors.grey[600]),
                  ),
              
                ],
              ),
            ),
          ),
    ),
          ProfileTrophyEntry(
                    name: "Trophy 1",
                    trophy_id:"123",
                    state:"Complete",
                    progress: 1.0,
                    ),
                    ProfileTrophyEntry(
                    name: "Trophy 1",
                    trophy_id:"123",
                    state:"InProgress",
                    progress: 0.5,
                    ),
                    ProfileTrophyEntry(
                    name: "Trophy 1",
                    trophy_id:"123",
                    state:"InProgress",
                    progress: 0.7,
                    ),
                    ProfileTrophyEntry(
                    name: "Trophy 1",
                    trophy_id:"123",
                    state:"InProgress",
                    progress: 0.2,
                    ),
                    ProfileTrophyEntry(
                    name: "Trophy 1",
                    trophy_id:"123",
                    state:"InProgress",
                    progress: 0.9,
                    ),   
            ],
          ),
        ],
      ),
    );
  }
}