import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class FetchNewsBookUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchNewsBookUseCase(this.homeRepo);

  @override
  Future<Either<Faluire, List<BookEntity>>> call([int pageNumber = 0]) async {
    return await homeRepo.feachFeaturedBook(pageNumber: pageNumber);
  }
}
