import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:foodplease_app/models/usecases/login_usecase_impl.dart';
import 'package:foodplease_app/data/datasources/remote/user_remote_datasource.dart';

class MockUserRemoteDataSource extends Mock implements UserRemoteDataSource {}

void main() {
  late MockUserRemoteDataSource mockRemoteDataSource;
  late LoginUseCaseImpl loginUseCase;

  setUp(() {
    mockRemoteDataSource = MockUserRemoteDataSource();
    loginUseCase = LoginUseCaseImpl(mockRemoteDataSource);
  });

  const email = 'user@example.com';
  const password = 'password123';

  test('returns token when login is successful', () async {
    // Arrange
    const expectedToken = 'mock_token_abc';
    when(
      () => mockRemoteDataSource.login(email: email, password: password),
    ).thenAnswer((_) async => expectedToken);

    // Act
    final result = await loginUseCase.login(email: email, password: password);

    // Assert
    expect(result, expectedToken);
    verify(
      () => mockRemoteDataSource.login(email: email, password: password),
    ).called(1);
  });

  test('throws exception when login fails', () async {
    // Arrange
    when(
      () => mockRemoteDataSource.login(email: email, password: password),
    ).thenThrow(Exception('invalid credentials'));

    // Act & Assert
    expect(
      () => loginUseCase.login(email: email, password: password),
      throwsA(isA<Exception>()),
    );
    verify(
      () => mockRemoteDataSource.login(email: email, password: password),
    ).called(1);
  });
}
