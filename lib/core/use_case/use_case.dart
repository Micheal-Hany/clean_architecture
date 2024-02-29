 
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T,NoPramters> {
  Future<Either<Faluire,T>> call( [int pageNumber]);
}

class NoPramters{}