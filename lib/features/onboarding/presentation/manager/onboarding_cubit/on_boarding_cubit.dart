import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingIndex> {
  OnBoardingCubit() : super(OnBoardingIndex(index: 0));
  PageController pageController = PageController();
  void onPageChanged(int value) {
    emit(OnBoardingIndex(index: value));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
