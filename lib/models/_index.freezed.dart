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

AuthResult _$AuthResultFromJson(Map<String, dynamic> json) {
  return _AuthResult.fromJson(json);
}

/// @nodoc
class _$AuthResultTearOff {
  const _$AuthResultTearOff();

  _AuthResult call(AuthTokenResult data, bool success) {
    return _AuthResult(
      data,
      success,
    );
  }

  AuthResult fromJson(Map<String, Object> json) {
    return AuthResult.fromJson(json);
  }
}

/// @nodoc
const $AuthResult = _$AuthResultTearOff();

/// @nodoc
mixin _$AuthResult {
  AuthTokenResult get data => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthResultCopyWith<AuthResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthResultCopyWith<$Res> {
  factory $AuthResultCopyWith(
          AuthResult value, $Res Function(AuthResult) then) =
      _$AuthResultCopyWithImpl<$Res>;
  $Res call({AuthTokenResult data, bool success});

  $AuthTokenResultCopyWith<$Res> get data;
}

/// @nodoc
class _$AuthResultCopyWithImpl<$Res> implements $AuthResultCopyWith<$Res> {
  _$AuthResultCopyWithImpl(this._value, this._then);

  final AuthResult _value;
  // ignore: unused_field
  final $Res Function(AuthResult) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthTokenResult,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $AuthTokenResultCopyWith<$Res> get data {
    return $AuthTokenResultCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc
abstract class _$AuthResultCopyWith<$Res> implements $AuthResultCopyWith<$Res> {
  factory _$AuthResultCopyWith(
          _AuthResult value, $Res Function(_AuthResult) then) =
      __$AuthResultCopyWithImpl<$Res>;
  @override
  $Res call({AuthTokenResult data, bool success});

  @override
  $AuthTokenResultCopyWith<$Res> get data;
}

/// @nodoc
class __$AuthResultCopyWithImpl<$Res> extends _$AuthResultCopyWithImpl<$Res>
    implements _$AuthResultCopyWith<$Res> {
  __$AuthResultCopyWithImpl(
      _AuthResult _value, $Res Function(_AuthResult) _then)
      : super(_value, (v) => _then(v as _AuthResult));

  @override
  _AuthResult get _value => super._value as _AuthResult;

  @override
  $Res call({
    Object? data = freezed,
    Object? success = freezed,
  }) {
    return _then(_AuthResult(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as AuthTokenResult,
      success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AuthResult implements _AuthResult {
  _$_AuthResult(this.data, this.success);

  factory _$_AuthResult.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthResultFromJson(json);

  @override
  final AuthTokenResult data;
  @override
  final bool success;

  @override
  String toString() {
    return 'AuthResult(data: $data, success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthResult &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.success, success) ||
                const DeepCollectionEquality().equals(other.success, success)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(success);

  @JsonKey(ignore: true)
  @override
  _$AuthResultCopyWith<_AuthResult> get copyWith =>
      __$AuthResultCopyWithImpl<_AuthResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthResultToJson(this);
  }
}

abstract class _AuthResult implements AuthResult {
  factory _AuthResult(AuthTokenResult data, bool success) = _$_AuthResult;

  factory _AuthResult.fromJson(Map<String, dynamic> json) =
      _$_AuthResult.fromJson;

  @override
  AuthTokenResult get data => throw _privateConstructorUsedError;
  @override
  bool get success => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthResultCopyWith<_AuthResult> get copyWith =>
      throw _privateConstructorUsedError;
}

AuthTokenResult _$AuthTokenResultFromJson(Map<String, dynamic> json) {
  return _AuthTokenResult.fromJson(json);
}

/// @nodoc
class _$AuthTokenResultTearOff {
  const _$AuthTokenResultTearOff();

  _AuthTokenResult call(@JsonKey(name: 'phone_number') String phoneNumber,
      String token, @JsonKey(name: 'token_type') String tokenType,
      {@JsonKey(name: 'expires_in') int? expiresIn}) {
    return _AuthTokenResult(
      phoneNumber,
      token,
      tokenType,
      expiresIn: expiresIn,
    );
  }

  AuthTokenResult fromJson(Map<String, Object> json) {
    return AuthTokenResult.fromJson(json);
  }
}

/// @nodoc
const $AuthTokenResult = _$AuthTokenResultTearOff();

/// @nodoc
mixin _$AuthTokenResult {
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_in')
  int? get expiresIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthTokenResultCopyWith<AuthTokenResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTokenResultCopyWith<$Res> {
  factory $AuthTokenResultCopyWith(
          AuthTokenResult value, $Res Function(AuthTokenResult) then) =
      _$AuthTokenResultCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'phone_number') String phoneNumber,
      String token,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'expires_in') int? expiresIn});
}

/// @nodoc
class _$AuthTokenResultCopyWithImpl<$Res>
    implements $AuthTokenResultCopyWith<$Res> {
  _$AuthTokenResultCopyWithImpl(this._value, this._then);

  final AuthTokenResult _value;
  // ignore: unused_field
  final $Res Function(AuthTokenResult) _then;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_value.copyWith(
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$AuthTokenResultCopyWith<$Res>
    implements $AuthTokenResultCopyWith<$Res> {
  factory _$AuthTokenResultCopyWith(
          _AuthTokenResult value, $Res Function(_AuthTokenResult) then) =
      __$AuthTokenResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'phone_number') String phoneNumber,
      String token,
      @JsonKey(name: 'token_type') String tokenType,
      @JsonKey(name: 'expires_in') int? expiresIn});
}

/// @nodoc
class __$AuthTokenResultCopyWithImpl<$Res>
    extends _$AuthTokenResultCopyWithImpl<$Res>
    implements _$AuthTokenResultCopyWith<$Res> {
  __$AuthTokenResultCopyWithImpl(
      _AuthTokenResult _value, $Res Function(_AuthTokenResult) _then)
      : super(_value, (v) => _then(v as _AuthTokenResult));

  @override
  _AuthTokenResult get _value => super._value as _AuthTokenResult;

  @override
  $Res call({
    Object? phoneNumber = freezed,
    Object? token = freezed,
    Object? tokenType = freezed,
    Object? expiresIn = freezed,
  }) {
    return _then(_AuthTokenResult(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType == freezed
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: expiresIn == freezed
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_AuthTokenResult implements _AuthTokenResult {
  _$_AuthTokenResult(@JsonKey(name: 'phone_number') this.phoneNumber,
      this.token, @JsonKey(name: 'token_type') this.tokenType,
      {@JsonKey(name: 'expires_in') this.expiresIn});

  factory _$_AuthTokenResult.fromJson(Map<String, dynamic> json) =>
      _$_$_AuthTokenResultFromJson(json);

  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String token;
  @override
  @JsonKey(name: 'token_type')
  final String tokenType;
  @override
  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  @override
  String toString() {
    return 'AuthTokenResult(phoneNumber: $phoneNumber, token: $token, tokenType: $tokenType, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthTokenResult &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.tokenType, tokenType) ||
                const DeepCollectionEquality()
                    .equals(other.tokenType, tokenType)) &&
            (identical(other.expiresIn, expiresIn) ||
                const DeepCollectionEquality()
                    .equals(other.expiresIn, expiresIn)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(tokenType) ^
      const DeepCollectionEquality().hash(expiresIn);

  @JsonKey(ignore: true)
  @override
  _$AuthTokenResultCopyWith<_AuthTokenResult> get copyWith =>
      __$AuthTokenResultCopyWithImpl<_AuthTokenResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AuthTokenResultToJson(this);
  }
}

abstract class _AuthTokenResult implements AuthTokenResult {
  factory _AuthTokenResult(@JsonKey(name: 'phone_number') String phoneNumber,
      String token, @JsonKey(name: 'token_type') String tokenType,
      {@JsonKey(name: 'expires_in') int? expiresIn}) = _$_AuthTokenResult;

  factory _AuthTokenResult.fromJson(Map<String, dynamic> json) =
      _$_AuthTokenResult.fromJson;

  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get token => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'token_type')
  String get tokenType => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'expires_in')
  int? get expiresIn => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthTokenResultCopyWith<_AuthTokenResult> get copyWith =>
      throw _privateConstructorUsedError;
}

SignUpDTO _$SignUpDTOFromJson(Map<String, dynamic> json) {
  return _SignUpDTO.fromJson(json);
}

/// @nodoc
class _$SignUpDTOTearOff {
  const _$SignUpDTOTearOff();

  _SignUpDTO call(
      {@JsonKey(name: 'country_id') required String countryId,
      required String name,
      @JsonKey(name: 'phone_number') required String phoneNumber,
      required String password}) {
    return _SignUpDTO(
      countryId: countryId,
      name: name,
      phoneNumber: phoneNumber,
      password: password,
    );
  }

  SignUpDTO fromJson(Map<String, Object> json) {
    return SignUpDTO.fromJson(json);
  }
}

/// @nodoc
const $SignUpDTO = _$SignUpDTOTearOff();

/// @nodoc
mixin _$SignUpDTO {
  @JsonKey(name: 'country_id')
  String get countryId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignUpDTOCopyWith<SignUpDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpDTOCopyWith<$Res> {
  factory $SignUpDTOCopyWith(SignUpDTO value, $Res Function(SignUpDTO) then) =
      _$SignUpDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'country_id') String countryId,
      String name,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String password});
}

/// @nodoc
class _$SignUpDTOCopyWithImpl<$Res> implements $SignUpDTOCopyWith<$Res> {
  _$SignUpDTOCopyWithImpl(this._value, this._then);

  final SignUpDTO _value;
  // ignore: unused_field
  final $Res Function(SignUpDTO) _then;

  @override
  $Res call({
    Object? countryId = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
  }) {
    return _then(_value.copyWith(
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SignUpDTOCopyWith<$Res> implements $SignUpDTOCopyWith<$Res> {
  factory _$SignUpDTOCopyWith(
          _SignUpDTO value, $Res Function(_SignUpDTO) then) =
      __$SignUpDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'country_id') String countryId,
      String name,
      @JsonKey(name: 'phone_number') String phoneNumber,
      String password});
}

/// @nodoc
class __$SignUpDTOCopyWithImpl<$Res> extends _$SignUpDTOCopyWithImpl<$Res>
    implements _$SignUpDTOCopyWith<$Res> {
  __$SignUpDTOCopyWithImpl(_SignUpDTO _value, $Res Function(_SignUpDTO) _then)
      : super(_value, (v) => _then(v as _SignUpDTO));

  @override
  _SignUpDTO get _value => super._value as _SignUpDTO;

  @override
  $Res call({
    Object? countryId = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? password = freezed,
  }) {
    return _then(_SignUpDTO(
      countryId: countryId == freezed
          ? _value.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
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
class _$_SignUpDTO implements _SignUpDTO {
  _$_SignUpDTO(
      {@JsonKey(name: 'country_id') required this.countryId,
      required this.name,
      @JsonKey(name: 'phone_number') required this.phoneNumber,
      required this.password});

  factory _$_SignUpDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_SignUpDTOFromJson(json);

  @override
  @JsonKey(name: 'country_id')
  final String countryId;
  @override
  final String name;
  @override
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  @override
  final String password;

  @override
  String toString() {
    return 'SignUpDTO(countryId: $countryId, name: $name, phoneNumber: $phoneNumber, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SignUpDTO &&
            (identical(other.countryId, countryId) ||
                const DeepCollectionEquality()
                    .equals(other.countryId, countryId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(countryId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(password);

  @JsonKey(ignore: true)
  @override
  _$SignUpDTOCopyWith<_SignUpDTO> get copyWith =>
      __$SignUpDTOCopyWithImpl<_SignUpDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SignUpDTOToJson(this);
  }
}

abstract class _SignUpDTO implements SignUpDTO {
  factory _SignUpDTO(
      {@JsonKey(name: 'country_id') required String countryId,
      required String name,
      @JsonKey(name: 'phone_number') required String phoneNumber,
      required String password}) = _$_SignUpDTO;

  factory _SignUpDTO.fromJson(Map<String, dynamic> json) =
      _$_SignUpDTO.fromJson;

  @override
  @JsonKey(name: 'country_id')
  String get countryId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'phone_number')
  String get phoneNumber => throw _privateConstructorUsedError;
  @override
  String get password => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SignUpDTOCopyWith<_SignUpDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
