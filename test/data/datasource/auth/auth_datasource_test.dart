import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:scheduling_app/src/domain/entities/auth_credentials/auth_credentials.dart';
import 'package:test/test.dart';
import 'package:scheduling_app/src/core/http/http_client.dart';
import 'package:scheduling_app/src/data/datasources/auth/auth_remote_datasource.dart';
import 'package:scheduling_app/src/domain/datasources/auth/auth.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late HttpClient httpClient;
  late IAuthDS authDS;

  setUp(() {
    httpClient = HttpClientMock();
    authDS = AuthRemoteDS(httpClient: httpClient);

    when(httpClient).calls(#post).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: ''),
            data: {
              'first_name': 'Gabriel Lima',
              'last_name': 'Last',
              'email': 'gslima.dev@gmail.com',
              'role': 'ADMIN',
              'active': true,
              'place': {
                'place_id': 'place_123456',
                'place_name': 'Gabriel`s Place'
              },
            },
            statusCode: 200,
          ),
        );
  });

  test('Should return success user logged', () async {
    final AuthCredentials authCredentials = AuthCredentials(
      email: 'gslima.dev@gmail.com',
      password: '123456',
    );

    final _request = await authDS.auth(authCredentials);

    expect(_request.place.placeId, equals('place_123456'));
  });
}
