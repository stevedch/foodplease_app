import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

import 'package:foodplease_app/presentation/blocs/login/login_cubit.dart';
import 'package:foodplease_app/presentation/blocs/login/login_state.dart';
import 'package:foodplease_app/models/usecases/login_usecase.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockLoginUseCase mockLoginUseCase;
  late LoginCubit loginCubit;

  setUp(() {
    mockLoginUseCase = MockLoginUseCase();
    loginCubit = LoginCubit(loginUseCase: mockLoginUseCase);
  });

  tearDown(() => loginCubit.close());

  test('initial state is correct', () {
    expect(loginCubit.state, const LoginState());
  });

  blocTest<LoginCubit, LoginState>(
    'emits updated email',
    build: () => loginCubit,
    act: (cubit) => cubit.updateEmail('test@email.com'),
    expect: () => [const LoginState(email: 'test@email.com')],
  );

  blocTest<LoginCubit, LoginState>(
    'emits updated password',
    build: () => loginCubit,
    act: (cubit) => cubit.updatePassword('secret'),
    expect: () => [const LoginState(password: 'secret')],
  );

  blocTest<LoginCubit, LoginState>(
    'submit fails with empty email/password',
    build: () => loginCubit,
    act: (cubit) => cubit.submit(),
    expect:
        () => [
          const LoginState(
            errorMessage: 'Please enter both email and password',
            isSuccess: false,
          ),
        ],
  );

  blocTest<LoginCubit, LoginState>(
    'submit succeeds with correct credentials',
    build: () {
      when(
        () => mockLoginUseCase.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) async => 'mock_token');
      return loginCubit;
    },
    act: (cubit) {
      cubit.updateEmail('test@email.com');
      cubit.updatePassword('secret');
      return cubit.submit();
    },
    expect:
        () => [
          const LoginState(email: 'test@email.com'),
          const LoginState(email: 'test@email.com', password: 'secret'),
          const LoginState(
            email: 'test@email.com',
            password: 'secret',
            isSubmitting: true,
            errorMessage: null,
            isSuccess: false,
          ),
          const LoginState(
            email: 'test@email.com',
            password: 'secret',
            isSubmitting: false,
            isSuccess: true,
          ),
        ],
  );

  blocTest<LoginCubit, LoginState>(
    'submit fails when usecase throws',
    build: () {
      when(
        () => mockLoginUseCase.login(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenThrow(Exception('invalid credentials'));
      return loginCubit;
    },
    act: (cubit) {
      cubit.updateEmail('wrong@email.com');
      cubit.updatePassword('wrongpass');
      return cubit.submit();
    },
    expect:
        () => [
          const LoginState(email: 'wrong@email.com'),
          const LoginState(email: 'wrong@email.com', password: 'wrongpass'),
          const LoginState(
            email: 'wrong@email.com',
            password: 'wrongpass',
            isSubmitting: true,
            errorMessage: null,
            isSuccess: false,
          ),
          const LoginState(
            email: 'wrong@email.com',
            password: 'wrongpass',
            isSubmitting: false,
            errorMessage: 'Exception: invalid credentials',
            isSuccess: false,
          ),
        ],
  );
}
