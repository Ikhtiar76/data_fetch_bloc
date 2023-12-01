part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {}

class RegisterUserEvent extends RegistrationEvent {
  final Registration registration;

  RegisterUserEvent(this.registration);

  @override
  List<Object?> get props => [registration];
}
