part of 'review_model.dart';
T _$identity<T>(T value) => value;
mixin _$ReviewModel {
  int get reviewCount;
  double get averageReview;
  List<double> get ratingsMap;
  List<ReviewsModel> get reviews;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      _$ReviewModelCopyWithImpl<ReviewModel>(this as ReviewModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewModel &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.averageReview, averageReview) ||
                other.averageReview == averageReview) &&
            const DeepCollectionEquality()
                .equals(other.ratingsMap, ratingsMap) &&
            const DeepCollectionEquality().equals(other.reviews, reviews));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewCount,
      averageReview,
      const DeepCollectionEquality().hash(ratingsMap),
      const DeepCollectionEquality().hash(reviews));
  @override
  String toString() {
    return 'ReviewModel(reviewCount: $reviewCount, averageReview: $averageReview, ratingsMap: $ratingsMap, reviews: $reviews)';
  }
}
abstract mixin class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) _then) =
      _$ReviewModelCopyWithImpl;
  @useResult
  $Res call(
      {int reviewCount,
      double averageReview,
      List<double> ratingsMap,
      List<ReviewsModel> reviews});
}
class _$ReviewModelCopyWithImpl<$Res> implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._self, this._then);
  final ReviewModel _self;
  final $Res Function(ReviewModel) _then;
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
              as List<ReviewsModel>,
    ));
  }
}
extension ReviewModelPatterns on ReviewModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReviewModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReviewModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReviewModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int reviewCount, double averageReview,
            List<double> ratingsMap, List<ReviewsModel> reviews)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
        return $default(_that.reviewCount, _that.averageReview,
            _that.ratingsMap, _that.reviews);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(int reviewCount, double averageReview,
            List<double> ratingsMap, List<ReviewsModel> reviews)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel():
        return $default(_that.reviewCount, _that.averageReview,
            _that.ratingsMap, _that.reviews);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int reviewCount, double averageReview,
            List<double> ratingsMap, List<ReviewsModel> reviews)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewModel() when $default != null:
        return $default(_that.reviewCount, _that.averageReview,
            _that.ratingsMap, _that.reviews);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _ReviewModel implements ReviewModel {
  const _ReviewModel(
      {required this.reviewCount,
      required this.averageReview,
      required final List<double> ratingsMap,
      required final List<ReviewsModel> reviews})
      : _ratingsMap = ratingsMap,
        _reviews = reviews;
  factory _ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
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
  final List<ReviewsModel> _reviews;
  @override
  List<ReviewsModel> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    return EqualUnmodifiableListView(_reviews);
  }
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewModelCopyWith<_ReviewModel> get copyWith =>
      __$ReviewModelCopyWithImpl<_ReviewModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$ReviewModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewModel &&
            (identical(other.reviewCount, reviewCount) ||
                other.reviewCount == reviewCount) &&
            (identical(other.averageReview, averageReview) ||
                other.averageReview == averageReview) &&
            const DeepCollectionEquality()
                .equals(other._ratingsMap, _ratingsMap) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      reviewCount,
      averageReview,
      const DeepCollectionEquality().hash(_ratingsMap),
      const DeepCollectionEquality().hash(_reviews));
  @override
  String toString() {
    return 'ReviewModel(reviewCount: $reviewCount, averageReview: $averageReview, ratingsMap: $ratingsMap, reviews: $reviews)';
  }
}
abstract mixin class _$ReviewModelCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$ReviewModelCopyWith(
          _ReviewModel value, $Res Function(_ReviewModel) _then) =
      __$ReviewModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int reviewCount,
      double averageReview,
      List<double> ratingsMap,
      List<ReviewsModel> reviews});
}
class __$ReviewModelCopyWithImpl<$Res> implements _$ReviewModelCopyWith<$Res> {
  __$ReviewModelCopyWithImpl(this._self, this._then);
  final _ReviewModel _self;
  final $Res Function(_ReviewModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviewCount = null,
    Object? averageReview = null,
    Object? ratingsMap = null,
    Object? reviews = null,
  }) {
    return _then(_ReviewModel(
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
              as List<ReviewsModel>,
    ));
  }
}
mixin _$ReviewsModel {
  String get review;
  double get rating;
  String get product;
  ReviewUserModel get userId;
  String get orderId;
  @JsonKey(name: "created_at")
  DateTime get createdAt;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  String get id;
  bool get verifiedPurchase;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewsModelCopyWith<ReviewsModel> get copyWith =>
      _$ReviewsModelCopyWithImpl<ReviewsModel>(
          this as ReviewsModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewsModel &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, review, rating, product, userId,
      orderId, createdAt, updatedAt, id, verifiedPurchase);
  @override
  String toString() {
    return 'ReviewsModel(review: $review, rating: $rating, product: $product, userId: $userId, orderId: $orderId, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, verifiedPurchase: $verifiedPurchase)';
  }
}
abstract mixin class $ReviewsModelCopyWith<$Res> {
  factory $ReviewsModelCopyWith(
          ReviewsModel value, $Res Function(ReviewsModel) _then) =
      _$ReviewsModelCopyWithImpl;
  @useResult
  $Res call(
      {String review,
      double rating,
      String product,
      ReviewUserModel userId,
      String orderId,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      String id,
      bool verifiedPurchase});
  $ReviewUserModelCopyWith<$Res> get userId;
}
class _$ReviewsModelCopyWithImpl<$Res> implements $ReviewsModelCopyWith<$Res> {
  _$ReviewsModelCopyWithImpl(this._self, this._then);
  final ReviewsModel _self;
  final $Res Function(ReviewsModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? review = null,
    Object? rating = null,
    Object? product = null,
    Object? userId = null,
    Object? orderId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
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
              as ReviewUserModel,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $ReviewUserModelCopyWith<$Res> get userId {
    return $ReviewUserModelCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}
extension ReviewsModelPatterns on ReviewsModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReviewsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReviewsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReviewsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsModel() when $default != null:
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
            ReviewUserModel userId,
            String orderId,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt,
            String id,
            bool verifiedPurchase)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewsModel() when $default != null:
        return $default(
            _that.review,
            _that.rating,
            _that.product,
            _that.userId,
            _that.orderId,
            _that.createdAt,
            _that.updatedAt,
            _that.id,
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
            ReviewUserModel userId,
            String orderId,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt,
            String id,
            bool verifiedPurchase)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsModel():
        return $default(
            _that.review,
            _that.rating,
            _that.product,
            _that.userId,
            _that.orderId,
            _that.createdAt,
            _that.updatedAt,
            _that.id,
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
            ReviewUserModel userId,
            String orderId,
            @JsonKey(name: "created_at") DateTime createdAt,
            @JsonKey(name: "updated_at") DateTime updatedAt,
            String id,
            bool verifiedPurchase)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewsModel() when $default != null:
        return $default(
            _that.review,
            _that.rating,
            _that.product,
            _that.userId,
            _that.orderId,
            _that.createdAt,
            _that.updatedAt,
            _that.id,
            _that.verifiedPurchase);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _ReviewsModel implements ReviewsModel {
  const _ReviewsModel(
      {required this.review,
      required this.rating,
      required this.product,
      required this.userId,
      required this.orderId,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "updated_at") required this.updatedAt,
      required this.id,
      required this.verifiedPurchase});
  factory _ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);
  @override
  final String review;
  @override
  final double rating;
  @override
  final String product;
  @override
  final ReviewUserModel userId;
  @override
  final String orderId;
  @override
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  final String id;
  @override
  final bool verifiedPurchase;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewsModelCopyWith<_ReviewsModel> get copyWith =>
      __$ReviewsModelCopyWithImpl<_ReviewsModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$ReviewsModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewsModel &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.verifiedPurchase, verifiedPurchase) ||
                other.verifiedPurchase == verifiedPurchase));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, review, rating, product, userId,
      orderId, createdAt, updatedAt, id, verifiedPurchase);
  @override
  String toString() {
    return 'ReviewsModel(review: $review, rating: $rating, product: $product, userId: $userId, orderId: $orderId, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, verifiedPurchase: $verifiedPurchase)';
  }
}
abstract mixin class _$ReviewsModelCopyWith<$Res>
    implements $ReviewsModelCopyWith<$Res> {
  factory _$ReviewsModelCopyWith(
          _ReviewsModel value, $Res Function(_ReviewsModel) _then) =
      __$ReviewsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String review,
      double rating,
      String product,
      ReviewUserModel userId,
      String orderId,
      @JsonKey(name: "created_at") DateTime createdAt,
      @JsonKey(name: "updated_at") DateTime updatedAt,
      String id,
      bool verifiedPurchase});
  @override
  $ReviewUserModelCopyWith<$Res> get userId;
}
class __$ReviewsModelCopyWithImpl<$Res>
    implements _$ReviewsModelCopyWith<$Res> {
  __$ReviewsModelCopyWithImpl(this._self, this._then);
  final _ReviewsModel _self;
  final $Res Function(_ReviewsModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? review = null,
    Object? rating = null,
    Object? product = null,
    Object? userId = null,
    Object? orderId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? id = null,
    Object? verifiedPurchase = null,
  }) {
    return _then(_ReviewsModel(
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
              as ReviewUserModel,
      orderId: null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      verifiedPurchase: null == verifiedPurchase
          ? _self.verifiedPurchase
          : verifiedPurchase // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $ReviewUserModelCopyWith<$Res> get userId {
    return $ReviewUserModelCopyWith<$Res>(_self.userId, (value) {
      return _then(_self.copyWith(userId: value));
    });
  }
}
mixin _$ReviewUserModel {
  String get name;
  String get id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewUserModelCopyWith<ReviewUserModel> get copyWith =>
      _$ReviewUserModelCopyWithImpl<ReviewUserModel>(
          this as ReviewUserModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewUserModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);
  @override
  String toString() {
    return 'ReviewUserModel(name: $name, id: $id)';
  }
}
abstract mixin class $ReviewUserModelCopyWith<$Res> {
  factory $ReviewUserModelCopyWith(
          ReviewUserModel value, $Res Function(ReviewUserModel) _then) =
      _$ReviewUserModelCopyWithImpl;
  @useResult
  $Res call({String name, String id});
}
class _$ReviewUserModelCopyWithImpl<$Res>
    implements $ReviewUserModelCopyWith<$Res> {
  _$ReviewUserModelCopyWithImpl(this._self, this._then);
  final ReviewUserModel _self;
  final $Res Function(ReviewUserModel) _then;
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
extension ReviewUserModelPatterns on ReviewUserModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ReviewUserModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ReviewUserModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ReviewUserModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUserModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ReviewUserModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ReviewUserModel() when $default != null:
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
      case _ReviewUserModel() when $default != null:
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
      case _ReviewUserModel():
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
      case _ReviewUserModel() when $default != null:
        return $default(_that.name, _that.id);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _ReviewUserModel implements ReviewUserModel {
  const _ReviewUserModel({required this.name, required this.id});
  factory _ReviewUserModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewUserModelFromJson(json);
  @override
  final String name;
  @override
  final String id;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewUserModelCopyWith<_ReviewUserModel> get copyWith =>
      __$ReviewUserModelCopyWithImpl<_ReviewUserModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$ReviewUserModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewUserModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, id);
  @override
  String toString() {
    return 'ReviewUserModel(name: $name, id: $id)';
  }
}
abstract mixin class _$ReviewUserModelCopyWith<$Res>
    implements $ReviewUserModelCopyWith<$Res> {
  factory _$ReviewUserModelCopyWith(
          _ReviewUserModel value, $Res Function(_ReviewUserModel) _then) =
      __$ReviewUserModelCopyWithImpl;
  @override
  @useResult
  $Res call({String name, String id});
}
class __$ReviewUserModelCopyWithImpl<$Res>
    implements _$ReviewUserModelCopyWith<$Res> {
  __$ReviewUserModelCopyWithImpl(this._self, this._then);
  final _ReviewUserModel _self;
  final $Res Function(_ReviewUserModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? id = null,
  }) {
    return _then(_ReviewUserModel(
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
