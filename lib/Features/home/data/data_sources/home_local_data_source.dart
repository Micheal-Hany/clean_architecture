import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/constants.dart';

import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> feachFeaturedBook( );
  List<BookEntity> feachNewsedBook();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> feachFeaturedBook( ) {
    var box = Hive.box<BookEntity>(kFeaturedBooks);
    return box.values.toList();
  }

  @override
  List<BookEntity> feachNewsedBook() {
    var box = Hive.box<BookEntity>(kNewstBooks);
    return box.values.toList();
  }
}
