// main.dart

import 'package:flutter/material.dart';
import 'package:rideal/screens/profile/tabs/testtab1.dart';
import 'package:rideal/screens/profile/tabs/testtab2.dart';


void main() {
  runApp(ProfileBody());
}

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit))
              ],
            ),
            title: Text('Flutter Tabs Example'),
          ),
          body: TabBarView(
            children: [
            Testtab1(),
            Testtab2(),
            ],
          ),
        ),
      );
  }
}