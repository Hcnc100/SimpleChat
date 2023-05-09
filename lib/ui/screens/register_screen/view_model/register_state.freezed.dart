// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  bool get isConfirmPasswordVisible => throw _privateConstructorUsedError;
  File? get imageProfile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      bool isLoading,
      bool isPasswordVisible,
      bool isConfirmPasswordVisible,
      File? imageProfile});
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? isLoading = null,
    Object? isPasswordVisible = null,
    Object? isConfirmPasswordVisible = null,
    Object? imageProfile = freezed,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordVisible: null == isConfirmPasswordVisible
          ? _value.isConfirmPasswordVisible
          : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      imageProfile: freezed == imageProfile
          ? _value.imageProfile
          : imageProfile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$$_RegisterStateCopyWith(
          _$_RegisterState value, $Res Function(_$_RegisterState) then) =
      __$$_RegisterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      bool isLoading,
      bool isPasswordVisible,
      bool isConfirmPasswordVisible,
      File? imageProfile});
}

/// @nodoc
class __$$_RegisterStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$_RegisterState>
    implements _$$_RegisterStateCopyWith<$Res> {
  __$$_RegisterStateCopyWithImpl(
      _$_RegisterState _value, $Res Function(_$_RegisterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? isLoading = null,
    Object? isPasswordVisible = null,
    Object? isConfirmPasswordVisible = null,
    Object? imageProfile = freezed,
  }) {
    return _then(_$_RegisterState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirmPasswordVisible: null == isConfirmPasswordVisible
          ? _value.isConfirmPasswordVisible
          : isConfirmPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      imageProfile: freezed == imageProfile
          ? _value.imageProfile
          : imageProfile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_RegisterState implements _RegisterState {
  _$_RegisterState(
      {this.email = "",
      this.password = "",
      this.confirmPassword = "",
      this.isLoading = false,
      this.isPasswordVisible = false,
      this.isConfirmPasswordVisible = false,
      this.imageProfile});

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String confirmPassword;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final bool isConfirmPasswordVisible;
  @override
  final File? imageProfile;

  @override
  String toString() {
    return 'RegisterState(email: $email, password: $password, confirmPassword: $confirmPassword, isLoading: $isLoading, isPasswordVisible: $isPasswordVisible, isConfirmPasswordVisible: $isConfirmPasswordVisible, imageProfile: $imageProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(
                    other.isConfirmPasswordVisible, isConfirmPasswordVisible) ||
                other.isConfirmPasswordVisible == isConfirmPasswordVisible) &&
            (identical(other.imageProfile, imageProfile) ||
                other.imageProfile == imageProfile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, confirmPassword,
      isLoading, isPasswordVisible, isConfirmPasswordVisible, imageProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      __$$_RegisterStateCopyWithImpl<_$_RegisterState>(this, _$identity);
}

abstract class _RegisterState implements RegisterState {
  factory _RegisterState(
      {final String email,
      final String password,
      final String confirmPassword,
      final bool isLoading,
      final bool isPasswordVisible,
      final bool isConfirmPasswordVisible,
      final File? imageProfile}) = _$_RegisterState;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  bool get isLoading;
  @override
  bool get isPasswordVisible;
  @override
  bool get isConfirmPasswordVisible;
  @override
  File? get imageProfile;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterStateCopyWith<_$_RegisterState> get copyWith =>
      throw _privateConstructorUsedError;
}
