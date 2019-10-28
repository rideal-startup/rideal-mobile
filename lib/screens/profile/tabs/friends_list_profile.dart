// SecondScreen.dart

import 'package:flutter/material.dart';
import 'package:rideal/screens/profile/widgets/profile_friend_entry.dart';

class FriendsListProfile extends StatelessWidget {
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
                    child: Icon(Icons.person_add, size: 40,color:Colors.grey[600] ,),
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
                    padding: const EdgeInsets.fromLTRB(3, 3, 3, 3),
                    child: Icon(Icons.add, size: 40,color:Colors.grey[600]),
                  ),
              
                ],
              ),
            ),
          ),
    ),
          ProfileFriendEntry(
                    name: "Juan Lasousa",
                    userId:"123",
                    state:"Pending",
                    icon: Icons.account_circle,
                    ),
                    ProfileFriendEntry(
                    name: "Paquito Palotes",
                    userId:"465",
                    state:"WaitingResponce",
                    icon: Icons.account_circle
                    ),
                    ProfileFriendEntry(
                    name: "Oscar Toxic",
                    userId:"221",
                    state:"Friend",
                    icon: Icons.account_circle
                    ),
                    ProfileFriendEntry(
                    name: "Adrian Mereira",
                    userId:"555",
                    state:"Friend",
                    icon: Icons.account_circle
                    ),
                    ProfileFriendEntry(
                    name: "Octavi Lopez",
                    userId:"567",
                    state:"Friend",
                    icon: Icons.account_circle,
                    ),
                    ProfileFriendEntry(
                    name: "Yuri Smirnof",
                    userId:"567",
                    state:"Friend",
                    icon: Icons.account_circle,
                    ),
                    ProfileFriendEntry(
                    name: "Vostok Smirnof",
                    userId:"567",
                    state:"Friend",
                    icon: Icons.account_circle,
                    ),    
            ],
          ),
        ],
      ),
    );
  }
}