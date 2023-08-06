class MovieModel {
  late final String image, title;
  late final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        image = json['poster_path'],
        id = json['id'];
}
