import 'package:bookly_app/core/utils/functions/show_error_dialog.dart';
import 'package:bookly_app/features/books/presentation/wedgits/top_books_list_view_builder.dart';
import 'package:bookly_app/features/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopBooksLIstViewBuilderBlocConsumer extends StatelessWidget {
  const TopBooksLIstViewBuilderBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTopBooksCubit, GetTopBooksState>(
      builder: (context, state) {
        if (state is GetTopBooksFailure) {
          showErrorDialog(context: context, errorMessage: state.errorMessage);
          return const SizedBox();
        } else if (state is GetTopBooksSuccess) {
          return TopBooksListViewBuilder(books: state.books);
        } else {
          return const SizedBox(
            height: 240,
            width: double.infinity,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
