import 'package:scheduling_app/src/core/app/constants.dart';
import 'package:scheduling_app/src/core/http/http_client.dart';
import 'package:scheduling_app/src/domain/datasources/auth/auth.dart';
import 'package:scheduling_app/src/domain/entities/auth_credentials/auth_credentials.dart';
import 'package:scheduling_app/src/domain/entities/profile/profile.dart';

class AuthRemoteDS implements IAuthDS {
  final HttpClient httpClient;

  AuthRemoteDS({
    required this.httpClient,
  });

  @override
  Future<Profile> auth(AuthCredentials authCredentials) async {
    try {
      final _result = await httpClient.post(
        ApiConstants.login,
        data: authCredentials.toJson(),
      );

      return Profile.fromJson(_result.data);
    } catch (e) {
      rethrow;
    }
  }
}
