import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: 'access_token') required String token,
    @JsonKey(name: 'refresh_token') String? refreshToken,
    required User user,
    @JsonKey(name: 'tenant') Map<String, dynamic>? tenant,
    @JsonKey(name: 'expiresAt') String? expiresAt,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}