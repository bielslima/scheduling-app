import 'package:scheduling_app/src/domain/entities/place/place.dart';
import 'package:scheduling_app/src/domain/entities/user/user.dart';

class Profile extends User {
  bool active;
  String roleProfile;
  Place place;

  Profile({
    required String firstName,
    required String lastName,
    required String email,
    String? password,
    required this.roleProfile,
    required this.place,
    required this.active,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          email: email,
          password: password,
        );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        roleProfile: json['role'],
        place: Place.fromJson(json['place']),
        active: json['active'],
      );
}
