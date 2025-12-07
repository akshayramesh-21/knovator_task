// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

PostEvent _$PostEventFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'getPosts':
      return GetPosts.fromJson(json);
    case 'markAsRead':
      return MarkAsRead.fromJson(json);
    case 'updateTimerDuration':
      return UpdateTimerDuration.fromJson(json);
    case 'initializeFromLocalStorage':
      return InitializeFromLocalStorage.fromJson(json);
    case 'saveToLocalStorage':
      return SaveToLocalStorage.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'PostEvent',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$PostEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPosts,
    required TResult Function(int postId) markAsRead,
    required TResult Function(int postId, int duration) updateTimerDuration,
    required TResult Function() initializeFromLocalStorage,
    required TResult Function() saveToLocalStorage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPosts,
    TResult? Function(int postId)? markAsRead,
    TResult? Function(int postId, int duration)? updateTimerDuration,
    TResult? Function()? initializeFromLocalStorage,
    TResult? Function()? saveToLocalStorage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPosts,
    TResult Function(int postId)? markAsRead,
    TResult Function(int postId, int duration)? updateTimerDuration,
    TResult Function()? initializeFromLocalStorage,
    TResult Function()? saveToLocalStorage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(MarkAsRead value) markAsRead,
    required TResult Function(UpdateTimerDuration value) updateTimerDuration,
    required TResult Function(InitializeFromLocalStorage value)
    initializeFromLocalStorage,
    required TResult Function(SaveToLocalStorage value) saveToLocalStorage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(MarkAsRead value)? markAsRead,
    TResult? Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult? Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult? Function(SaveToLocalStorage value)? saveToLocalStorage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPosts value)? getPosts,
    TResult Function(MarkAsRead value)? markAsRead,
    TResult Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult Function(SaveToLocalStorage value)? saveToLocalStorage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this PostEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEventCopyWith<$Res> {
  factory $PostEventCopyWith(PostEvent value, $Res Function(PostEvent) then) =
      _$PostEventCopyWithImpl<$Res, PostEvent>;
}

/// @nodoc
class _$PostEventCopyWithImpl<$Res, $Val extends PostEvent>
    implements $PostEventCopyWith<$Res> {
  _$PostEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetPostsImplCopyWith<$Res> {
  factory _$$GetPostsImplCopyWith(
    _$GetPostsImpl value,
    $Res Function(_$GetPostsImpl) then,
  ) = __$$GetPostsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetPostsImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$GetPostsImpl>
    implements _$$GetPostsImplCopyWith<$Res> {
  __$$GetPostsImplCopyWithImpl(
    _$GetPostsImpl _value,
    $Res Function(_$GetPostsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$GetPostsImpl implements GetPosts {
  const _$GetPostsImpl({final String? $type}) : $type = $type ?? 'getPosts';

  factory _$GetPostsImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetPostsImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostEvent.getPosts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetPostsImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPosts,
    required TResult Function(int postId) markAsRead,
    required TResult Function(int postId, int duration) updateTimerDuration,
    required TResult Function() initializeFromLocalStorage,
    required TResult Function() saveToLocalStorage,
  }) {
    return getPosts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPosts,
    TResult? Function(int postId)? markAsRead,
    TResult? Function(int postId, int duration)? updateTimerDuration,
    TResult? Function()? initializeFromLocalStorage,
    TResult? Function()? saveToLocalStorage,
  }) {
    return getPosts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPosts,
    TResult Function(int postId)? markAsRead,
    TResult Function(int postId, int duration)? updateTimerDuration,
    TResult Function()? initializeFromLocalStorage,
    TResult Function()? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(MarkAsRead value) markAsRead,
    required TResult Function(UpdateTimerDuration value) updateTimerDuration,
    required TResult Function(InitializeFromLocalStorage value)
    initializeFromLocalStorage,
    required TResult Function(SaveToLocalStorage value) saveToLocalStorage,
  }) {
    return getPosts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(MarkAsRead value)? markAsRead,
    TResult? Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult? Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult? Function(SaveToLocalStorage value)? saveToLocalStorage,
  }) {
    return getPosts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPosts value)? getPosts,
    TResult Function(MarkAsRead value)? markAsRead,
    TResult Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult Function(SaveToLocalStorage value)? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (getPosts != null) {
      return getPosts(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPostsImplToJson(this);
  }
}

abstract class GetPosts implements PostEvent {
  const factory GetPosts() = _$GetPostsImpl;

  factory GetPosts.fromJson(Map<String, dynamic> json) =
      _$GetPostsImpl.fromJson;
}

/// @nodoc
abstract class _$$MarkAsReadImplCopyWith<$Res> {
  factory _$$MarkAsReadImplCopyWith(
    _$MarkAsReadImpl value,
    $Res Function(_$MarkAsReadImpl) then,
  ) = __$$MarkAsReadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int postId});
}

/// @nodoc
class __$$MarkAsReadImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$MarkAsReadImpl>
    implements _$$MarkAsReadImplCopyWith<$Res> {
  __$$MarkAsReadImplCopyWithImpl(
    _$MarkAsReadImpl _value,
    $Res Function(_$MarkAsReadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? postId = null}) {
    return _then(
      _$MarkAsReadImpl(
        null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkAsReadImpl implements MarkAsRead {
  const _$MarkAsReadImpl(this.postId, {final String? $type})
    : $type = $type ?? 'markAsRead';

  factory _$MarkAsReadImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkAsReadImplFromJson(json);

  @override
  final int postId;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostEvent.markAsRead(postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkAsReadImpl &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postId);

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      __$$MarkAsReadImplCopyWithImpl<_$MarkAsReadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPosts,
    required TResult Function(int postId) markAsRead,
    required TResult Function(int postId, int duration) updateTimerDuration,
    required TResult Function() initializeFromLocalStorage,
    required TResult Function() saveToLocalStorage,
  }) {
    return markAsRead(postId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPosts,
    TResult? Function(int postId)? markAsRead,
    TResult? Function(int postId, int duration)? updateTimerDuration,
    TResult? Function()? initializeFromLocalStorage,
    TResult? Function()? saveToLocalStorage,
  }) {
    return markAsRead?.call(postId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPosts,
    TResult Function(int postId)? markAsRead,
    TResult Function(int postId, int duration)? updateTimerDuration,
    TResult Function()? initializeFromLocalStorage,
    TResult Function()? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(postId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(MarkAsRead value) markAsRead,
    required TResult Function(UpdateTimerDuration value) updateTimerDuration,
    required TResult Function(InitializeFromLocalStorage value)
    initializeFromLocalStorage,
    required TResult Function(SaveToLocalStorage value) saveToLocalStorage,
  }) {
    return markAsRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(MarkAsRead value)? markAsRead,
    TResult? Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult? Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult? Function(SaveToLocalStorage value)? saveToLocalStorage,
  }) {
    return markAsRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPosts value)? getPosts,
    TResult Function(MarkAsRead value)? markAsRead,
    TResult Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult Function(SaveToLocalStorage value)? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (markAsRead != null) {
      return markAsRead(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkAsReadImplToJson(this);
  }
}

abstract class MarkAsRead implements PostEvent {
  const factory MarkAsRead(final int postId) = _$MarkAsReadImpl;

  factory MarkAsRead.fromJson(Map<String, dynamic> json) =
      _$MarkAsReadImpl.fromJson;

  int get postId;

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MarkAsReadImplCopyWith<_$MarkAsReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTimerDurationImplCopyWith<$Res> {
  factory _$$UpdateTimerDurationImplCopyWith(
    _$UpdateTimerDurationImpl value,
    $Res Function(_$UpdateTimerDurationImpl) then,
  ) = __$$UpdateTimerDurationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int postId, int duration});
}

/// @nodoc
class __$$UpdateTimerDurationImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$UpdateTimerDurationImpl>
    implements _$$UpdateTimerDurationImplCopyWith<$Res> {
  __$$UpdateTimerDurationImplCopyWithImpl(
    _$UpdateTimerDurationImpl _value,
    $Res Function(_$UpdateTimerDurationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? postId = null, Object? duration = null}) {
    return _then(
      _$UpdateTimerDurationImpl(
        postId: null == postId
            ? _value.postId
            : postId // ignore: cast_nullable_to_non_nullable
                  as int,
        duration: null == duration
            ? _value.duration
            : duration // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateTimerDurationImpl implements UpdateTimerDuration {
  const _$UpdateTimerDurationImpl({
    required this.postId,
    required this.duration,
    final String? $type,
  }) : $type = $type ?? 'updateTimerDuration';

  factory _$UpdateTimerDurationImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateTimerDurationImplFromJson(json);

  @override
  final int postId;
  @override
  final int duration;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostEvent.updateTimerDuration(postId: $postId, duration: $duration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTimerDurationImpl &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, postId, duration);

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTimerDurationImplCopyWith<_$UpdateTimerDurationImpl> get copyWith =>
      __$$UpdateTimerDurationImplCopyWithImpl<_$UpdateTimerDurationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPosts,
    required TResult Function(int postId) markAsRead,
    required TResult Function(int postId, int duration) updateTimerDuration,
    required TResult Function() initializeFromLocalStorage,
    required TResult Function() saveToLocalStorage,
  }) {
    return updateTimerDuration(postId, duration);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPosts,
    TResult? Function(int postId)? markAsRead,
    TResult? Function(int postId, int duration)? updateTimerDuration,
    TResult? Function()? initializeFromLocalStorage,
    TResult? Function()? saveToLocalStorage,
  }) {
    return updateTimerDuration?.call(postId, duration);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPosts,
    TResult Function(int postId)? markAsRead,
    TResult Function(int postId, int duration)? updateTimerDuration,
    TResult Function()? initializeFromLocalStorage,
    TResult Function()? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (updateTimerDuration != null) {
      return updateTimerDuration(postId, duration);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(MarkAsRead value) markAsRead,
    required TResult Function(UpdateTimerDuration value) updateTimerDuration,
    required TResult Function(InitializeFromLocalStorage value)
    initializeFromLocalStorage,
    required TResult Function(SaveToLocalStorage value) saveToLocalStorage,
  }) {
    return updateTimerDuration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(MarkAsRead value)? markAsRead,
    TResult? Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult? Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult? Function(SaveToLocalStorage value)? saveToLocalStorage,
  }) {
    return updateTimerDuration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPosts value)? getPosts,
    TResult Function(MarkAsRead value)? markAsRead,
    TResult Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult Function(SaveToLocalStorage value)? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (updateTimerDuration != null) {
      return updateTimerDuration(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateTimerDurationImplToJson(this);
  }
}

abstract class UpdateTimerDuration implements PostEvent {
  const factory UpdateTimerDuration({
    required final int postId,
    required final int duration,
  }) = _$UpdateTimerDurationImpl;

  factory UpdateTimerDuration.fromJson(Map<String, dynamic> json) =
      _$UpdateTimerDurationImpl.fromJson;

  int get postId;
  int get duration;

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTimerDurationImplCopyWith<_$UpdateTimerDurationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializeFromLocalStorageImplCopyWith<$Res> {
  factory _$$InitializeFromLocalStorageImplCopyWith(
    _$InitializeFromLocalStorageImpl value,
    $Res Function(_$InitializeFromLocalStorageImpl) then,
  ) = __$$InitializeFromLocalStorageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeFromLocalStorageImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$InitializeFromLocalStorageImpl>
    implements _$$InitializeFromLocalStorageImplCopyWith<$Res> {
  __$$InitializeFromLocalStorageImplCopyWithImpl(
    _$InitializeFromLocalStorageImpl _value,
    $Res Function(_$InitializeFromLocalStorageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$InitializeFromLocalStorageImpl implements InitializeFromLocalStorage {
  const _$InitializeFromLocalStorageImpl({final String? $type})
    : $type = $type ?? 'initializeFromLocalStorage';

  factory _$InitializeFromLocalStorageImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$InitializeFromLocalStorageImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostEvent.initializeFromLocalStorage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeFromLocalStorageImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPosts,
    required TResult Function(int postId) markAsRead,
    required TResult Function(int postId, int duration) updateTimerDuration,
    required TResult Function() initializeFromLocalStorage,
    required TResult Function() saveToLocalStorage,
  }) {
    return initializeFromLocalStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPosts,
    TResult? Function(int postId)? markAsRead,
    TResult? Function(int postId, int duration)? updateTimerDuration,
    TResult? Function()? initializeFromLocalStorage,
    TResult? Function()? saveToLocalStorage,
  }) {
    return initializeFromLocalStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPosts,
    TResult Function(int postId)? markAsRead,
    TResult Function(int postId, int duration)? updateTimerDuration,
    TResult Function()? initializeFromLocalStorage,
    TResult Function()? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (initializeFromLocalStorage != null) {
      return initializeFromLocalStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(MarkAsRead value) markAsRead,
    required TResult Function(UpdateTimerDuration value) updateTimerDuration,
    required TResult Function(InitializeFromLocalStorage value)
    initializeFromLocalStorage,
    required TResult Function(SaveToLocalStorage value) saveToLocalStorage,
  }) {
    return initializeFromLocalStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(MarkAsRead value)? markAsRead,
    TResult? Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult? Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult? Function(SaveToLocalStorage value)? saveToLocalStorage,
  }) {
    return initializeFromLocalStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPosts value)? getPosts,
    TResult Function(MarkAsRead value)? markAsRead,
    TResult Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult Function(SaveToLocalStorage value)? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (initializeFromLocalStorage != null) {
      return initializeFromLocalStorage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InitializeFromLocalStorageImplToJson(this);
  }
}

abstract class InitializeFromLocalStorage implements PostEvent {
  const factory InitializeFromLocalStorage() = _$InitializeFromLocalStorageImpl;

  factory InitializeFromLocalStorage.fromJson(Map<String, dynamic> json) =
      _$InitializeFromLocalStorageImpl.fromJson;
}

/// @nodoc
abstract class _$$SaveToLocalStorageImplCopyWith<$Res> {
  factory _$$SaveToLocalStorageImplCopyWith(
    _$SaveToLocalStorageImpl value,
    $Res Function(_$SaveToLocalStorageImpl) then,
  ) = __$$SaveToLocalStorageImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SaveToLocalStorageImplCopyWithImpl<$Res>
    extends _$PostEventCopyWithImpl<$Res, _$SaveToLocalStorageImpl>
    implements _$$SaveToLocalStorageImplCopyWith<$Res> {
  __$$SaveToLocalStorageImplCopyWithImpl(
    _$SaveToLocalStorageImpl _value,
    $Res Function(_$SaveToLocalStorageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PostEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SaveToLocalStorageImpl implements SaveToLocalStorage {
  const _$SaveToLocalStorageImpl({final String? $type})
    : $type = $type ?? 'saveToLocalStorage';

  factory _$SaveToLocalStorageImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaveToLocalStorageImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'PostEvent.saveToLocalStorage()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SaveToLocalStorageImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getPosts,
    required TResult Function(int postId) markAsRead,
    required TResult Function(int postId, int duration) updateTimerDuration,
    required TResult Function() initializeFromLocalStorage,
    required TResult Function() saveToLocalStorage,
  }) {
    return saveToLocalStorage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getPosts,
    TResult? Function(int postId)? markAsRead,
    TResult? Function(int postId, int duration)? updateTimerDuration,
    TResult? Function()? initializeFromLocalStorage,
    TResult? Function()? saveToLocalStorage,
  }) {
    return saveToLocalStorage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getPosts,
    TResult Function(int postId)? markAsRead,
    TResult Function(int postId, int duration)? updateTimerDuration,
    TResult Function()? initializeFromLocalStorage,
    TResult Function()? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (saveToLocalStorage != null) {
      return saveToLocalStorage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPosts value) getPosts,
    required TResult Function(MarkAsRead value) markAsRead,
    required TResult Function(UpdateTimerDuration value) updateTimerDuration,
    required TResult Function(InitializeFromLocalStorage value)
    initializeFromLocalStorage,
    required TResult Function(SaveToLocalStorage value) saveToLocalStorage,
  }) {
    return saveToLocalStorage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPosts value)? getPosts,
    TResult? Function(MarkAsRead value)? markAsRead,
    TResult? Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult? Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult? Function(SaveToLocalStorage value)? saveToLocalStorage,
  }) {
    return saveToLocalStorage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPosts value)? getPosts,
    TResult Function(MarkAsRead value)? markAsRead,
    TResult Function(UpdateTimerDuration value)? updateTimerDuration,
    TResult Function(InitializeFromLocalStorage value)?
    initializeFromLocalStorage,
    TResult Function(SaveToLocalStorage value)? saveToLocalStorage,
    required TResult orElse(),
  }) {
    if (saveToLocalStorage != null) {
      return saveToLocalStorage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SaveToLocalStorageImplToJson(this);
  }
}

abstract class SaveToLocalStorage implements PostEvent {
  const factory SaveToLocalStorage() = _$SaveToLocalStorageImpl;

  factory SaveToLocalStorage.fromJson(Map<String, dynamic> json) =
      _$SaveToLocalStorageImpl.fromJson;
}
