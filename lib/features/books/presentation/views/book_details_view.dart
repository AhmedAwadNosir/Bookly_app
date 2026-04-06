import 'package:bookly_app/features/books/data/models/BookModel.dart';
import 'package:flutter/material.dart';
import '../wedgits/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  static const id = "DescrptionView";
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return BookDetailsViewBody(bookDetails: book);
  }
}
