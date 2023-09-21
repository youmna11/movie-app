import 'package:flutter/material.dart';
import 'package:movie_app/models/category.dart';

import '../screens/category_item.dart';

class BrowseTab extends StatefulWidget {

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab> {
  var categories = Genres.getCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30,top: 20),
        child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: (){},
                  child: CategoryItem(categories[index],index));
            }),
      ),
    );
  }

}
