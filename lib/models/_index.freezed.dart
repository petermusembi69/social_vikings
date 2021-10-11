// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of social_models;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignInDTO _$SignInDTOFromJson(Map<String, dynamic> json) {
  return _SignInDTO.fromJson(json);
}

/// @nodoc
class _$SignInDTOTearOff {
  const _$SignInDTOTearOff();

  _SignInDTO call({required String email, required String password}) {
    return _SignInDTO(
      email: email,
      password: password,
    );
  }

  SignInDTO fromJson(Map<String, Object> json) {
    return SignInDTO.fromJson(json);
  }
}

/// @nodoc
const $SignInDTO = _$SignInDTOTearOff();

/// @nodoc
mixin _$SignInDTO {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignInDTOCopyWith<SignInDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInDTOCopyWith<$Res> {
  factory $SignInDTOCopyWith(SignInDTO value, $Res Function(SignInDTO) then) =
      _$SignInDTOCopyWithImpl<$Res>;
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInDTOCopyWithImpl<$Res> implements $SignInDTOCopyWith<$Res> {
  _$SignInDTOCopyWithImpl(this._value, this._then);

  final SignInDTO _value;
  // ignore: unused_field
  final $Res Function(SignInDTO) _then;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignInDTOCopyWith<$Res> implements $SignInDTOCopyWith<$Res> {
  factory _$SignInDTOCopyWith(
          _SignInDTO value, $Res Function(_SignInDTO) then) =
      __$SignInDTOCopyWithImpl<$Res>;
  @override
  $Res call({String email, String password});
}

/// @nodoc
class __$SignInDTOCopyWithImpl<$Res> extends _$SignInDTOCopyWithImpl<$Res>
    implements _$SignInDTOCopyWith<$Res> {
  __$SignInDTOCopyWithImpl(_SignInDTO _value, $Res Function(_SignInDTO) _then)
      : super(_value, (v) => _then(v as _SignInDTO));

  @override
  _SignInDTO get _value => super._value as _SignInDTO;

  @override
  $Res call({
    Object? email = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignInDTO(
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SignInDTO implements _SignInDTO {
  _$_SignInDTO({required this.email, required this.password});

  factory _$_SignInDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_SignInDTOFromJson(json);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInDTO(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignInDTO &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$SignInDTOCopyWith<_SignInDTO> get copyWith =>
      __$SignInDTOCopyWithImpl<_SignInDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignInDTOToJson(this);
  }
}

abstract class _SignInDTO implements SignInDTO {
  factory _SignInDTO({required String email, required String password}) =
      _$_SignInDTO;

  factory _SignInDTO.fromJson(Map<String, dynamic> json) =
      _$_SignInDTO.fromJson;

  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignInDTOCopyWith<_SignInDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
