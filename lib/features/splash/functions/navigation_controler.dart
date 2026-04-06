import 'package:bookly_app/features/books/presentation/views/books_viw.dart';
import 'package:flutter/material.dart';

navigationControler(BuildContext context) {
  Future.delayed(
    const Duration(seconds: 3),
    () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BooksViw(),
          ));
    },
  );
}
