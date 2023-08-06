import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:toonflix/widgets/coming_movie.dart';
import 'package:toonflix/widgets/now_movie.dart';
import 'package:toonflix/widgets/popular_movies.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<MovieModel>> popularMovies = ApiService.getPopluarMovies();
  final Future<List<MovieModel>> nowMovies = ApiService.getNowMovies();
  final Future<List<MovieModel>> comingMovies = ApiService.getComingMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Popular Movies',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
                          child: Row(
                            children: [
                              Expanded(
                                child: makeList(snapshot),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  );
                },
              ),
              FutureBuilder(
                future: nowMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Now in Cinemas',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: Row(
                            children: [
                              Expanded(
                                child: makeList2(snapshot),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center();
                },
              ),
              FutureBuilder(
                future: comingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Coming soon',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 220,
                          child: Row(
                            children: [
                              Expanded(
                                child: makeList3(snapshot),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const Center();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Popular(
          title: movie.title,
          image: movie.image,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 30,
      ),
    );
  }

  ListView makeList2(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Now(
          title: movie.title,
          image: movie.image,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 30,
      ),
    );
  }

  ListView makeList3(AsyncSnapshot<List<MovieModel>> snapshot) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        var movie = snapshot.data![index];
        return Coming(
          title: movie.title,
          image: movie.image,
          id: movie.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 30,
      ),
    );
  }
}
