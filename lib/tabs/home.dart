import 'package:flutter/material.dart';
import 'package:movie_app/shared/network/remote/api.dart';
import 'package:movie_app/shared/styles/colors/app_colors.dart';
import 'package:movie_app/widgets/newreleases_slider.dart';
import 'package:movie_app/widgets/popular_slider.dart';
import 'package:movie_app/widgets/recomended_slider.dart';

import '../models/movie.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late Future<List<Results>> NewReleasesMovies;
  late Future<List<Results>> TopRatedMovies;
  late Future<List<Results>> PopularMovies;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NewReleasesMovies=Api().getNewReleasesMovies();
    TopRatedMovies=Api().getTopRatedMovies();
    PopularMovies=Api().getPopularMovies();


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: FutureBuilder(
              future: PopularMovies,
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){
                  return PopularSlider(snapshot: snapshot,);
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 30,),
          SizedBox(
            child: FutureBuilder(
              future: NewReleasesMovies,
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){
                  return NewReleasesSlider(snapshot: snapshot,);
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          SizedBox(height: 30,),
          SizedBox(
            child: FutureBuilder(
              future: TopRatedMovies,
              builder: (context, snapshot) {
                if(snapshot.hasError){
                  return Center(child: Text(snapshot.error.toString()),
                  );
                }else if(snapshot.hasData){
                  return RecomendedSlider(snapshot: snapshot,);
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),

        ],
        ),
      ),
    );
  }
}
