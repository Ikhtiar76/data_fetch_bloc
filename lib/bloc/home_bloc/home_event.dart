part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchDataEvent extends HomeEvent {}

class LoadMoreDataEvent extends HomeEvent {}
