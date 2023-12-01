import 'package:bloc/bloc.dart';
import 'package:data_fetch_bloc/repo/user_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  int pageno = 1;
  bool isLoading = false;
  ScrollController scrollController = ScrollController();

  HomeBloc() : super(const HomeInitial(null)) {
    scrollController.addListener(
      () {
        add(LoadMoreDataEvent());
      },
    );

    on<FetchDataEvent>((event, emit) async {
      emit(const DataLoadingState(null));
      var users = await UserRepository.getUserData(pageno: pageno);
      emit(DataLoadedState(users: users));
    });
    on<LoadMoreDataEvent>(
      (event, emit) async {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          isLoading = true;
          pageno++;
          var newusers = await UserRepository.getUserData(pageno: pageno);

          emit(DataLoadedState(users: [...state.users, ...newusers]));

          isLoading = false;
        }
      },
    );
  }
}
