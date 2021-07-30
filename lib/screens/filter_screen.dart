import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/providers/TripProvider.dart';
import 'package:tourist_guide/widgets/drawer.dart';

class FilersScreen extends StatefulWidget {
  @override
  _FilersScreenState createState() => _FilersScreenState();
}

class _FilersScreenState extends State<FilersScreen> {
  var _isInSommer = false;

  var _isInWinter = false;

  var _isInFamily = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("الفلترة"),
          actions: [
            FlatButton(
              onPressed: () {
                Provider.of<TripProvider>(context, listen: false)
                    .filters(_isInSommer, _isInWinter, _isInFamily);
              },
              child: Text("done"),
            ),
          ],
        ),
        drawer: Drawers(),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView(
                children: [
                  SwitchListTile(
                    title: Text("الرحلات الصيفية"),
                    subtitle: Text("اظهار الرحلات في فصل الصيف فقط "),
                    value: _isInSommer,
                    onChanged: (newVal) {
                      setState(() {
                        _isInSommer = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("الرحلات الشتوية"),
                    subtitle: Text("اظهار الرحلات في فصل الشتاء فقط "),
                    value: _isInWinter,
                    onChanged: (newVal) {
                      setState(() {
                        _isInWinter = newVal;
                      });
                    },
                  ),
                  SwitchListTile(
                    title: Text("الرحلات العائلية"),
                    subtitle: Text("اظهار الرحلات في فصل الصيف فقط "),
                    value: _isInFamily,
                    onChanged: (newVal) {
                      setState(() {
                        _isInFamily = newVal;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
