part of 'update_category_req.dart';
T _$identity<T>(T value) => value;
mixin _$UpdateCategoryReq {
  String? get title;
  String? get image;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateCategoryReqCopyWith<UpdateCategoryReq> get copyWith =>
      _$UpdateCategoryReqCopyWithImpl<UpdateCategoryReq>(
          this as UpdateCategoryReq, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateCategoryReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image);
  @override
  String toString() {
    return 'UpdateCategoryReq(title: $title, image: $image)';
  }
}
abstract mixin class $UpdateCategoryReqCopyWith<$Res> {
  factory $UpdateCategoryReqCopyWith(
          UpdateCategoryReq value, $Res Function(UpdateCategoryReq) _then) =
      _$UpdateCategoryReqCopyWithImpl;
  @useResult
  $Res call({String? title, String? image});
}
class _$UpdateCategoryReqCopyWithImpl<$Res>
    implements $UpdateCategoryReqCopyWith<$Res> {
  _$UpdateCategoryReqCopyWithImpl(this._self, this._then);
  final UpdateCategoryReq _self;
  final $Res Function(UpdateCategoryReq) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_self.copyWith(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}
extension UpdateCategoryReqPatterns on UpdateCategoryReq {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UpdateCategoryReq value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateCategoryReq() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UpdateCategoryReq value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateCategoryReq():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UpdateCategoryReq value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateCategoryReq() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? title, String? image)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UpdateCategoryReq() when $default != null:
        return $default(_that.title, _that.image);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? title, String? image) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateCategoryReq():
        return $default(_that.title, _that.image);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? title, String? image)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UpdateCategoryReq() when $default != null:
        return $default(_that.title, _that.image);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _UpdateCategoryReq implements UpdateCategoryReq {
  const _UpdateCategoryReq({this.title, this.image});
  factory _UpdateCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryReqFromJson(json);
  @override
  final String? title;
  @override
  final String? image;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateCategoryReqCopyWith<_UpdateCategoryReq> get copyWith =>
      __$UpdateCategoryReqCopyWithImpl<_UpdateCategoryReq>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$UpdateCategoryReqToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateCategoryReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image);
  @override
  String toString() {
    return 'UpdateCategoryReq(title: $title, image: $image)';
  }
}
abstract mixin class _$UpdateCategoryReqCopyWith<$Res>
    implements $UpdateCategoryReqCopyWith<$Res> {
  factory _$UpdateCategoryReqCopyWith(
          _UpdateCategoryReq value, $Res Function(_UpdateCategoryReq) _then) =
      __$UpdateCategoryReqCopyWithImpl;
  @override
  @useResult
  $Res call({String? title, String? image});
}
class __$UpdateCategoryReqCopyWithImpl<$Res>
    implements _$UpdateCategoryReqCopyWith<$Res> {
  __$UpdateCategoryReqCopyWithImpl(this._self, this._then);
  final _UpdateCategoryReq _self;
  final $Res Function(_UpdateCategoryReq) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = freezed,
    Object? image = freezed,
  }) {
    return _then(_UpdateCategoryReq(
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}
