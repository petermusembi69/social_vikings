// GENERATED CODE - DO NOT MODIFY BY HAND

part of social_models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignInDTO _$_$_SignInDTOFromJson(Map<String, dynamic> json) {
  return _$_SignInDTO(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$_$_SignInDTOToJson(_$_SignInDTO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

_$_AuthResult _$_$_AuthResultFromJson(Map<String, dynamic> json) {
  return _$_AuthResult(
    AuthTokenResult.fromJson(json['data'] as Map<String, dynamic>),
    json['success'] as bool,
  );
}

Map<String, dynamic> _$_$_AuthResultToJson(_$_AuthResult instance) =>
    <String, dynamic>{
      'data': instance.data,
      'success': instance.success,
    };

_$_AuthTokenResult _$_$_AuthTokenResultFromJson(Map<String, dynamic> json) {
  return _$_AuthTokenResult(
    json['phone_number'] as String,
    json['token'] as String,
    json['token_type'] as String,
    expiresIn: json['expires_in'] as int?,
  );
}

Map<String, dynamic> _$_$_AuthTokenResultToJson(_$_AuthTokenResult instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'token': instance.token,
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
    };

_$_SignUpDTO _$_$_SignUpDTOFromJson(Map<String, dynamic> json) {
  return _$_SignUpDTO(
    countryId: json['country_id'] as String,
    name: json['name'] as String,
    phoneNumber: json['phone_number'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$_$_SignUpDTOToJson(_$_SignUpDTO instance) =>
    <String, dynamic>{
      'country_id': instance.countryId,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'password': instance.password,
    };
