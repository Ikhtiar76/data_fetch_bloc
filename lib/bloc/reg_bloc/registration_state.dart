part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {}

class RegistrationInitialState extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationLoadingState extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationSuccessState extends RegistrationState {
  @override
  List<Object?> get props => [];
}

class RegistrationErrorState extends RegistrationState {
  final String error;

  RegistrationErrorState(this.error);

  @override
  List<Object?> get props => [error];
}
