import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourist_guide/models/category.dart';
import 'package:tourist_guide/providers/CategoryProvider.dart';
import 'package:tourist_guide/widgets/Categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Category> categories =
        Provider.of<CategoryProvider>(context,).CategoryList;
    return Scaffold(

        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 10 /10.7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            children: categories.map((e) {
              return CategoriesScreenWidge(image:e.imageUrl ,title: e.title,id: e.id,);
            }).toList(),
          ),
        ));
  }
}
