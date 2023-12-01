import 'package:bloc/bloc.dart';
import 'package:data_fetch_bloc/model/registration%20model/reg_model.dart';
import 'package:data_fetch_bloc/repo/reg_repository.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitialState()) {
    on<RegisterUserEvent>((event, emit) async {
      emit(RegistrationLoadingState());
      try {
        await RegistrationRepository.getData(event.registration);
        emit(RegistrationSuccessState());
        // debugPrint(RegistrationSuccessState().toString());
      } catch (e) {
        emit(RegistrationErrorState('Registration Failed'));
      }
    });
  }
}
