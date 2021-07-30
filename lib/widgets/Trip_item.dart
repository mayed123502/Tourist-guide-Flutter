import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tourist_guide/models/trip.dart';
import 'package:tourist_guide/providers/TripProvider.dart';
import 'package:tourist_guide/screens/trips_screen.dart';
import 'package:provider/provider.dart';

class tripItem extends StatelessWidget {
  final String imgeUrl;
  final String title;
  final String id;

  final Season season;
  final int duration;
  final TripType tripType;

  tripItem(
      {this.imgeUrl,
      this.title,
      this.id,
      this.season,
      this.duration,
      this.tripType});
  String get seasonText {
    if (season == Season.Winter) {
      return "شتاء";
    }
    if (season == Season.Summer) {
      return "صيف";
    }
    if (season == Season.Spring) {
      return "ربيع";
    }
    if (season == Season.Autumn) {
      return "خريف";
    }
  }

  String get tripTypeText {
    if (tripType == TripType.Activities) {
      return "أنشطة";
    }
    if (tripType == TripType.Exploration) {
      return "استكشاف";
    }
    if (tripType == TripType.Recovery) {
      return "نقاهة";
    }
    if (tripType == TripType.Therapy) {
      return "معالجة";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => tripsScreen(id)),
        ).then((value) {
          print(value);
          if(value!=null) {
            Provider.of<TripProvider>(context,listen: false).Tripdelete(value);
          }
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 7,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imgeUrl,
                    fit: BoxFit.cover,
                    height: 250,
                    width: double.infinity,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(0.8),
                        ],
                        stops: [
                          .6,
                          1
                        ]),
                  ),
                  height: 255,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.family_restroom,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 5),
                      Text("$tripTypeText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.wb_sunny,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 5),
                      Text("$seasonText"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.today,
                        color: Theme.of(context).accentColor,
                      ),
                      SizedBox(width: 5),
                      Text("$duration أيام "),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
