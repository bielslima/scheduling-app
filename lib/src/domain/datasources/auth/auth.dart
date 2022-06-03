import 'package:scheduling_app/src/domain/entities/auth_credentials/auth_credentials.dart';
import 'package:scheduling_app/src/domain/entities/profile/profile.dart';

abstract class IAuthDS {
  Future<Profile> auth(AuthCredentials credentials);
}
