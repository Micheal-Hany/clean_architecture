// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> feachFeaturedBook({int pageNumber = 0});
  Future<List<BookEntity>> feachNewsedBook();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService service;
  HomeRemoteDataSourceImpl({
    required this.service,
  });
  @override
  Future<List<BookEntity>> feachFeaturedBook({int pageNumber = 0}) async {
    var data = await service
        .fetchData("volumes?q=flutter&startIndex=${pageNumber * 10}");
    List<BookEntity> books = getBooksList(data);
    saveData(books, kFeaturedBooks);
    return books;
  }

  @override
  Future<List<BookEntity>> feachNewsedBook() async {
    var data = await service.fetchData("volumes?q=flutter&sorting=newest");
    List<BookEntity> books = getBooksList(data);
    saveData(books, kNewstBooks);
    return books;
  }

  List<BookEntity> getBooksList(Map<String, dynamic> data) {
    List<BookEntity> books = [];
    for (var bookMap in data['items']) {
      books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }

  void saveData(List<BookEntity> books, String bookName) {
    var box = Hive.box<BookEntity>(bookName);
    box.addAll(books);
  }
}
