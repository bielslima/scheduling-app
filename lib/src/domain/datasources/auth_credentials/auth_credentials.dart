import 'package:scheduling_app/src/domain/entities/auth_credentials/auth_credentials.dart';

abstract class IAuthCredentialsDS {
  Future<AuthCredentials?> findCredentials();
}
