import 'package:bloc/bloc.dart';
import 'package:cubitapiexample/features/home/model/home_model.dart';
import 'package:cubitapiexample/features/home/service/home_service.dart';
import 'package:flutter/foundation.dart';
import '../model/home_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IHomeService _homeService;

  HomeCubit(this._homeService) : super(const HomeInitial());

  Future<void> fethData() async {
    emit(const HomeLoading());
    final result = await _homeService.getPosts();
    try {
      if (result.isNotEmpty) {
        emit(HomeCompleted(result));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
