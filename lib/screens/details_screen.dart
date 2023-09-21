import 'package:flutter/material.dart';
import 'package:movie_app/shared/styles/colors/app_colors.dart';
import 'package:movie_app/widgets/morelikesection_slider.dart';
import '../models/movie.dart';
import '../shared/network/remote/api.dart';

class DetailsScreen extends StatefulWidget {
  final String name, description, poster, vote, launch_on;

  const DetailsScreen(
      {Key? key,
      required this.name,
      required this.description,
      required this.poster,
      required this.vote,
      required this.launch_on})
      : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  late Future<List<Results>> NewReleasesMovies;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NewReleasesMovies=Api().getNewReleasesMovies();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: blackColor,
      //   title: Text(),
      // ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 217,
              width: 412,
              child: Stack(
                children: [
                  SizedBox(
                    height: 217,
                    width: 412,
                    child: Image.network(
                      widget.poster,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned(
                      top: 0,
                      right: 0,
                      left: 0,
                      bottom: 0,
                      child: Icon(
                        Icons.play_circle,
                        size: 70,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.name,
                style: TextStyle(fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                widget.launch_on,
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w100),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: SizedBox(
                        height: 170,
                        width: 110,
                        child: Image.network(
                          widget.poster,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(child: Icon(Icons.bookmark, size: 38,color: blackColor.withOpacity(0.7),)),
                    Positioned(
                      top: 6,
                      left: 9,
                      child: Icon(Icons.add,size: 20,),)
                  ]),
                  Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10,top: 50),
                        child: Column(
                          children: [
                            Text(widget.description,maxLines: 4,),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: yellowColor,
                                  size: 18,
                                ),
                                Text(widget.vote),
                              ],
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(
              child: FutureBuilder(
                future: NewReleasesMovies,
                builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),
                    );
                  }else if(snapshot.hasData){
                    return MoreLikeSectionSlider(snapshot: snapshot,);
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
