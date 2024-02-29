import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit({required this.getFetchFeaturedBookUseCase})
      : super(FeaturedBooksInitial());
  final FetchFeaturedBookUseCase getFetchFeaturedBookUseCase;

  Future<void> fetchFeturedBooks({int pagenumber = 0}) async {
    emit(FeaturedBooksLoading());
    var result = await getFetchFeaturedBookUseCase.call(pagenumber);

    result.fold((failure) {
      emit(FeaturedBooksFailure(errorMessage: failure.errorMassage));
    }, (books) {
      emit(FeaturedBooksSuccess(books: books));
    });
  }
}
