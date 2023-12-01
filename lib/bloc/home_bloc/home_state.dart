part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  final users;

  const HomeState(this.users);
}

class HomeInitial extends HomeState {
  const HomeInitial(super.users);

  @override
  List<Object?> get props => [users];
}

class DataLoadingState extends HomeState {
  const DataLoadingState(super.users);

  @override
  List<Object?> get props => [users];
}

class DataLoadedState extends HomeState {
  const DataLoadedState({required users}) : super(users);

  @override
  List<Object?> get props => [users];
}

class NoMoreDataState extends HomeState {
  const NoMoreDataState() : super(null); // You can pass any value you want here

  @override
  List<Object?> get props => [];
}

// class FailedToLoadState extends HomeState {
//   final String message;

//   FailedToLoadState({required this.message});

//   @override
//   List<Object?> get props => [message];
// }
