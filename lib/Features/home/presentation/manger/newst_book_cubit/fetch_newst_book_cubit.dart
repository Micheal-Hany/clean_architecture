import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_news_books_use_case.dart';
import 'package:meta/meta.dart';

part 'fetch_newst_book_state.dart';

class FetchNewstBookCubit extends Cubit<FetchNewstBookState> {
  FetchNewstBookCubit({required this.fetchNewsBookUseCase})
      : super(FetchNewstBookInitial());
  final FetchNewsBookUseCase fetchNewsBookUseCase;

  Future<void> fetchNewstBooks() async {
    emit(FetchNewstBookLoading());
    var result = await fetchNewsBookUseCase.call();

    result.fold((failure) {
      emit(FetchNewstBookFailure(errorMessage: failure.errorMassage));
    }, (books) {
      emit(FetchNewstBooksuccess(books: books));
    });
  }
}
