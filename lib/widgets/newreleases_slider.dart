import 'package:flutter/material.dart';
import 'package:movie_app/screens/details_screen.dart';
import 'package:movie_app/shared/components/constants.dart';
import '../shared/styles/colors/app_colors.dart';

class NewReleasesSlider extends StatelessWidget {
  const NewReleasesSlider({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      color: blackColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25, left: 15),
            child: Text(
              "New Releases",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Stack(children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailsScreen(
                          name: '${snapshot.data![index].originalTitle}',
                          poster:
                          '${Constants.imagePath}${snapshot.data![index].posterPath}',
                          description: '${snapshot.data![index].overview}',
                          vote: '${snapshot.data![index].voteAverage}',
                          launch_on:  '${snapshot.data![index].releaseDate}',
                        )));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: SizedBox(
                          height: 150,
                          width: 100,
                          child: Image.network(
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                            '${Constants.imagePath}${snapshot.data![index].posterPath}',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        child: Icon(Icons.bookmark,
                            size: 38, color: blackColor.withOpacity(0.7))),
                    Positioned(
                      top: 6,
                      left: 9,
                      child: Icon(Icons.add,size: 20,),)
                  ]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
