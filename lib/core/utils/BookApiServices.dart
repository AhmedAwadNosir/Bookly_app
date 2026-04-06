// import 'package:dio/dio.dart';

// import '../Models/BookModel.dart';

// abstract class BookApiServices {
//   static const String _baseUrl = "https://www.googleapis.com/books/v1/volumes";
//   static Future<List<BookModel>> featchFetureBooks() async {
//     final dio = Dio();

//     try {
//       var response = await dio.get("$_baseUrl?q=novels&orderBy=newest");
//       List<BookModel> books = parseData(response);
//       return books;
//     } catch (e) {
//       if (e is DioError) {
//         if (e.response?.statusCode != 404) {
//           var errorData = e.response?.data;
//           throw Exception(errorData["error"]["message"] ?? "Something Wrong");
//         } else if (e.response?.statusCode == 404) {
//           throw Exception("Try Again Later");
//         } else {
//           throw Exception("Try Again Later");
//         }
//       } else {
//         throw Exception("Try Again Later");
//       }
//     }
//   }

//   static Future<List<BookModel>> featchNewstFetureBooks() async {
//     final dio = Dio();
//     try {
//       var response = await dio.get("$_baseUrl?q=novels");
//       List<BookModel> books = parseData(response);
//       return books;
//     } catch (e) {
//       if (e is DioError) {
//         if (e.response?.statusCode != 404) {
//           var errorData = e.response?.data;
//           throw Exception(errorData["error"]["message"] ?? "Something Wrong");
//         } else if (e.response?.statusCode == 404) {
//           throw Exception("Try Again Later");
//         } else {
//           throw Exception("Try Again Later");
//         }
//       } else {
//         throw Exception("Try Again Later");
//       }
//     }
//   }

//   static List<BookModel> parseData(Response<dynamic> response) {
//     List<BookModel> books = [];
//     var items = response.data["items"];
//     for (var bookMap in items) {
//       books.add(BookModel.fromjson(bookMap));
//     }
//     return books;
//   }
// }
