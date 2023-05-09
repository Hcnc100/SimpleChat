// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chats_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatsState {
  String get message => throw _privateConstructorUsedError;
  List<MessageData> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatsStateCopyWith<ChatsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatsStateCopyWith<$Res> {
  factory $ChatsStateCopyWith(
          ChatsState value, $Res Function(ChatsState) then) =
      _$ChatsStateCopyWithImpl<$Res, ChatsState>;
  @useResult
  $Res call({String message, List<MessageData> messages});
}

/// @nodoc
class _$ChatsStateCopyWithImpl<$Res, $Val extends ChatsState>
    implements $ChatsStateCopyWith<$Res> {
  _$ChatsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatsStateCopyWith<$Res>
    implements $ChatsStateCopyWith<$Res> {
  factory _$$_ChatsStateCopyWith(
          _$_ChatsState value, $Res Function(_$_ChatsState) then) =
      __$$_ChatsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, List<MessageData> messages});
}

/// @nodoc
class __$$_ChatsStateCopyWithImpl<$Res>
    extends _$ChatsStateCopyWithImpl<$Res, _$_ChatsState>
    implements _$$_ChatsStateCopyWith<$Res> {
  __$$_ChatsStateCopyWithImpl(
      _$_ChatsState _value, $Res Function(_$_ChatsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? messages = null,
  }) {
    return _then(_$_ChatsState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<MessageData>,
    ));
  }
}

/// @nodoc

class _$_ChatsState implements _ChatsState {
  _$_ChatsState(
      {this.message = "", final List<MessageData> messages = const []})
      : _messages = messages;

  @override
  @JsonKey()
  final String message;
  final List<MessageData> _messages;
  @override
  @JsonKey()
  List<MessageData> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatsState(message: $message, messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatsState &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, message, const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatsStateCopyWith<_$_ChatsState> get copyWith =>
      __$$_ChatsStateCopyWithImpl<_$_ChatsState>(this, _$identity);
}

abstract class _ChatsState implements ChatsState {
  factory _ChatsState(
      {final String message, final List<MessageData> messages}) = _$_ChatsState;

  @override
  String get message;
  @override
  List<MessageData> get messages;
  @override
  @JsonKey(ignore: true)
  _$$_ChatsStateCopyWith<_$_ChatsState> get copyWith =>
      throw _privateConstructorUsedError;
}
