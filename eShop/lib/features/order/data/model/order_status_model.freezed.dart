part of 'order_status_model.dart';
T _$identity<T>(T value) => value;
mixin _$OrderStatusModel {
  String get itemId;
  ProductModel get product;
  String get status;
  int get statusIndex;
  String get group;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderStatusModelCopyWith<OrderStatusModel> get copyWith =>
      _$OrderStatusModelCopyWithImpl<OrderStatusModel>(
          this as OrderStatusModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderStatusModel &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusIndex, statusIndex) ||
                other.statusIndex == statusIndex) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, itemId, product, status, statusIndex, group, updatedAt);
  @override
  String toString() {
    return 'OrderStatusModel(itemId: $itemId, product: $product, status: $status, statusIndex: $statusIndex, group: $group, updatedAt: $updatedAt)';
  }
}
abstract mixin class $OrderStatusModelCopyWith<$Res> {
  factory $OrderStatusModelCopyWith(
          OrderStatusModel value, $Res Function(OrderStatusModel) _then) =
      _$OrderStatusModelCopyWithImpl;
  @useResult
  $Res call(
      {String itemId,
      ProductModel product,
      String status,
      int statusIndex,
      String group,
      @JsonKey(name: "updated_at") DateTime updatedAt});
  $ProductModelCopyWith<$Res> get product;
}
class _$OrderStatusModelCopyWithImpl<$Res>
    implements $OrderStatusModelCopyWith<$Res> {
  _$OrderStatusModelCopyWithImpl(this._self, this._then);
  final OrderStatusModel _self;
  final $Res Function(OrderStatusModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? product = null,
    Object? status = null,
    Object? statusIndex = null,
    Object? group = null,
    Object? updatedAt = null,
  }) {
    return _then(_self.copyWith(
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusIndex: null == statusIndex
          ? _self.statusIndex
          : statusIndex // ignore: cast_nullable_to_non_nullable
              as int,
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}
extension OrderStatusModelPatterns on OrderStatusModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderStatusModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderStatusModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderStatusModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderStatusModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String itemId,
            ProductModel product,
            String status,
            int statusIndex,
            String group,
            @JsonKey(name: "updated_at") DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderStatusModel() when $default != null:
        return $default(_that.itemId, _that.product, _that.status,
            _that.statusIndex, _that.group, _that.updatedAt);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String itemId,
            ProductModel product,
            String status,
            int statusIndex,
            String group,
            @JsonKey(name: "updated_at") DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusModel():
        return $default(_that.itemId, _that.product, _that.status,
            _that.statusIndex, _that.group, _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String itemId,
            ProductModel product,
            String status,
            int statusIndex,
            String group,
            @JsonKey(name: "updated_at") DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusModel() when $default != null:
        return $default(_that.itemId, _that.product, _that.status,
            _that.statusIndex, _that.group, _that.updatedAt);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _OrderStatusModel implements OrderStatusModel {
  const _OrderStatusModel(
      {required this.itemId,
      required this.product,
      required this.status,
      required this.statusIndex,
      required this.group,
      @JsonKey(name: "updated_at") required this.updatedAt});
  factory _OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusModelFromJson(json);
  @override
  final String itemId;
  @override
  final ProductModel product;
  @override
  final String status;
  @override
  final int statusIndex;
  @override
  final String group;
  @override
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderStatusModelCopyWith<_OrderStatusModel> get copyWith =>
      __$OrderStatusModelCopyWithImpl<_OrderStatusModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$OrderStatusModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderStatusModel &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusIndex, statusIndex) ||
                other.statusIndex == statusIndex) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, itemId, product, status, statusIndex, group, updatedAt);
  @override
  String toString() {
    return 'OrderStatusModel(itemId: $itemId, product: $product, status: $status, statusIndex: $statusIndex, group: $group, updatedAt: $updatedAt)';
  }
}
abstract mixin class _$OrderStatusModelCopyWith<$Res>
    implements $OrderStatusModelCopyWith<$Res> {
  factory _$OrderStatusModelCopyWith(
          _OrderStatusModel value, $Res Function(_OrderStatusModel) _then) =
      __$OrderStatusModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String itemId,
      ProductModel product,
      String status,
      int statusIndex,
      String group,
      @JsonKey(name: "updated_at") DateTime updatedAt});
  @override
  $ProductModelCopyWith<$Res> get product;
}
class __$OrderStatusModelCopyWithImpl<$Res>
    implements _$OrderStatusModelCopyWith<$Res> {
  __$OrderStatusModelCopyWithImpl(this._self, this._then);
  final _OrderStatusModel _self;
  final $Res Function(_OrderStatusModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? itemId = null,
    Object? product = null,
    Object? status = null,
    Object? statusIndex = null,
    Object? group = null,
    Object? updatedAt = null,
  }) {
    return _then(_OrderStatusModel(
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusIndex: null == statusIndex
          ? _self.statusIndex
          : statusIndex // ignore: cast_nullable_to_non_nullable
              as int,
      group: null == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<$Res> get product {
    return $ProductModelCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}
mixin _$ProductModel {
  String get title;
  int get price;
  int get discountPrice;
  List<String> get images;
  String get id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductModelCopyWith<ProductModel> get copyWith =>
      _$ProductModelCopyWithImpl<ProductModel>(
          this as ProductModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, price, discountPrice,
      const DeepCollectionEquality().hash(images), id);
  @override
  String toString() {
    return 'ProductModel(title: $title, price: $price, discountPrice: $discountPrice, images: $images, id: $id)';
  }
}
abstract mixin class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) _then) =
      _$ProductModelCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int price,
      int discountPrice,
      List<String> images,
      String id});
}
class _$ProductModelCopyWithImpl<$Res> implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);
  final ProductModel _self;
  final $Res Function(ProductModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? images = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _self.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension ProductModelPatterns on ProductModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProductModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProductModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProductModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String title, int price, int discountPrice,
            List<String> images, String id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(_that.title, _that.price, _that.discountPrice,
            _that.images, _that.id);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String title, int price, int discountPrice,
            List<String> images, String id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel():
        return $default(_that.title, _that.price, _that.discountPrice,
            _that.images, _that.id);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String title, int price, int discountPrice,
            List<String> images, String id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductModel() when $default != null:
        return $default(_that.title, _that.price, _that.discountPrice,
            _that.images, _that.id);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _ProductModel implements ProductModel {
  const _ProductModel(
      {required this.title,
      required this.price,
      required this.discountPrice,
      required final List<String> images,
      required this.id})
      : _images = images;
  factory _ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
  @override
  final String title;
  @override
  final int price;
  @override
  final int discountPrice;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    return EqualUnmodifiableListView(_images);
  }
  @override
  final String id;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProductModelCopyWith<_ProductModel> get copyWith =>
      __$ProductModelCopyWithImpl<_ProductModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductModel &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, price, discountPrice,
      const DeepCollectionEquality().hash(_images), id);
  @override
  String toString() {
    return 'ProductModel(title: $title, price: $price, discountPrice: $discountPrice, images: $images, id: $id)';
  }
}
abstract mixin class _$ProductModelCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$ProductModelCopyWith(
          _ProductModel value, $Res Function(_ProductModel) _then) =
      __$ProductModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int price,
      int discountPrice,
      List<String> images,
      String id});
}
class __$ProductModelCopyWithImpl<$Res>
    implements _$ProductModelCopyWith<$Res> {
  __$ProductModelCopyWithImpl(this._self, this._then);
  final _ProductModel _self;
  final $Res Function(_ProductModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? images = null,
    Object? id = null,
  }) {
    return _then(_ProductModel(
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _self.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      images: null == images
          ? _self._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
