import 'package:bookly_app/features/books/data/models/books_filter_option.dart';
import 'package:bookly_app/features/books/states_manager/get_best_seller_books/get_best_seller_books_cubit.dart';
import 'package:bookly_app/features/books/states_manager/get_top_books/get_top_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void openFilterDialog(
  BuildContext context,
  Function(BooksFilterOptions) onApply,
  BooksFilterOptions currentFilter,
) {
  final Map<String, String> currnetFiletrKeyesOnArabic = {
    "البرمجة": "programing",
    "رومانسيّات": "romance",
    "روايات غموض": "mystery",
    "خيال": "fantasy",
    "خيال علمي": "sciencefiction",
    "روايات تاريخيّة": "historicalfiction",
    "سيرة ذاتيّة": "biography",
    "تطوير الذات": "selfhelp",
    "شبابي": "youngadult",
    "جريمة حقيقية": "truecrime",
    "أطفال": "children",
    "الأحدث": "newest",
    "الأكثر صلة": "relevance",
    "كتب إلكترونيّة مجانية": "free-ebooks",
    "كتب إلكترونيّة مدفوعة": "paid-ebooks",
    "كتب إلكترونيّة": "ebooks",
    "نوع الكتاب": "BookType",
    "نوع السعر": "PriceType",
  };
  final List<String> bookTypes = [
    "programing",
    "romance",
    "mystery",
    "fantasy",
    "science fiction",
    "historical fiction",
    "biography",
    "self-help",
    "young adult",
    "true crime",
    "children",
  ];
  final List<String> orderByOptions = [
    "newest",
    "relevance",
  ];
  final List<String> priceOptions = [
    "freee-books",
    "paide-books",
    "ebooks",
  ];

  String selectedBookType = currentFilter.bookType;
  String selectedOrderBy = currentFilter.orderBy;
  String selectedPriceType = currentFilter.bookFilter;

  showModalBottomSheet(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Book Type
                const Text("BookType"),
                DropdownButton<String>(
                  value: bookTypes.contains(selectedBookType)
                      ? selectedBookType
                      : bookTypes.first,
                  isExpanded: true,
                  items: bookTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() {
                    selectedBookType = val!;
                  }),
                ),

                // Order By
                const SizedBox(height: 10),
                const Text("OrderBy"),
                DropdownButton<String>(
                  value: orderByOptions.contains(selectedOrderBy)
                      ? selectedOrderBy
                      : orderByOptions.first,
                  isExpanded: true,
                  items: orderByOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() {
                    selectedOrderBy = val!;
                  }),
                ),

                // Price Type
                const SizedBox(height: 10),
                const Text("PriceType"),
                DropdownButton<String>(
                  value: priceOptions.contains(selectedPriceType)
                      ? selectedPriceType
                      : priceOptions.first,
                  isExpanded: true,
                  items: priceOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() {
                    selectedPriceType = val!;
                  }),
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: () {
                    onApply(
                      BooksFilterOptions(
                        bookType: selectedBookType,
                        orderBy: selectedOrderBy,
                        bookFilter: selectedPriceType,
                      ),
                    );
                    BlocProvider.of<GetBestSellerBooksCubit>(
                      context,
                    ).getBestSellerBooks(
                      booksType: selectedBookType,
                      filter: selectedPriceType,
                      orderby: selectedOrderBy,
                    );
                    BlocProvider.of<GetTopBooksCubit>(context).getTopBooks(
                      booksType: selectedBookType,
                      filter: selectedPriceType,
                      orderby: selectedOrderBy,
                    );
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "ApplyFilter",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
