
part of 'fetch_newst_book_cubit.dart';

@immutable
class FetchNewstBookState {}

class FetchNewstBookInitial extends FetchNewstBookState {}

class FetchNewstBookLoading extends FetchNewstBookState {}

class FetchNewstBooksuccess extends FetchNewstBookState {
  final List<BookEntity> books;
  FetchNewstBooksuccess({
    required this.books,
  });
}

class FetchNewstBookFailure extends FetchNewstBookState {
  final String errorMessage;
  FetchNewstBookFailure({
    required this.errorMessage,
  });
}
