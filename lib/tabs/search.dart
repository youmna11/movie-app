import 'package:flutter/material.dart';
import 'package:movie_app/shared/styles/colors/app_colors.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60,left: 10,right: 10),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.white38)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white38),
            borderRadius: BorderRadius.circular(50)
          ),
          prefixIcon: Icon(Icons.search,color: Colors.white38,),
          labelText: "Search",

          labelStyle: TextStyle(
            color: Colors.white38
          ),
          filled: true,
          fillColor: blackColor
        ),
      )
    );
  }
}
