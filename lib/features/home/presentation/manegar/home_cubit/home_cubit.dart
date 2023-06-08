import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/data/repos/home_repo_impl.dart';
import 'package:store_app/features/home/domain/entitis/home_entity.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepoImpl) : super(HomeInitial());
  final HomeRepoImpl homeRepoImpl;

  Future<void> getProducts() async {
    emit(HomeProductsLoading());
    var result = await homeRepoImpl.getProducts();
    result.fold((err) {
      emit(HomeProductsError(err.msg));
    }, (prds) {
      if (prds.isNotEmpty) {
        emit(HomeProductsSuccess(prds));
      } else {
        emit(HomeProductsFailure());
      }
    });
  }
}
