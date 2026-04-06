import 'package:bookly_app/features/books/presentation/views/books_viw.dart';
import 'package:bookly_app/features/books/presentation/wedgits/books_view_body.dart';
import 'package:flutter/material.dart';

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes =
      <String, WidgetBuilder>{};
}
