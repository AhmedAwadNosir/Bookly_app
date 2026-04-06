import 'package:bookly_app/core/utils/functions/show_error_dialog.dart';
import 'package:bookly_app/features/books/presentation/wedgits/best_seller_books_list_view_builder.dart';
import 'package:bookly_app/features/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewBlocBuilder extends StatelessWidget {
  const BestSellerListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBestSellerBooksCubit, GetBestSellerBooksState>(
      builder: (context, state) {
        if (state is GetBestSellerBooksFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return SizedBox();
        } else if (state is GetBestSellerBooksSuccess) {
          return BestSellerBooksListViewBuilder(bestSellerBooks: state.books);
        } else {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [SizedBox(height: 180), CircularProgressIndicator()],
          );
        }
      },
    );
  }
}
