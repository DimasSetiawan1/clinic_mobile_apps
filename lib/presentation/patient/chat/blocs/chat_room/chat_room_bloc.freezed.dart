// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatRoomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String roomId) watch,
    required TResult Function(List<ChatRequestModel> messages) received,
    required TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )
    sendMessage,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String roomId)? watch,
    TResult? Function(List<ChatRequestModel> messages)? received,
    TResult? Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String roomId)? watch,
    TResult Function(List<ChatRequestModel> messages)? received,
    TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Watch value) watch,
    required TResult Function(_Received value) received,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Watch value)? watch,
    TResult? Function(_Received value)? received,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Watch value)? watch,
    TResult Function(_Received value)? received,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomEventCopyWith<$Res> {
  factory $ChatRoomEventCopyWith(
    ChatRoomEvent value,
    $Res Function(ChatRoomEvent) then,
  ) = _$ChatRoomEventCopyWithImpl<$Res, ChatRoomEvent>;
}

/// @nodoc
class _$ChatRoomEventCopyWithImpl<$Res, $Val extends ChatRoomEvent>
    implements $ChatRoomEventCopyWith<$Res> {
  _$ChatRoomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
    _$StartedImpl value,
    $Res Function(_$StartedImpl) then,
  ) = __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ChatRoomEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String roomId) watch,
    required TResult Function(List<ChatRequestModel> messages) received,
    required TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )
    sendMessage,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String roomId)? watch,
    TResult? Function(List<ChatRequestModel> messages)? received,
    TResult? Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String roomId)? watch,
    TResult Function(List<ChatRequestModel> messages)? received,
    TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Watch value) watch,
    required TResult Function(_Received value) received,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Watch value)? watch,
    TResult? Function(_Received value)? received,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Watch value)? watch,
    TResult Function(_Received value)? received,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ChatRoomEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$WatchImplCopyWith<$Res> {
  factory _$$WatchImplCopyWith(
    _$WatchImpl value,
    $Res Function(_$WatchImpl) then,
  ) = __$$WatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$WatchImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$WatchImpl>
    implements _$$WatchImplCopyWith<$Res> {
  __$$WatchImplCopyWithImpl(
    _$WatchImpl _value,
    $Res Function(_$WatchImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null}) {
    return _then(
      _$WatchImpl(
        null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$WatchImpl implements _Watch {
  const _$WatchImpl(this.roomId);

  @override
  final String roomId;

  @override
  String toString() {
    return 'ChatRoomEvent.watch(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchImplCopyWith<_$WatchImpl> get copyWith =>
      __$$WatchImplCopyWithImpl<_$WatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String roomId) watch,
    required TResult Function(List<ChatRequestModel> messages) received,
    required TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )
    sendMessage,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return watch(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String roomId)? watch,
    TResult? Function(List<ChatRequestModel> messages)? received,
    TResult? Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return watch?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String roomId)? watch,
    TResult Function(List<ChatRequestModel> messages)? received,
    TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (watch != null) {
      return watch(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Watch value) watch,
    required TResult Function(_Received value) received,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return watch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Watch value)? watch,
    TResult? Function(_Received value)? received,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return watch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Watch value)? watch,
    TResult Function(_Received value)? received,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (watch != null) {
      return watch(this);
    }
    return orElse();
  }
}

abstract class _Watch implements ChatRoomEvent {
  const factory _Watch(final String roomId) = _$WatchImpl;

  String get roomId;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchImplCopyWith<_$WatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceivedImplCopyWith<$Res> {
  factory _$$ReceivedImplCopyWith(
    _$ReceivedImpl value,
    $Res Function(_$ReceivedImpl) then,
  ) = __$$ReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatRequestModel> messages});
}

/// @nodoc
class __$$ReceivedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$ReceivedImpl>
    implements _$$ReceivedImplCopyWith<$Res> {
  __$$ReceivedImplCopyWithImpl(
    _$ReceivedImpl _value,
    $Res Function(_$ReceivedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messages = null}) {
    return _then(
      _$ReceivedImpl(
        null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                as List<ChatRequestModel>,
      ),
    );
  }
}

/// @nodoc

class _$ReceivedImpl implements _Received {
  const _$ReceivedImpl(final List<ChatRequestModel> messages)
    : _messages = messages;

  final List<ChatRequestModel> _messages;
  @override
  List<ChatRequestModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatRoomEvent.received(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceivedImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceivedImplCopyWith<_$ReceivedImpl> get copyWith =>
      __$$ReceivedImplCopyWithImpl<_$ReceivedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String roomId) watch,
    required TResult Function(List<ChatRequestModel> messages) received,
    required TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )
    sendMessage,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return received(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String roomId)? watch,
    TResult? Function(List<ChatRequestModel> messages)? received,
    TResult? Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return received?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String roomId)? watch,
    TResult Function(List<ChatRequestModel> messages)? received,
    TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Watch value) watch,
    required TResult Function(_Received value) received,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return received(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Watch value)? watch,
    TResult? Function(_Received value)? received,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return received?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Watch value)? watch,
    TResult Function(_Received value)? received,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (received != null) {
      return received(this);
    }
    return orElse();
  }
}

abstract class _Received implements ChatRoomEvent {
  const factory _Received(final List<ChatRequestModel> messages) =
      _$ReceivedImpl;

  List<ChatRequestModel> get messages;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceivedImplCopyWith<_$ReceivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SendMessageImplCopyWith<$Res> {
  factory _$$SendMessageImplCopyWith(
    _$SendMessageImpl value,
    $Res Function(_$SendMessageImpl) then,
  ) = __$$SendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String roomId,
    ChatRequestModel messages,
    int senderId,
    int receiverId,
    String senderName,
  });
}

/// @nodoc
class __$$SendMessageImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$SendMessageImpl>
    implements _$$SendMessageImplCopyWith<$Res> {
  __$$SendMessageImplCopyWithImpl(
    _$SendMessageImpl _value,
    $Res Function(_$SendMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? messages = null,
    Object? senderId = null,
    Object? receiverId = null,
    Object? senderName = null,
  }) {
    return _then(
      _$SendMessageImpl(
        null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                as String,
        null == messages
            ? _value.messages
            : messages // ignore: cast_nullable_to_non_nullable
                as ChatRequestModel,
        null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                as int,
        null == receiverId
            ? _value.receiverId
            : receiverId // ignore: cast_nullable_to_non_nullable
                as int,
        null == senderName
            ? _value.senderName
            : senderName // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$SendMessageImpl implements _SendMessage {
  const _$SendMessageImpl(
    this.roomId,
    this.messages,
    this.senderId,
    this.receiverId,
    this.senderName,
  );

  @override
  final String roomId;
  @override
  final ChatRequestModel messages;
  @override
  final int senderId;
  @override
  final int receiverId;
  @override
  final String senderName;

  @override
  String toString() {
    return 'ChatRoomEvent.sendMessage(roomId: $roomId, messages: $messages, senderId: $senderId, receiverId: $receiverId, senderName: $senderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.messages, messages) ||
                other.messages == messages) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.senderName, senderName) ||
                other.senderName == senderName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    messages,
    senderId,
    receiverId,
    senderName,
  );

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      __$$SendMessageImplCopyWithImpl<_$SendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String roomId) watch,
    required TResult Function(List<ChatRequestModel> messages) received,
    required TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )
    sendMessage,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return sendMessage(roomId, messages, senderId, receiverId, senderName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String roomId)? watch,
    TResult? Function(List<ChatRequestModel> messages)? received,
    TResult? Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return sendMessage?.call(
      roomId,
      messages,
      senderId,
      receiverId,
      senderName,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String roomId)? watch,
    TResult Function(List<ChatRequestModel> messages)? received,
    TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(roomId, messages, senderId, receiverId, senderName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Watch value) watch,
    required TResult Function(_Received value) received,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return sendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Watch value)? watch,
    TResult? Function(_Received value)? received,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return sendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Watch value)? watch,
    TResult Function(_Received value)? received,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (sendMessage != null) {
      return sendMessage(this);
    }
    return orElse();
  }
}

abstract class _SendMessage implements ChatRoomEvent {
  const factory _SendMessage(
    final String roomId,
    final ChatRequestModel messages,
    final int senderId,
    final int receiverId,
    final String senderName,
  ) = _$SendMessageImpl;

  String get roomId;
  ChatRequestModel get messages;
  int get senderId;
  int get receiverId;
  String get senderName;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageImplCopyWith<_$SendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatRoomEvent.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String roomId) watch,
    required TResult Function(List<ChatRequestModel> messages) received,
    required TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )
    sendMessage,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String roomId)? watch,
    TResult? Function(List<ChatRequestModel> messages)? received,
    TResult? Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String roomId)? watch,
    TResult Function(List<ChatRequestModel> messages)? received,
    TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Watch value) watch,
    required TResult Function(_Received value) received,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Watch value)? watch,
    TResult? Function(_Received value)? received,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Watch value)? watch,
    TResult Function(_Received value)? received,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ChatRoomEvent {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
    _$LoadingImpl value,
    $Res Function(_$LoadingImpl) then,
  ) = __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ChatRoomEvent.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String roomId) watch,
    required TResult Function(List<ChatRequestModel> messages) received,
    required TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )
    sendMessage,
    required TResult Function(String message) error,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String roomId)? watch,
    TResult? Function(List<ChatRequestModel> messages)? received,
    TResult? Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult? Function(String message)? error,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String roomId)? watch,
    TResult Function(List<ChatRequestModel> messages)? received,
    TResult Function(
      String roomId,
      ChatRequestModel messages,
      int senderId,
      int receiverId,
      String senderName,
    )?
    sendMessage,
    TResult Function(String message)? error,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Watch value) watch,
    required TResult Function(_Received value) received,
    required TResult Function(_SendMessage value) sendMessage,
    required TResult Function(_Error value) error,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Watch value)? watch,
    TResult? Function(_Received value)? received,
    TResult? Function(_SendMessage value)? sendMessage,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Watch value)? watch,
    TResult Function(_Received value)? received,
    TResult Function(_SendMessage value)? sendMessage,
    TResult Function(_Error value)? error,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ChatRoomEvent {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
mixin _$ChatRoomState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChatRequestModel> messages) loaded,
    required TResult Function(String message) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChatRequestModel> messages)? loaded,
    TResult? Function(String message)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChatRequestModel> messages)? loaded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomStateCopyWith(
    ChatRoomState value,
    $Res Function(ChatRoomState) then,
  ) = _$ChatRoomStateCopyWithImpl<$Res, ChatRoomState>;
}

/// @nodoc
class _$ChatRoomStateCopyWithImpl<$Res, $Val extends ChatRoomState>
    implements $ChatRoomStateCopyWith<$Res> {
  _$ChatRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
    _$InitialImpl value,
    $Res Function(_$InitialImpl) then,
  ) = __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ChatRoomState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChatRequestModel> messages) loaded,
    required TResult Function(String message) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChatRequestModel> messages)? loaded,
    TResult? Function(String message)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChatRequestModel> messages)? loaded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ChatRoomState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ChatRequestModel> messages});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messages = null}) {
    return _then(
      _$LoadedImpl(
        null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                as List<ChatRequestModel>,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(final List<ChatRequestModel> messages)
    : _messages = messages;

  final List<ChatRequestModel> _messages;
  @override
  List<ChatRequestModel> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  String toString() {
    return 'ChatRoomState.loaded(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_messages));

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChatRequestModel> messages) loaded,
    required TResult Function(String message) failed,
  }) {
    return loaded(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChatRequestModel> messages)? loaded,
    TResult? Function(String message)? failed,
  }) {
    return loaded?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChatRequestModel> messages)? loaded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements ChatRoomState {
  const factory _Loaded(final List<ChatRequestModel> messages) = _$LoadedImpl;

  List<ChatRequestModel> get messages;

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
    _$FailedImpl value,
    $Res Function(_$FailedImpl) then,
  ) = __$$FailedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
    _$FailedImpl _value,
    $Res Function(_$FailedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$FailedImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$FailedImpl implements _Failed {
  const _$FailedImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ChatRoomState.failed(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      __$$FailedImplCopyWithImpl<_$FailedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<ChatRequestModel> messages) loaded,
    required TResult Function(String message) failed,
  }) {
    return failed(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(List<ChatRequestModel> messages)? loaded,
    TResult? Function(String message)? failed,
  }) {
    return failed?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<ChatRequestModel> messages)? loaded,
    TResult Function(String message)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements ChatRoomState {
  const factory _Failed(final String message) = _$FailedImpl;

  String get message;

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedImplCopyWith<_$FailedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
