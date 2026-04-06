import 'package:bookly_app/core/utils/Errors/api_failure.dart';
import 'package:bookly_app/features/books/data/models/BookModel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class BookRepo {
  Future<Either<Failure, List<BookModel>>> getTopBooks({
    @required String? booksType,
    @required String? filter,
    @required String? orderby,
  });
  Future<Either<Failure, List<BookModel>>> getBestSellerBooks({
    @required String? booksType,
    @required String? filter,
    @required String? orderby,
  });
}
