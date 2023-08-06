import 'package:flutter/material.dart';
import 'package:toonflix/models/movie_detail_model.dart';
import 'package:toonflix/services/api_service.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailScreen extends StatefulWidget {
  final String image, title;
  final int id;

  const DetailScreen({
    super.key,
    required this.title,
    required this.image,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;

  List<int> runtimeFormat(int runtime) {
    int hours = (runtime / 60).floor();
    int minutes = runtime % 60;
    return [hours, minutes];
  }

  @override
  void initState() {
    super.initState();
    movie = ApiService.getMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500${widget.image}',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          floatingActionButton: SizedBox(
            width: 300,
            child: FloatingActionButton(
              backgroundColor: Colors.yellow,
              onPressed: () {},
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: const Text(
                'Buy ticket',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: const Text(
              "Back to list",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: FutureBuilder(
              future: movie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 250,
                          ),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RatingBar.builder(
                            initialRating: snapshot.data!.vote / 2,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Text(
                            '${runtimeFormat(snapshot.data!.runtime)[0]}h ${runtimeFormat(snapshot.data!.runtime)[1]}min | ${snapshot.data!.genres}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 45,
                          ),
                          const Text(
                            "Storyline",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            snapshot.data!.overview,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const Center();
              },
            ),
          ),
        ),
      ],
    );
  }
}
