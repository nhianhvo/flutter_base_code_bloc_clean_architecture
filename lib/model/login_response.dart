import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  LoginResponse({
    this.accessToken,
    this.user,
  });
  @JsonKey(name: 'access_token')
  String? accessToken;
  User? user;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class User {
  User({
    this.id,
    this.email,
    this.fullname,
    this.gender,
    this.dob,
    this.companyId,
    this.heartPoint,
    this.step,
    this.energy,
  });

  String? id;
  String? email;
  String? fullname;
  String? gender;
  DateTime? dob;
  String? companyId;
  @JsonKey(name: 'heart_point')
  int? heartPoint;
  int? step;
  int? energy;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
