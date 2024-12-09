import 'package:shrayesh_patro/News/errors/failures.dart';
import 'package:shrayesh_patro/News/home_repo.dart';
import 'package:shrayesh_patro/News/models_news/news_model.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'breaking_news_state.dart';

class BreakingNewsCubit extends Cubit<BreakingNewsState> {
  BreakingNewsCubit(this.homeRepo) : super(BreakingNewsInitial());
  final HomeRepo homeRepo;
  int current = 0;
  final CarouselController carouselController = CarouselController();

  Future<void> fetchBreakingNews() async {
    emit(BreakingNewsLoadingState());
    Either<Failure, List<NewsModel>> result =
    await homeRepo.fetchBreakingNews();
    result.fold((failure) {
      emit(BreakingNewsFailureState(failure.errMessage));
    }, (news) {
      emit(BreakingNewsSuccessState(news));
    });
  }
}
