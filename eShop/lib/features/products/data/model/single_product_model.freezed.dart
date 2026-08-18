part of 'single_product_model.dart';
T _$identity<T>(T value) => value;
mixin _$SingleProductModel {
  SingleRatingModel get ratings;
  String get title;
  String get description;
  int get price;
  int get discount;
  List<String> get images;
  int get stock;
  @JsonKey(name: 'units_sold')
  int get unitsSold;
  @JsonKey(name: 'is_featured')
  bool get isFeatured;
  SingleCategoryModel get category;
  String get slug;
  @JsonKey(name: 'index0Image')
  String get index0Image;
  String get id;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SingleProductModelCopyWith<SingleProductModel> get copyWith =>
      _$SingleProductModelCopyWithImpl<SingleProductModel>(
          this as SingleProductModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SingleProductModel &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.unitsSold, unitsSold) ||
                other.unitsSold == unitsSold) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.index0Image, index0Image) ||
                other.index0Image == index0Image) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ratings,
      title,
      description,
      price,
      discount,
      const DeepCollectionEquality().hash(images),
      stock,
      unitsSold,
      isFeatured,
      category,
      slug,
      index0Image,
      id,
      createdAt,
      updatedAt);
  @override
  String toString() {
    return 'SingleProductModel(ratings: $ratings, title: $title, description: $description, price: $price, discount: $discount, images: $images, stock: $stock, unitsSold: $unitsSold, isFeatured: $isFeatured, category: $category, slug: $slug, index0Image: $index0Image, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
abstract mixin class $SingleProductModelCopyWith<$Res> {
  factory $SingleProductModelCopyWith(
          SingleProductModel value, $Res Function(SingleProductModel) _then) =
      _$SingleProductModelCopyWithImpl;
  @useResult
  $Res call(
      {SingleRatingModel ratings,
      String title,
      String description,
      int price,
      int discount,
      List<String> images,
      int stock,
      @JsonKey(name: 'units_sold') int unitsSold,
      @JsonKey(name: 'is_featured') bool isFeatured,
      SingleCategoryModel category,
      String slug,
      @JsonKey(name: 'index0Image') String index0Image,
      String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
  $SingleRatingModelCopyWith<$Res> get ratings;
  $SingleCategoryModelCopyWith<$Res> get category;
}
class _$SingleProductModelCopyWithImpl<$Res>
    implements $SingleProductModelCopyWith<$Res> {
  _$SingleProductModelCopyWithImpl(this._self, this._then);
  final SingleProductModel _self;
  final $Res Function(SingleProductModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ratings = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? discount = null,
    Object? images = null,
    Object? stock = null,
    Object? unitsSold = null,
    Object? isFeatured = null,
    Object? category = null,
    Object? slug = null,
    Object? index0Image = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      ratings: null == ratings
          ? _self.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as SingleRatingModel,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      unitsSold: null == unitsSold
          ? _self.unitsSold
          : unitsSold // ignore: cast_nullable_to_non_nullable
              as int,
      isFeatured: null == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SingleCategoryModel,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      index0Image: null == index0Image
          ? _self.index0Image
          : index0Image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $SingleRatingModelCopyWith<$Res> get ratings {
    return $SingleRatingModelCopyWith<$Res>(_self.ratings, (value) {
      return _then(_self.copyWith(ratings: value));
    });
  }
  @override
  @pragma('vm:prefer-inline')
  $SingleCategoryModelCopyWith<$Res> get category {
    return $SingleCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}
extension SingleProductModelPatterns on SingleProductModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SingleProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleProductModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SingleProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleProductModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SingleProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleProductModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            SingleRatingModel ratings,
            String title,
            String description,
            int price,
            int discount,
            List<String> images,
            int stock,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'is_featured') bool isFeatured,
            SingleCategoryModel category,
            String slug,
            @JsonKey(name: 'index0Image') String index0Image,
            String id,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleProductModel() when $default != null:
        return $default(
            _that.ratings,
            _that.title,
            _that.description,
            _that.price,
            _that.discount,
            _that.images,
            _that.stock,
            _that.unitsSold,
            _that.isFeatured,
            _that.category,
            _that.slug,
            _that.index0Image,
            _that.id,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            SingleRatingModel ratings,
            String title,
            String description,
            int price,
            int discount,
            List<String> images,
            int stock,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'is_featured') bool isFeatured,
            SingleCategoryModel category,
            String slug,
            @JsonKey(name: 'index0Image') String index0Image,
            String id,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleProductModel():
        return $default(
            _that.ratings,
            _that.title,
            _that.description,
            _that.price,
            _that.discount,
            _that.images,
            _that.stock,
            _that.unitsSold,
            _that.isFeatured,
            _that.category,
            _that.slug,
            _that.index0Image,
            _that.id,
            _that.createdAt,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            SingleRatingModel ratings,
            String title,
            String description,
            int price,
            int discount,
            List<String> images,
            int stock,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'is_featured') bool isFeatured,
            SingleCategoryModel category,
            String slug,
            @JsonKey(name: 'index0Image') String index0Image,
            String id,
            @JsonKey(name: 'created_at') String createdAt,
            @JsonKey(name: 'updated_at') String updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleProductModel() when $default != null:
        return $default(
            _that.ratings,
            _that.title,
            _that.description,
            _that.price,
            _that.discount,
            _that.images,
            _that.stock,
            _that.unitsSold,
            _that.isFeatured,
            _that.category,
            _that.slug,
            _that.index0Image,
            _that.id,
            _that.createdAt,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _SingleProductModel implements SingleProductModel {
  const _SingleProductModel(
      {required this.ratings,
      required this.title,
      required this.description,
      required this.price,
      required this.discount,
      required final List<String> images,
      required this.stock,
      @JsonKey(name: 'units_sold') required this.unitsSold,
      @JsonKey(name: 'is_featured') required this.isFeatured,
      required this.category,
      required this.slug,
      @JsonKey(name: 'index0Image') required this.index0Image,
      required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt})
      : _images = images;
  factory _SingleProductModel.fromJson(Map<String, dynamic> json) =>
      _$SingleProductModelFromJson(json);
  @override
  final SingleRatingModel ratings;
  @override
  final String title;
  @override
  final String description;
  @override
  final int price;
  @override
  final int discount;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    return EqualUnmodifiableListView(_images);
  }
  @override
  final int stock;
  @override
  @JsonKey(name: 'units_sold')
  final int unitsSold;
  @override
  @JsonKey(name: 'is_featured')
  final bool isFeatured;
  @override
  final SingleCategoryModel category;
  @override
  final String slug;
  @override
  @JsonKey(name: 'index0Image')
  final String index0Image;
  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SingleProductModelCopyWith<_SingleProductModel> get copyWith =>
      __$SingleProductModelCopyWithImpl<_SingleProductModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$SingleProductModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SingleProductModel &&
            (identical(other.ratings, ratings) || other.ratings == ratings) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.unitsSold, unitsSold) ||
                other.unitsSold == unitsSold) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.index0Image, index0Image) ||
                other.index0Image == index0Image) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      ratings,
      title,
      description,
      price,
      discount,
      const DeepCollectionEquality().hash(_images),
      stock,
      unitsSold,
      isFeatured,
      category,
      slug,
      index0Image,
      id,
      createdAt,
      updatedAt);
  @override
  String toString() {
    return 'SingleProductModel(ratings: $ratings, title: $title, description: $description, price: $price, discount: $discount, images: $images, stock: $stock, unitsSold: $unitsSold, isFeatured: $isFeatured, category: $category, slug: $slug, index0Image: $index0Image, id: $id, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
abstract mixin class _$SingleProductModelCopyWith<$Res>
    implements $SingleProductModelCopyWith<$Res> {
  factory _$SingleProductModelCopyWith(
          _SingleProductModel value, $Res Function(_SingleProductModel) _then) =
      __$SingleProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {SingleRatingModel ratings,
      String title,
      String description,
      int price,
      int discount,
      List<String> images,
      int stock,
      @JsonKey(name: 'units_sold') int unitsSold,
      @JsonKey(name: 'is_featured') bool isFeatured,
      SingleCategoryModel category,
      String slug,
      @JsonKey(name: 'index0Image') String index0Image,
      String id,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
  @override
  $SingleRatingModelCopyWith<$Res> get ratings;
  @override
  $SingleCategoryModelCopyWith<$Res> get category;
}
class __$SingleProductModelCopyWithImpl<$Res>
    implements _$SingleProductModelCopyWith<$Res> {
  __$SingleProductModelCopyWithImpl(this._self, this._then);
  final _SingleProductModel _self;
  final $Res Function(_SingleProductModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ratings = null,
    Object? title = null,
    Object? description = null,
    Object? price = null,
    Object? discount = null,
    Object? images = null,
    Object? stock = null,
    Object? unitsSold = null,
    Object? isFeatured = null,
    Object? category = null,
    Object? slug = null,
    Object? index0Image = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_SingleProductModel(
      ratings: null == ratings
          ? _self.ratings
          : ratings // ignore: cast_nullable_to_non_nullable
              as SingleRatingModel,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discount: null == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      stock: null == stock
          ? _self.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      unitsSold: null == unitsSold
          ? _self.unitsSold
          : unitsSold // ignore: cast_nullable_to_non_nullable
              as int,
      isFeatured: null == isFeatured
          ? _self.isFeatured
          : isFeatured // ignore: cast_nullable_to_non_nullable
              as bool,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as SingleCategoryModel,
      slug: null == slug
          ? _self.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      index0Image: null == index0Image
          ? _self.index0Image
          : index0Image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $SingleRatingModelCopyWith<$Res> get ratings {
    return $SingleRatingModelCopyWith<$Res>(_self.ratings, (value) {
      return _then(_self.copyWith(ratings: value));
    });
  }
  @override
  @pragma('vm:prefer-inline')
  $SingleCategoryModelCopyWith<$Res> get category {
    return $SingleCategoryModelCopyWith<$Res>(_self.category, (value) {
      return _then(_self.copyWith(category: value));
    });
  }
}
mixin _$SingleCategoryModel {
  String get id;
  String get title;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SingleCategoryModelCopyWith<SingleCategoryModel> get copyWith =>
      _$SingleCategoryModelCopyWithImpl<SingleCategoryModel>(
          this as SingleCategoryModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SingleCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);
  @override
  String toString() {
    return 'SingleCategoryModel(id: $id, title: $title)';
  }
}
abstract mixin class $SingleCategoryModelCopyWith<$Res> {
  factory $SingleCategoryModelCopyWith(
          SingleCategoryModel value, $Res Function(SingleCategoryModel) _then) =
      _$SingleCategoryModelCopyWithImpl;
  @useResult
  $Res call({String id, String title});
}
class _$SingleCategoryModelCopyWithImpl<$Res>
    implements $SingleCategoryModelCopyWith<$Res> {
  _$SingleCategoryModelCopyWithImpl(this._self, this._then);
  final SingleCategoryModel _self;
  final $Res Function(SingleCategoryModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension SingleCategoryModelPatterns on SingleCategoryModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SingleCategoryModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleCategoryModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SingleCategoryModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCategoryModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SingleCategoryModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCategoryModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String title)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleCategoryModel() when $default != null:
        return $default(_that.id, _that.title);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String title) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCategoryModel():
        return $default(_that.id, _that.title);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String title)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleCategoryModel() when $default != null:
        return $default(_that.id, _that.title);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _SingleCategoryModel implements SingleCategoryModel {
  const _SingleCategoryModel({required this.id, required this.title});
  factory _SingleCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SingleCategoryModelFromJson(json);
  @override
  final String id;
  @override
  final String title;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SingleCategoryModelCopyWith<_SingleCategoryModel> get copyWith =>
      __$SingleCategoryModelCopyWithImpl<_SingleCategoryModel>(
          this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$SingleCategoryModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SingleCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);
  @override
  String toString() {
    return 'SingleCategoryModel(id: $id, title: $title)';
  }
}
abstract mixin class _$SingleCategoryModelCopyWith<$Res>
    implements $SingleCategoryModelCopyWith<$Res> {
  factory _$SingleCategoryModelCopyWith(_SingleCategoryModel value,
          $Res Function(_SingleCategoryModel) _then) =
      __$SingleCategoryModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String title});
}
class __$SingleCategoryModelCopyWithImpl<$Res>
    implements _$SingleCategoryModelCopyWith<$Res> {
  __$SingleCategoryModelCopyWithImpl(this._self, this._then);
  final _SingleCategoryModel _self;
  final $Res Function(_SingleCategoryModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_SingleCategoryModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
mixin _$SingleRatingModel {
  double get average;
  int get quantity;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SingleRatingModelCopyWith<SingleRatingModel> get copyWith =>
      _$SingleRatingModelCopyWithImpl<SingleRatingModel>(
          this as SingleRatingModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SingleRatingModel &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, average, quantity);
  @override
  String toString() {
    return 'SingleRatingModel(average: $average, quantity: $quantity)';
  }
}
abstract mixin class $SingleRatingModelCopyWith<$Res> {
  factory $SingleRatingModelCopyWith(
          SingleRatingModel value, $Res Function(SingleRatingModel) _then) =
      _$SingleRatingModelCopyWithImpl;
  @useResult
  $Res call({double average, int quantity});
}
class _$SingleRatingModelCopyWithImpl<$Res>
    implements $SingleRatingModelCopyWith<$Res> {
  _$SingleRatingModelCopyWithImpl(this._self, this._then);
  final SingleRatingModel _self;
  final $Res Function(SingleRatingModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? average = null,
    Object? quantity = null,
  }) {
    return _then(_self.copyWith(
      average: null == average
          ? _self.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}
extension SingleRatingModelPatterns on SingleRatingModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SingleRatingModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleRatingModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SingleRatingModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleRatingModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SingleRatingModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleRatingModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double average, int quantity)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SingleRatingModel() when $default != null:
        return $default(_that.average, _that.quantity);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double average, int quantity) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleRatingModel():
        return $default(_that.average, _that.quantity);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double average, int quantity)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SingleRatingModel() when $default != null:
        return $default(_that.average, _that.quantity);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _SingleRatingModel implements SingleRatingModel {
  const _SingleRatingModel({required this.average, required this.quantity});
  factory _SingleRatingModel.fromJson(Map<String, dynamic> json) =>
      _$SingleRatingModelFromJson(json);
  @override
  final double average;
  @override
  final int quantity;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SingleRatingModelCopyWith<_SingleRatingModel> get copyWith =>
      __$SingleRatingModelCopyWithImpl<_SingleRatingModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$SingleRatingModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SingleRatingModel &&
            (identical(other.average, average) || other.average == average) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, average, quantity);
  @override
  String toString() {
    return 'SingleRatingModel(average: $average, quantity: $quantity)';
  }
}
abstract mixin class _$SingleRatingModelCopyWith<$Res>
    implements $SingleRatingModelCopyWith<$Res> {
  factory _$SingleRatingModelCopyWith(
          _SingleRatingModel value, $Res Function(_SingleRatingModel) _then) =
      __$SingleRatingModelCopyWithImpl;
  @override
  @useResult
  $Res call({double average, int quantity});
}
class __$SingleRatingModelCopyWithImpl<$Res>
    implements _$SingleRatingModelCopyWith<$Res> {
  __$SingleRatingModelCopyWithImpl(this._self, this._then);
  final _SingleRatingModel _self;
  final $Res Function(_SingleRatingModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? average = null,
    Object? quantity = null,
  }) {
    return _then(_SingleRatingModel(
      average: null == average
          ? _self.average
          : average // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}
