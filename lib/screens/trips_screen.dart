import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/models/trip.dart';
import 'package:tourist_guide/providers/TripProvider.dart';

class tripsScreen extends StatelessWidget {
  final String id;

  tripsScreen(this.id);
  int count = 0;
  @override
  Widget build(BuildContext context) {
    Trip trip = Provider.of<TripProvider>(
      context,
    ).Tripdidtalse(id);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(trip.title != null ? trip.title : ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              trip.imageUrl,
              height: 260,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "الأنشطة",
                style: Theme.of(context).textTheme.headline5,
              ),
              alignment: Alignment.centerRight,
            ),
            Container(
              height: 200,
              width: 320,
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueAccent)),
              child: ListView(
                children: trip.activities.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        e,
                      ),
                      Divider()
                    ],
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "البرنامج اليومي",
                style: Theme.of(context).textTheme.headline5,
              ),
              alignment: Alignment.centerRight,
            ),
            Container(
              height: 200,
              width: 320,
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.blueAccent)),
              child: ListView(
                children: trip.program.map((e) {
                  count++;
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          e,
                        ),
                        leading: Container(
                          width: 50,
                          height: 50,
                          child: Center(child: Text("يوم $count")),
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            borderRadius: BorderRadius.circular(90),
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {


            Navigator.of(context).pop(id);

        },
      ),
    );
  }
}
