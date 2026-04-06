import 'package:bookly_app/features/books/data/models/books_filter_option.dart';
import 'package:bookly_app/features/books/functions/open_filter_dialog.dart';
import 'package:bookly_app/features/books/presentation/wedgits/best_seller_list_view_bloc_builder.dart';
import 'package:bookly_app/features/books/presentation/wedgits/top_books_list_view_bloc_builder.dart';
import 'package:bookly_app/features/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:bookly_app/features/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksViewBody extends StatefulWidget {
  const BooksViewBody({super.key});

  @override
  State<BooksViewBody> createState() => _BooksViewBodyState();
}

class _BooksViewBodyState extends State<BooksViewBody> {
  static const id = "booksview";
  @override
  void initState() {
    BlocProvider.of<GetTopBooksCubit>(context).getTopBooks();
    BlocProvider.of<GetBestSellerBooksCubit>(context).getBestSellerBooks();
    super.initState();
  }

  BooksFilterOptions _currentFilter = BooksFilterOptions(
    bookType: "programing",
    bookFilter: "free-ebooks",
    orderBy: "newst",
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                      onPressed: () {
                        openFilterDialog(context, (filter) {
                          setState(() {
                            _currentFilter = filter;
                            // apply filter to your data source
                          });
                        }, _currentFilter);
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Filter",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                          Icon(Icons.filter_alt_outlined,
                              size: 22, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: TopBooksLIstViewBuilderBlocConsumer(),
            )),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "BestSeller",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: Padding(
              padding: EdgeInsets.only(left: 16),
              child: BestSellerListViewBlocBuilder(),
            )),
          ],
        ),
      ),
    );
  }
}
