import 'package:flutter/material.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Now extends StatelessWidget {
  final String title, image;
  final int id;

  const Now({
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
            ));
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ],
              ),
              width: 250,
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500$image',
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
