import 'package:flutter/material.dart';
import 'package:tourist_guide/screens/categories_screen.dart';
import 'package:tourist_guide/screens/filter_screen.dart';
import 'package:tourist_guide/screens/taps_screen.dart';

class Drawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(color: Theme.of(context).accentColor),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "دليلك السياحي",
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            alignment: Alignment.bottomCenter,
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => TabsScreen()));
            },
            leading: Icon(
              Icons.badge,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'الرحلات',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'ElMessiri',
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => FilersScreen()));
            },
            leading: Icon(
              Icons.replay,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              'الفلترة',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'ElMessiri',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
