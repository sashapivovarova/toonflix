class MovieDetailModel {
  final String image, title, vote, overview, genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : image = json['poster_path'],
        title = json['original_title'],
        vote = json['vote_average'],
        overview = json['overview'],
        genres = json['genres'];
}
