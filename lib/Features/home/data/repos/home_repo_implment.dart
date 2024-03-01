import 'package:dartz/dartz.dart';
import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_sources.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepoImpl({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Faluire, List<BookEntity>>> feachFeaturedBook(
      {int pageNumber = 0}) async {
    try {
      var bookList = homeLocalDataSource.feachFeaturedBook();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      List<BookEntity> books =
          await homeRemoteDataSource.feachFeaturedBook(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMassage: e.toString()));
    }
  }

  @override
  Future<Either<Faluire, List<BookEntity>>> feachNewsedBook() async {
    try {
      var bookList = homeLocalDataSource.feachNewsedBook();
      if (bookList.isNotEmpty) {
        return right(bookList);
      }
      var books = homeRemoteDataSource.feachNewsedBook();
      return right(books as List<BookEntity>);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMassage: e.toString()));
    }
  }
}
