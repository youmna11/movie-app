import 'package:flutter/material.dart';
import 'package:movie_app/models/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.genres,this.index);

  int index;
  Genres genres;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
      Container(
      height: 110,
      width: 158,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Image.asset('${genres.image}',
      fit: BoxFit.fill,),
    ),
        Padding(
          padding: const EdgeInsets.only(left: 50,top: 40),
          child: Text("${genres.name}"),
        )
    ]
    );
  }
}
