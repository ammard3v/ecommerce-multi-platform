part of 'review_entity.dart';
T _$identity<T>(T value) => value;
mixin _$ReviewEntity {
  int get reviewCount;
  double get averageReview;
  List<double> get ratingsMap;
  List<ReviewsEntity> get reviews;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewEntityCopyWith<ReviewEntity> get copyWith =>
      _$ReviewEntityCopyWithImpl<ReviewEntity>(
          this as ReviewEntity, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewEntity &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.averageReview, averageReview) ||
                other.averageReview == averageReview) &&
            const DeepCollectionEquality()
                .equals(other.ratingsMap, ratingsMap) &&
            const DeepCollectionEquality().equals(other.reviews, reviews));
  }
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewCount,
      averageReview,
      const DeepCollectionEquality().hash(ratingsMap),
      const DeepCollectionEquality().hash(reviews));
  @override
  String toString() {
    return 'ReviewEntity(reviewCount: $reviewCount, averageReview: $averageReview, ratingsMap: $ratingsMap, reviews: $reviews)';
  }
}
abstract mixin class $ReviewEntityCopyWith<$Res> {
  factory $ReviewEntityCopyWith(
          ReviewEntity value, $Res Function(ReviewEntity) _then) =
      _$ReviewEntityCopyWithImpl;
  @useResult
  $Res call(
      {int reviewCount,
      double averageReview,
      List<double> ratingsMap,
      List<ReviewsEntity> reviews});
}
class _$ReviewEntityCopyWithImpl<$Res> implements $ReviewEntityCopyWith<$Res> {
  _$ReviewEntityCopyWithImpl(this._self, this._then);
  final ReviewEntity _self;
  final $Res Function(ReviewEntity) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewCount = null,
    Object? averageReview = null,
    Object? ratingsMap = null,
    Object? reviews = null,
  }) {
    return _then(_self.copyWith(
      reviewCount: null == reviewCount
          ? _self.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageReview: null == averageReview
          ? _self.averageReview
          : averageReview // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsMap: null == ratingsMap
          ? _self.ratingsMap
          : ratingsMap // ignore: cast_nullable_to_non_nullable
              as List<double>,
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewsEntity>,
    ));
  }
}
extension ReviewEntityPatterns on ReviewEntity {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReviewEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReviewEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReviewEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int reviewCount, double averageReview,
            List<double> ratingsMap, List<ReviewsEntity> reviews)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
        return $default(_that.reviewCount, _that.averageReview,
            _that.ratingsMap, _that.reviews);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int reviewCount, double averageReview,
            List<double> ratingsMap, List<ReviewsEntity> reviews)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity():
        return $default(_that.reviewCount, _that.averageReview,
            _that.ratingsMap, _that.reviews);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int reviewCount, double averageReview,
            List<double> ratingsMap, List<ReviewsEntity> reviews)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewEntity() when $default != null:
        return $default(_that.reviewCount, _that.averageReview,
            _that.ratingsMap, _that.reviews);
      case _:
        return null;
    }
  }
}
class _ReviewEntity implements ReviewEntity {
  const _ReviewEntity(
      {required this.reviewCount,
      required this.averageReview,
      required final List<double> ratingsMap,
      required final List<ReviewsEntity> reviews})
      : _ratingsMap = ratingsMap,
        _reviews = reviews;
  @override
  final int reviewCount;
  @override
  final double averageReview;
  final List<double> _ratingsMap;
  @override
  List<double> get ratingsMap {
    if (_ratingsMap is EqualUnmodifiableListView) return _ratingsMap;
    return EqualUnmodifiableListView(_ratingsMap);
  }
  final List<ReviewsEntity> _reviews;
  @override
  List<ReviewsEntity> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    return EqualUnmodifiableListView(_reviews);
  }
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewEntityCopyWith<_ReviewEntity> get copyWith =>
      __$ReviewEntityCopyWithImpl<_ReviewEntity>(this, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewEntity &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.averageReview, averageReview) ||
                other.averageReview == averageReview) &&
            const DeepCollectionEquality()
                .equals(other._ratingsMap, _ratingsMap) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewCount,
      averageReview,
      const DeepCollectionEquality().hash(_ratingsMap),
      const DeepCollectionEquality().hash(_reviews));
  @override
  String toString() {
    return 'ReviewEntity(reviewCount: $reviewCount, averageReview: $averageReview, ratingsMap: $ratingsMap, reviews: $reviews)';
  }
}
abstract mixin class _$ReviewEntityCopyWith<$Res>
    implements $ReviewEntityCopyWith<$Res> {
  factory _$ReviewEntityCopyWith(
          _ReviewEntity value, $Res Function(_ReviewEntity) _then) =
      __$ReviewEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int reviewCount,
      double averageReview,
      List<double> ratingsMap,
      List<ReviewsEntity> reviews});
}
class __$ReviewEntityCopyWithImpl<$Res>
    implements _$ReviewEntityCopyWith<$Res> {
  __$ReviewEntityCopyWithImpl(this._self, this._then);
  final _ReviewEntity _self;
  final $Res Function(_ReviewEntity) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviewCount = null,
    Object? averageReview = null,
    Object? ratingsMap = null,
    Object? reviews = null,
  }) {
    return _then(_ReviewEntity(
      reviewCount: null == reviewCount
          ? _self.reviewCount
          : reviewCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageReview: null == averageReview
          ? _self.averageReview
          : averageReview // ignore: cast_nullable_to_non_nullable
              as double,
      ratingsMap: null == ratingsMap
          ? _self._ratingsMap
          : ratingsMap // ignore: cast_nullable_to_non_nullable
              as List<double>,
      reviews: null == reviews
          ? _self._reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as List<ReviewsEntity>,
    ));
  }
}
mixin _$ReviewsEntity {
  String get review;
  double get rating;
  String get product;
  ReviewUserEntity get userId;
  String get orderId;
  String get id;
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  bool get verifiedPurchase;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewsEntityCopyWith<ReviewsEntity> get copyWith =>
      _$ReviewsEntityCopyWithImpl<ReviewsEntity>(
          this as ReviewsEntity, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewsEntity &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase));
  }
  @override
  int get hashCode => Object.hash(runtimeType, review, rating, product, userId,
      orderId, id, createdAt, updatedAt, verifiedPurchase);
  @override
  String toString() {
    return 'ReviewsEntity(review: $review, rating: $rating, product: $product, userId: $userId, orderId: $orderId, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, verifiedPurchase: $verifiedPurchase)';
  }
}
abstract mixin class $ReviewsEntityCopyWith<$Res> {
  factory $ReviewsEntityCopyWith(
          ReviewsEntity value, $Res Function(ReviewsEntity) _then) =
      _$ReviewsEntityCopyWithImpl;
  @useResult
  $Res call(
      {String review,
      double rating,
      String product,
      ReviewUserEntity userId,
      String orderId,
      String id,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      bool verifiedPurchase});
  $ReviewUserEntityCopyWith<$Res> get userId;
}
class _$ReviewsEntityCopyWithImpl<$Res>
    implements $ReviewsEntityCopyWith<$Res> {
  _$ReviewsEntityCopyWithImpl(this._self, this._then);
  final ReviewsEntity _self;
  final $Res Function(ReviewsEntity) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
    Object? rating = null,
    Object? product = null,
    Object? userId = null,
    Object? orderId = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? verifiedPurchase = null,
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
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as ReviewUserEntity,
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
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $ReviewUserEntityCopyWith<$Res> get userId {
    return $ReviewUserEntityCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}
extension ReviewsEntityPatterns on ReviewsEntity {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReviewsEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReviewsEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReviewsEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsEntity() when $default != null:
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
            ReviewUserEntity userId,
            String orderId,
            String id,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt,
            bool verifiedPurchase)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsEntity() when $default != null:
        return $default(
            _that.review,
            _that.rating,
            _that.product,
            _that.userId,
            _that.orderId,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.verifiedPurchase);
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
            ReviewUserEntity userId,
            String orderId,
            String id,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt,
            bool verifiedPurchase)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsEntity():
        return $default(
            _that.review,
            _that.rating,
            _that.product,
            _that.userId,
            _that.orderId,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.verifiedPurchase);
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
            ReviewUserEntity userId,
            String orderId,
            String id,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt,
            bool verifiedPurchase)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsEntity() when $default != null:
        return $default(
            _that.review,
            _that.rating,
            _that.product,
            _that.userId,
            _that.orderId,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.verifiedPurchase);
      case _:
        return null;
    }
  }
}
class _ReviewsEntity implements ReviewsEntity {
  const _ReviewsEntity(
      {required this.review,
      required this.rating,
      required this.product,
      required this.userId,
      required this.orderId,
      required this.id,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      required this.verifiedPurchase});
  @override
  final String review;
  @override
  final double rating;
  @override
  final String product;
  @override
  final ReviewUserEntity userId;
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
  final bool verifiedPurchase;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewsEntityCopyWith<_ReviewsEntity> get copyWith =>
      __$ReviewsEntityCopyWithImpl<_ReviewsEntity>(this, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewsEntity &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase));
  }
  @override
  int get hashCode => Object.hash(runtimeType, review, rating, product, userId,
      orderId, id, createdAt, updatedAt, verifiedPurchase);
  @override
  String toString() {
    return 'ReviewsEntity(review: $review, rating: $rating, product: $product, userId: $userId, orderId: $orderId, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, verifiedPurchase: $verifiedPurchase)';
  }
}
abstract mixin class _$ReviewsEntityCopyWith<$Res>
    implements $ReviewsEntityCopyWith<$Res> {
  factory _$ReviewsEntityCopyWith(
          _ReviewsEntity value, $Res Function(_ReviewsEntity) _then) =
      __$ReviewsEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String review,
      double rating,
      String product,
      ReviewUserEntity userId,
      String orderId,
      String id,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      bool verifiedPurchase});
  @override
  $ReviewUserEntityCopyWith<$Res> get userId;
}
class __$ReviewsEntityCopyWithImpl<$Res>
    implements _$ReviewsEntityCopyWith<$Res> {
  __$ReviewsEntityCopyWithImpl(this._self, this._then);
  final _ReviewsEntity _self;
  final $Res Function(_ReviewsEntity) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? review = null,
    Object? rating = null,
    Object? product = null,
    Object? userId = null,
    Object? orderId = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? verifiedPurchase = null,
  }) {
    return _then(_ReviewsEntity(
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
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as ReviewUserEntity,
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
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $ReviewUserEntityCopyWith<$Res> get userId {
    return $ReviewUserEntityCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}
mixin _$ReviewUserEntity {
  String get name;
  String get id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewUserEntityCopyWith<ReviewUserEntity> get copyWith =>
      _$ReviewUserEntityCopyWithImpl<ReviewUserEntity>(
          this as ReviewUserEntity, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewUserEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }
  @override
  int get hashCode => Object.hash(runtimeType, name, id);
  @override
  String toString() {
    return 'ReviewUserEntity(name: $name, id: $id)';
  }
}
abstract mixin class $ReviewUserEntityCopyWith<$Res> {
  factory $ReviewUserEntityCopyWith(
          ReviewUserEntity value, $Res Function(ReviewUserEntity) _then) =
      _$ReviewUserEntityCopyWithImpl;
  @useResult
  $Res call({String name, String id});
}
class _$ReviewUserEntityCopyWithImpl<$Res>
    implements $ReviewUserEntityCopyWith<$Res> {
  _$ReviewUserEntityCopyWithImpl(this._self, this._then);
  final ReviewUserEntity _self;
  final $Res Function(ReviewUserEntity) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension ReviewUserEntityPatterns on ReviewUserEntity {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReviewUserEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewUserEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReviewUserEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUserEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReviewUserEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUserEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, String id)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewUserEntity() when $default != null:
        return $default(_that.name, _that.id);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, String id) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUserEntity():
        return $default(_that.name, _that.id);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String name, String id)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUserEntity() when $default != null:
        return $default(_that.name, _that.id);
      case _:
        return null;
    }
  }
}
class _ReviewUserEntity implements ReviewUserEntity {
  const _ReviewUserEntity({required this.name, required this.id});
  @override
  final String name;
  @override
  final String id;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewUserEntityCopyWith<_ReviewUserEntity> get copyWith =>
      __$ReviewUserEntityCopyWithImpl<_ReviewUserEntity>(this, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewUserEntity &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }
  @override
  int get hashCode => Object.hash(runtimeType, name, id);
  @override
  String toString() {
    return 'ReviewUserEntity(name: $name, id: $id)';
  }
}
abstract mixin class _$ReviewUserEntityCopyWith<$Res>
    implements $ReviewUserEntityCopyWith<$Res> {
  factory _$ReviewUserEntityCopyWith(
          _ReviewUserEntity value, $Res Function(_ReviewUserEntity) _then) =
      __$ReviewUserEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String id});
}
class __$ReviewUserEntityCopyWithImpl<$Res>
    implements _$ReviewUserEntityCopyWith<$Res> {
  __$ReviewUserEntityCopyWithImpl(this._self, this._then);
  final _ReviewUserEntity _self;
  final $Res Function(_ReviewUserEntity) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_ReviewUserEntity(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
