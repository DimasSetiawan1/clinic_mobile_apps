// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_call_telemedis_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$VideoCallTelemedisEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String channelName, String token, int id)
    joinCall,
    required TResult Function() userLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String channelName, String token, int id)? joinCall,
    TResult? Function()? userLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String channelName, String token, int id)? joinCall,
    TResult Function()? userLeft,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_UserLeft value) userLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_UserLeft value)? userLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_UserLeft value)? userLeft,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallTelemedisEventCopyWith<$Res> {
  factory $VideoCallTelemedisEventCopyWith(
    VideoCallTelemedisEvent value,
    $Res Function(VideoCallTelemedisEvent) then,
  ) = _$VideoCallTelemedisEventCopyWithImpl<$Res, VideoCallTelemedisEvent>;
}

/// @nodoc
class _$VideoCallTelemedisEventCopyWithImpl<
  $Res,
  $Val extends VideoCallTelemedisEvent
>
    implements $VideoCallTelemedisEventCopyWith<$Res> {
  _$VideoCallTelemedisEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoCallTelemedisEvent
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
    extends _$VideoCallTelemedisEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
    _$StartedImpl _value,
    $Res Function(_$StartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCallTelemedisEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'VideoCallTelemedisEvent.started()';
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
    required TResult Function(String channelName, String token, int id)
    joinCall,
    required TResult Function() userLeft,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String channelName, String token, int id)? joinCall,
    TResult? Function()? userLeft,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String channelName, String token, int id)? joinCall,
    TResult Function()? userLeft,
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
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_UserLeft value) userLeft,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_UserLeft value)? userLeft,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_UserLeft value)? userLeft,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VideoCallTelemedisEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$JoinCallImplCopyWith<$Res> {
  factory _$$JoinCallImplCopyWith(
    _$JoinCallImpl value,
    $Res Function(_$JoinCallImpl) then,
  ) = __$$JoinCallImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String channelName, String token, int id});
}

/// @nodoc
class __$$JoinCallImplCopyWithImpl<$Res>
    extends _$VideoCallTelemedisEventCopyWithImpl<$Res, _$JoinCallImpl>
    implements _$$JoinCallImplCopyWith<$Res> {
  __$$JoinCallImplCopyWithImpl(
    _$JoinCallImpl _value,
    $Res Function(_$JoinCallImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCallTelemedisEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelName = null,
    Object? token = null,
    Object? id = null,
  }) {
    return _then(
      _$JoinCallImpl(
        channelName:
            null == channelName
                ? _value.channelName
                : channelName // ignore: cast_nullable_to_non_nullable
                    as String,
        token:
            null == token
                ? _value.token
                : token // ignore: cast_nullable_to_non_nullable
                    as String,
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc

class _$JoinCallImpl implements _JoinCall {
  const _$JoinCallImpl({
    required this.channelName,
    required this.token,
    required this.id,
  });

  @override
  final String channelName;
  @override
  final String token;
  @override
  final int id;

  @override
  String toString() {
    return 'VideoCallTelemedisEvent.joinCall(channelName: $channelName, token: $token, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JoinCallImpl &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelName, token, id);

  /// Create a copy of VideoCallTelemedisEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JoinCallImplCopyWith<_$JoinCallImpl> get copyWith =>
      __$$JoinCallImplCopyWithImpl<_$JoinCallImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String channelName, String token, int id)
    joinCall,
    required TResult Function() userLeft,
  }) {
    return joinCall(channelName, token, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String channelName, String token, int id)? joinCall,
    TResult? Function()? userLeft,
  }) {
    return joinCall?.call(channelName, token, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String channelName, String token, int id)? joinCall,
    TResult Function()? userLeft,
    required TResult orElse(),
  }) {
    if (joinCall != null) {
      return joinCall(channelName, token, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_UserLeft value) userLeft,
  }) {
    return joinCall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_UserLeft value)? userLeft,
  }) {
    return joinCall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_UserLeft value)? userLeft,
    required TResult orElse(),
  }) {
    if (joinCall != null) {
      return joinCall(this);
    }
    return orElse();
  }
}

abstract class _JoinCall implements VideoCallTelemedisEvent {
  const factory _JoinCall({
    required final String channelName,
    required final String token,
    required final int id,
  }) = _$JoinCallImpl;

  String get channelName;
  String get token;
  int get id;

  /// Create a copy of VideoCallTelemedisEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JoinCallImplCopyWith<_$JoinCallImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserLeftImplCopyWith<$Res> {
  factory _$$UserLeftImplCopyWith(
    _$UserLeftImpl value,
    $Res Function(_$UserLeftImpl) then,
  ) = __$$UserLeftImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserLeftImplCopyWithImpl<$Res>
    extends _$VideoCallTelemedisEventCopyWithImpl<$Res, _$UserLeftImpl>
    implements _$$UserLeftImplCopyWith<$Res> {
  __$$UserLeftImplCopyWithImpl(
    _$UserLeftImpl _value,
    $Res Function(_$UserLeftImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCallTelemedisEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$UserLeftImpl implements _UserLeft {
  const _$UserLeftImpl();

  @override
  String toString() {
    return 'VideoCallTelemedisEvent.userLeft()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UserLeftImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String channelName, String token, int id)
    joinCall,
    required TResult Function() userLeft,
  }) {
    return userLeft();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String channelName, String token, int id)? joinCall,
    TResult? Function()? userLeft,
  }) {
    return userLeft?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String channelName, String token, int id)? joinCall,
    TResult Function()? userLeft,
    required TResult orElse(),
  }) {
    if (userLeft != null) {
      return userLeft();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_JoinCall value) joinCall,
    required TResult Function(_UserLeft value) userLeft,
  }) {
    return userLeft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_JoinCall value)? joinCall,
    TResult? Function(_UserLeft value)? userLeft,
  }) {
    return userLeft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_JoinCall value)? joinCall,
    TResult Function(_UserLeft value)? userLeft,
    required TResult orElse(),
  }) {
    if (userLeft != null) {
      return userLeft(this);
    }
    return orElse();
  }
}

abstract class _UserLeft implements VideoCallTelemedisEvent {
  const factory _UserLeft() = _$UserLeftImpl;
}

/// @nodoc
mixin _$VideoCallTelemedisState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )
    loaded,
    required TResult Function() error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult? Function()? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCallTelemedisStateCopyWith<$Res> {
  factory $VideoCallTelemedisStateCopyWith(
    VideoCallTelemedisState value,
    $Res Function(VideoCallTelemedisState) then,
  ) = _$VideoCallTelemedisStateCopyWithImpl<$Res, VideoCallTelemedisState>;
}

/// @nodoc
class _$VideoCallTelemedisStateCopyWithImpl<
  $Res,
  $Val extends VideoCallTelemedisState
>
    implements $VideoCallTelemedisStateCopyWith<$Res> {
  _$VideoCallTelemedisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoCallTelemedisState
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
    extends _$VideoCallTelemedisStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
    _$InitialImpl _value,
    $Res Function(_$InitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCallTelemedisState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VideoCallTelemedisState.initial()';
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
    required TResult Function() loading,
    required TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )
    loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult Function()? error,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VideoCallTelemedisState {
  const factory _Initial() = _$InitialImpl;
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
    extends _$VideoCallTelemedisStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
    _$LoadingImpl _value,
    $Res Function(_$LoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCallTelemedisState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'VideoCallTelemedisState.loading()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )
    loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult Function()? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VideoCallTelemedisState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
    _$LoadedImpl value,
    $Res Function(_$LoadedImpl) then,
  ) = __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RtcEngine engine, int? remoteUid, bool? localUserJoined, int id});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$VideoCallTelemedisStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
    _$LoadedImpl _value,
    $Res Function(_$LoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCallTelemedisState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? engine = null,
    Object? remoteUid = freezed,
    Object? localUserJoined = freezed,
    Object? id = null,
  }) {
    return _then(
      _$LoadedImpl(
        null == engine
            ? _value.engine
            : engine // ignore: cast_nullable_to_non_nullable
                as RtcEngine,
        freezed == remoteUid
            ? _value.remoteUid
            : remoteUid // ignore: cast_nullable_to_non_nullable
                as int?,
        freezed == localUserJoined
            ? _value.localUserJoined
            : localUserJoined // ignore: cast_nullable_to_non_nullable
                as bool?,
        null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                as int,
      ),
    );
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(
    this.engine,
    this.remoteUid,
    this.localUserJoined,
    this.id,
  );

  @override
  final RtcEngine engine;
  @override
  final int? remoteUid;
  @override
  final bool? localUserJoined;
  @override
  final int id;

  @override
  String toString() {
    return 'VideoCallTelemedisState.loaded(engine: $engine, remoteUid: $remoteUid, localUserJoined: $localUserJoined, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.engine, engine) || other.engine == engine) &&
            (identical(other.remoteUid, remoteUid) ||
                other.remoteUid == remoteUid) &&
            (identical(other.localUserJoined, localUserJoined) ||
                other.localUserJoined == localUserJoined) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, engine, remoteUid, localUserJoined, id);

  /// Create a copy of VideoCallTelemedisState
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
    required TResult Function() loading,
    required TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )
    loaded,
    required TResult Function() error,
  }) {
    return loaded(engine, remoteUid, localUserJoined, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(engine, remoteUid, localUserJoined, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(engine, remoteUid, localUserJoined, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements VideoCallTelemedisState {
  const factory _Loaded(
    final RtcEngine engine,
    final int? remoteUid,
    final bool? localUserJoined,
    final int id,
  ) = _$LoadedImpl;

  RtcEngine get engine;
  int? get remoteUid;
  bool? get localUserJoined;
  int get id;

  /// Create a copy of VideoCallTelemedisState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
    _$ErrorImpl value,
    $Res Function(_$ErrorImpl) then,
  ) = __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$VideoCallTelemedisStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
    _$ErrorImpl _value,
    $Res Function(_$ErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of VideoCallTelemedisState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'VideoCallTelemedisState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )
    loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RtcEngine engine,
      int? remoteUid,
      bool? localUserJoined,
      int id,
    )?
    loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VideoCallTelemedisState {
  const factory _Error() = _$ErrorImpl;
}
