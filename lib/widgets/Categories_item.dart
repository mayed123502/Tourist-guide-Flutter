import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:tourist_guide/screens/categories_trips_screen.dart';

class CategoriesScreenWidge extends StatelessWidget {
  final String image;
  final String title;
  final String id;

  CategoriesScreenWidge({this.image, this.title, this.id});
  void pushToTrips(BuildContext ctx) {
    Navigator.push(
      ctx,
      MaterialPageRoute(builder: (_) => CategryTripesScreen(id, title)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15.0),
      onTap: () => pushToTrips(context),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 250,
              )),
          Container(
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Builder(builder: (BuildContext context) {
            return Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
            );
          }),
        ],
      ),
    );
  }
}
