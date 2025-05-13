import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';
import '../../../models/usecases/login_usecase.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(const LoginState());

  void updateEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  Future<void> submit() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: 'Please enter both email and password',
          isSuccess: false,
        ),
      );
      return;
    }

    emit(
      state.copyWith(isSubmitting: true, errorMessage: null, isSuccess: false),
    );

    try {
      final token = await loginUseCase.login(
        email: state.email,
        password: state.password,
      );

      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          errorMessage: e.toString(),
          isSuccess: false,
        ),
      );
    }
  }
}
