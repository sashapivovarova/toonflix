import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Popular extends StatelessWidget {
  final String image, title;
  final int id;

  const Popular({
    super.key,
    required this.title,
    required this.image,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              image: image,
              id: id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            width: 340,
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500$image',
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
