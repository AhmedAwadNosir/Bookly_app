import 'package:bookly_app/core/utils/AppColors.dart';
import 'package:bookly_app/core/utils/app_routes.dart';
import 'package:bookly_app/features/books/data/repos/book_repo_impl.dart';
import 'package:bookly_app/features/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:bookly_app/features/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'package:bookly_app/features/splash/presentation/views/splach_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const BookleyApp());
}

class BookleyApp extends StatelessWidget {
  const BookleyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetTopBooksCubit(BookRepoImpl())),
        BlocProvider(
          create: (context) => GetBestSellerBooksCubit(BookRepoImpl()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: AppColors.primaryColor,
            brightness: Brightness.dark),
        routes: AppRoutes.routes,
        home: const SplachView(),
      ),
    );
  }
}
