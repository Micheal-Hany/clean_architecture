import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T, NoPramters> {
  Future<Either<Faluire, T>> call([NoPramters noPramters]);
}

class NoPramters {}
