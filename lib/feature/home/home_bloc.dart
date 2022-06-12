import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeState {
  int? countInt;
  final String? error;
  HomeState({this.countInt, this.error});
}

class HomeStatInitial extends HomeState {
  // HomeStatInitial() : super(countInt: 0);
}

class HomeLoading extends HomeState {
  HomeLoading() : super(countInt: 0);
}

class HomeLoadingDone extends HomeState {
  HomeLoadingDone({int? countInt}) : super(countInt: countInt);
}

// class RemotePostError extends HomeState {}

abstract class HomeEvent {
  const HomeEvent();
}

class HomeClickButton extends HomeEvent {}

class ClickNextEvent extends HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeStatInitial());

  @override
  final state = HomeState(countInt: 0);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeClickButton) {
      yield HomeLoading();
      yield* _onlick();
    }
  }

  Stream<HomeState> _onlick() async* {
    var index = state.countInt ?? 0;
    index++;
    state.countInt = index;
    if (kDebugMode) {
      print(state.countInt);
    }
    yield HomeLoadingDone(countInt: state.countInt ?? 0);
  }
}
