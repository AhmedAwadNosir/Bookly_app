import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/books/data/models/BookModel.dart';
import 'package:bookly_app/features/books/data/repos/book_repo_impl.dart';
import 'package:meta/meta.dart';
part 'get_best_seller_books_state.dart';

class GetBestSellerBooksCubit extends Cubit<GetBestSellerBooksState> {
  GetBestSellerBooksCubit(this.bookRepo) : super(GetBestSellerBooksInitial());
  final BookRepoImpl bookRepo;
  Future<void> getBestSellerBooks({
    @required String? booksType,
    @required String? filter,
    @required String? orderby,
  }) async {
    emit(GetBestSellerBooksLoading());
    var result = await bookRepo.getBestSellerBooks(
      booksType: booksType,
      filter: filter,
      orderby: orderby,
    );
    result.fold(
      (failure) =>
          emit(GetBestSellerBooksFailure(errorMessage: failure.errorMessage)),
      (books) => emit(GetBestSellerBooksSuccess(books: books)),
    );
  }
}
