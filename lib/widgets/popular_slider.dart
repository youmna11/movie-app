import 'package:flutter/material.dart';
import 'package:movie_app/shared/styles/colors/app_colors.dart';

import '../screens/details_screen.dart';
import '../shared/components/constants.dart';

class PopularSlider extends StatelessWidget {
  const PopularSlider({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 289,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return Stack(
                children:[ InkWell(
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
                  child: Container(
                    height: 289,
                    width: 412,
                    child: Stack(children: [
                      SizedBox(
                        height: 217,
                        width: 412,
                        child: Image.network(
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          '${Constants.imagePath}${snapshot.data![index]
                              .posterPath}',
                        ),
                      ),
                      Positioned(
                          top: -60,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Icon(
                            Icons.play_circle,
                            size: 70,
                          )),
                      Positioned(
                        left: 20,
                        top: 130,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: SizedBox(
                              height: 170,
                              width: 110,
                              child: Image.network(
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                '${Constants.imagePath}${snapshot.data![index]
                                    .posterPath}',
                              ),
                            ),
                          ),
                          Positioned(child: Icon(Icons.bookmark, size: 38,color: blackColor.withOpacity(0.7),)),
                          Positioned(
                            top: 6,
                            left: 9,
                            child: Icon(Icons.add,size: 20,),)
                        ]),
                      )
                    ]),
                  ),
                ),
                  Positioned(
                    top: 230,
                    left: 140,
                    child:  Text(
                    '${snapshot.data![index].originalTitle}',
                    style: TextStyle(fontSize: 15),
                  ),)
              ]
              );
            },
          ),
        ),
      ],
    );
  }
}
