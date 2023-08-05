class MovieModel {
  final String title, image;
  final int id;

  MovieModel.fromJson(Map<String, dynamic> json)
      : title = json['original_title'],
        image = json['poster_path'],
        id = json['id'];
}
