import 'package:bookly_app/features/books/data/models/BookModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 250,
              child: AspectRatio(
                aspectRatio: 112.5 / 168,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  errorWidget: (context, _, __) {
                    return const Icon(Icons.error, color: Colors.white);
                  },
                  imageUrl: "${bookModel.image}",
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white.withValues(alpha: 0.5),
            ),
            child: const Icon(
              Icons.play_arrow,
              size: 28,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
