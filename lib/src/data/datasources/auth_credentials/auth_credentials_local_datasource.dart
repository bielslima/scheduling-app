import 'package:scheduling_app/src/domain/datasources/auth_credentials/auth_credentials.dart';
import 'package:scheduling_app/src/domain/entities/auth_credentials/auth_credentials.dart';

class AuthCredentialsLocalDS implements IAuthCredentialsDS {
  @override
  Future<AuthCredentials?> findCredentials() {
    // TODO: implement findCredentials
    throw UnimplementedError();
  }
}
