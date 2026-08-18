part of 'user_review_model.dart';
T _$identity<T>(T value) => value;
mixin _$UserReviewModel {
  String get review;
  double get rating;
  String get product;
  String get orderId;
  String get id;
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserReviewModelCopyWith<UserReviewModel> get copyWith =>
      _$UserReviewModelCopyWithImpl<UserReviewModel>(
          this as UserReviewModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserReviewModel &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, review, rating, product, orderId, id, createdAt, updatedAt);
  @override
  String toString() {
    return 'UserReviewModel(review: $review, rating: $rating, product: $product, orderId: $orderId, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
abstract mixin class $UserReviewModelCopyWith<$Res> {
  factory $UserReviewModelCopyWith(
          UserReviewModel value, $Res Function(UserReviewModel) _then) =
      _$UserReviewModelCopyWithImpl;
  @useResult
  $Res call(
      {String review,
      double rating,
      String product,
      String orderId,
      String id,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt});
}
class _$UserReviewModelCopyWithImpl<$Res>
    implements $UserReviewModelCopyWith<$Res> {
  _$UserReviewModelCopyWithImpl(this._self, this._then);
  final UserReviewModel _self;
  final $Res Function(UserReviewModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
    Object? rating = null,
    Object? product = null,
    Object? orderId = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}
extension UserReviewModelPatterns on UserReviewModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserReviewModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReviewModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserReviewModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReviewModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserReviewModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReviewModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String review,
            double rating,
            String product,
            String orderId,
            String id,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserReviewModel() when $default != null:
        return $default(_that.review, _that.rating, _that.product,
            _that.orderId, _that.id, _that.createdAt, _that.updatedAt);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String review,
            double rating,
            String product,
            String orderId,
            String id,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReviewModel():
        return $default(_that.review, _that.rating, _that.product,
            _that.orderId, _that.id, _that.createdAt, _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String review,
            double rating,
            String product,
            String orderId,
            String id,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserReviewModel() when $default != null:
        return $default(_that.review, _that.rating, _that.product,
            _that.orderId, _that.id, _that.createdAt, _that.updatedAt);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _UserReviewModel implements UserReviewModel {
  const _UserReviewModel(
      {required this.review,
      required this.rating,
      required this.product,
      required this.orderId,
      required this.id,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt});
  factory _UserReviewModel.fromJson(Map<String, dynamic> json) =>
      _$UserReviewModelFromJson(json);
  @override
  final String review;
  @override
  final double rating;
  @override
  final String product;
  @override
  final String orderId;
  @override
  final String id;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserReviewModelCopyWith<_UserReviewModel> get copyWith =>
      __$UserReviewModelCopyWithImpl<_UserReviewModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$UserReviewModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserReviewModel &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, review, rating, product, orderId, id, createdAt, updatedAt);
  @override
  String toString() {
    return 'UserReviewModel(review: $review, rating: $rating, product: $product, orderId: $orderId, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
abstract mixin class _$UserReviewModelCopyWith<$Res>
    implements $UserReviewModelCopyWith<$Res> {
  factory _$UserReviewModelCopyWith(
          _UserReviewModel value, $Res Function(_UserReviewModel) _then) =
      __$UserReviewModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String review,
      double rating,
      String product,
      String orderId,
      String id,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt});
}
class __$UserReviewModelCopyWithImpl<$Res>
    implements _$UserReviewModelCopyWith<$Res> {
  __$UserReviewModelCopyWithImpl(this._self, this._then);
  final _UserReviewModel _self;
  final $Res Function(_UserReviewModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? review = null,
    Object? rating = null,
    Object? product = null,
    Object? orderId = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_UserReviewModel(
      review: null == review
          ? _self.review
          : review // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}
