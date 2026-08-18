part of 'create_category_req.dart';
T _$identity<T>(T value) => value;
mixin _$CreateCategoryReq {
  String get title;
  String get image;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateCategoryReqCopyWith<CreateCategoryReq> get copyWith =>
      _$CreateCategoryReqCopyWithImpl<CreateCategoryReq>(
          this as CreateCategoryReq, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateCategoryReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image);
  @override
  String toString() {
    return 'CreateCategoryReq(title: $title, image: $image)';
  }
}
abstract mixin class $CreateCategoryReqCopyWith<$Res> {
  factory $CreateCategoryReqCopyWith(
          CreateCategoryReq value, $Res Function(CreateCategoryReq) _then) =
      _$CreateCategoryReqCopyWithImpl;
  @useResult
  $Res call({String title, String image});
}
class _$CreateCategoryReqCopyWithImpl<$Res>
    implements $CreateCategoryReqCopyWith<$Res> {
  _$CreateCategoryReqCopyWithImpl(this._self, this._then);
  final CreateCategoryReq _self;
  final $Res Function(CreateCategoryReq) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension CreateCategoryReqPatterns on CreateCategoryReq {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_CreateCategoryReq value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCategoryReq() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_CreateCategoryReq value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCategoryReq():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_CreateCategoryReq value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCategoryReq() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String title, String image)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreateCategoryReq() when $default != null:
        return $default(_that.title, _that.image);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String title, String image) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCategoryReq():
        return $default(_that.title, _that.image);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String title, String image)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreateCategoryReq() when $default != null:
        return $default(_that.title, _that.image);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _CreateCategoryReq implements CreateCategoryReq {
  const _CreateCategoryReq({required this.title, required this.image});
  factory _CreateCategoryReq.fromJson(Map<String, dynamic> json) =>
      _$CreateCategoryReqFromJson(json);
  @override
  final String title;
  @override
  final String image;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateCategoryReqCopyWith<_CreateCategoryReq> get copyWith =>
      __$CreateCategoryReqCopyWithImpl<_CreateCategoryReq>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$CreateCategoryReqToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateCategoryReq &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, image);
  @override
  String toString() {
    return 'CreateCategoryReq(title: $title, image: $image)';
  }
}
abstract mixin class _$CreateCategoryReqCopyWith<$Res>
    implements $CreateCategoryReqCopyWith<$Res> {
  factory _$CreateCategoryReqCopyWith(
          _CreateCategoryReq value, $Res Function(_CreateCategoryReq) _then) =
      __$CreateCategoryReqCopyWithImpl;
  @override
  @useResult
  $Res call({String title, String image});
}
class __$CreateCategoryReqCopyWithImpl<$Res>
    implements _$CreateCategoryReqCopyWith<$Res> {
  __$CreateCategoryReqCopyWithImpl(this._self, this._then);
  final _CreateCategoryReq _self;
  final $Res Function(_CreateCategoryReq) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? image = null,
  }) {
    return _then(_CreateCategoryReq(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
