import 'package:flutter/material.dart';
import 'package:movie_app/shared/styles/colors/app_colors.dart';
import 'package:movie_app/tabs/browse.dart';
import 'package:movie_app/tabs/search.dart';
import 'package:movie_app/tabs/watchlist.dart';
import '../models/category.dart';
import '../tabs/home.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    BrowseTab(),
    WatchlistTab()
  ];




  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: primaryColor,
        ),
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage("assets/images/home.png")),
                  label: "HOME",
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage("assets/images/search.png")),
                  label: "SEARCH",
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage("assets/images/browse.png")),
                  label: "BROWSE",
                  backgroundColor: Theme.of(context).primaryColor),
              BottomNavigationBarItem(
                  icon:
                  const ImageIcon(AssetImage("assets/images/watchlist.png")),
                  label: "WATCHLIST",
                  backgroundColor: Theme.of(context).primaryColor),
            ],
          ),
          body: tabs[index],
        ),
      ],
    );
  }

}