import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:foodplease_app/data/datasources/remote/user_remote_datasource.dart';

void main() {
  const baseUrl = 'https://api.foodplease.com';
  const email = 'user@example.com';
  const password = 'password123';

  test('returns token on successful login (status 200)', () async {
    // Arrange
    const token = 'valid_token';
    final client = MockClient((request) async {
      expect(request.method, equals('POST'));
      expect(request.url.toString(), equals('$baseUrl/api/auth/login'));

      final body = jsonDecode(request.body);
      expect(body['email'], equals(email));
      expect(body['password'], equals(password));

      return http.Response(jsonEncode({'token': token}), 200);
    });

    final dataSource = UserRemoteDataSource(client: client, baseUrl: baseUrl);

    // Act
    final result = await dataSource.login(email: email, password: password);

    // Assert
    expect(result, equals(token));
  });

  test('throws exception on invalid credentials (status 401)', () async {
    // Arrange
    final client = MockClient((_) async {
      return http.Response('Unauthorized', 401);
    });

    final dataSource = UserRemoteDataSource(client: client, baseUrl: baseUrl);

    // Act & Assert
    expect(
      () => dataSource.login(email: email, password: password),
      throwsA(isA<Exception>()),
    );
  });

  test('throws exception on unexpected error (status 500)', () async {
    // Arrange
    final client = MockClient((_) async {
      return http.Response('Server Error', 500);
    });

    final dataSource = UserRemoteDataSource(client: client, baseUrl: baseUrl);

    // Act & Assert
    expect(
      () => dataSource.login(email: email, password: password),
      throwsA(isA<Exception>()),
    );
  });
}
