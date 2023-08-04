class MovieDetailModel {
  final String poster, title, vote, overview, genres;

  MovieDetailModel.fromJson(Map<String, dynamic> json)
      : poster = json['poster_path'],
        title = json['original_title'],
        vote = json['vote_average'],
        overview = json['overview'],
        genres = json['genres'];
}
