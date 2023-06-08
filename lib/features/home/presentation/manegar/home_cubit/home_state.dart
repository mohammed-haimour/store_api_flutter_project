part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeProductsSuccess extends HomeState {
  final List<HomeEntity> prds;

  HomeProductsSuccess(this.prds);
}

class HomeProductsLoading extends HomeState {}

class HomeProductsError extends HomeState {
  final String err;

  HomeProductsError(this.err);
}

class HomeProductsFailure extends HomeState {
}
