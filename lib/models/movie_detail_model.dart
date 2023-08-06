class MovieDetailModel {
  late final String overview, genres;
  late final int runtime;
  late final double vote;

  MovieDetailModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> genreList = [];
    genreList = json['genres'].map((i) => i['name']).toList().cast<String>();

    vote = json['vote_average'];
    overview = json['overview'];
    genres = genreList.join(', ');
    runtime = json['runtime'];
  }
}
