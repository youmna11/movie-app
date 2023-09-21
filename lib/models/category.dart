class CategoryModel {
  List<Genres>? genres;
  CategoryModel({this.genres});
}

class Genres {
  String? id;
  String? name;
  String? image;

  Genres(this.id, this.name,this.image);

  static List<Genres> getCategories() {
    return [
      Genres("28", "Action", "assets/images/action.jpg"),
      Genres("12", "Adventure", "assets/images/Adventure.png"),
      Genres("16", "Animation", "assets/images/animation.jpeg",),
      Genres("35", "Comedy", "assets/images/comedy.jpg"),
      Genres("80", "Crime", "assets/images/crime.jpg"),
      Genres("18", "Drama", "assets/images/drama.jpg"),
      Genres("10751", "Family", "assets/images/family.jpg"),
      Genres("14", "Fantasy", "assets/images/fantasy.jpg"),
      Genres("36", "History", "assets/images/history.jfif"),
      Genres("27", "Horror", "assets/images/horror.jpg"),
      Genres("10749", "Romance", "assets/images/romane.jfif"),
      Genres("878", "Science Fiction", "assets/images/scince fiction.jpg"),
    ];
  }

}