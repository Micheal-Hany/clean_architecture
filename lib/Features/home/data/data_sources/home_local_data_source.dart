import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/constants.dart';

import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> feachFeaturedBook({int pageNumber = 0});
  List<BookEntity> feachNewsedBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> feachFeaturedBook({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kFeaturedBooks);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) {
      return [];
    }
    return box.values.toList().sublist(startIndex, endIndex);
  }

  @override
  List<BookEntity> feachNewsedBook() {
    var box = Hive.box<BookEntity>(kNewstBooks);
    return box.values.toList();
  }
}
