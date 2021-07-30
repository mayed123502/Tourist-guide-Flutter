
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/models/trip.dart';
import 'package:tourist_guide/providers/TripProvider.dart';
import 'package:tourist_guide/widgets/Trip_item.dart';

class CategryTripesScreen extends StatelessWidget {
  final String id;
  final String title;

  CategryTripesScreen(this.id, this.title);

  @override
  Widget build(BuildContext context) {

    Provider.of<TripProvider>(context).filterTrip(id);
    List<Trip> Trips = Provider.of<TripProvider>(context,listen: false).Categoryfilter;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body:  Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              children:Trips.map((e) => tripItem(imgeUrl: e.imageUrl,title: e.title,id: e.id,season: e.season,duration: e.duration,tripType: e.tripType,)).toList() ,
            ),
          )
        ],
      ),
    );
  }
}
