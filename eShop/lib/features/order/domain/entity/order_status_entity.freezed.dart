part of 'order_status_entity.dart';
T _$identity<T>(T value) => value;
mixin _$OrderStatusEntity {
  String get itemId;
  ProductEntity get product;
  String get status;
  int get statusIndex;
  String get group;
  @JsonKey(name: "updated_at")
  DateTime get updatedAt;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderStatusEntityCopyWith<OrderStatusEntity> get copyWith =>
      _$OrderStatusEntityCopyWithImpl<OrderStatusEntity>(
          this as OrderStatusEntity, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderStatusEntity &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusIndex, statusIndex) ||
                other.statusIndex == statusIndex) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @override
  int get hashCode => Object.hash(
      runtimeType, itemId, product, status, statusIndex, group, updatedAt);
  @override
  String toString() {
    return 'OrderStatusEntity(itemId: $itemId, product: $product, status: $status, statusIndex: $statusIndex, group: $group, updatedAt: $updatedAt)';
  }
}
abstract mixin class $OrderStatusEntityCopyWith<$Res> {
  factory $OrderStatusEntityCopyWith(
          OrderStatusEntity value, $Res Function(OrderStatusEntity) _then) =
      _$OrderStatusEntityCopyWithImpl;
  @useResult
  $Res call(
      {String itemId,
      ProductEntity product,
      String status,
      int statusIndex,
      String group,
      @JsonKey(name: "updated_at") DateTime updatedAt});
  $ProductEntityCopyWith<$Res> get product;
}
class _$OrderStatusEntityCopyWithImpl<$Res>
    implements $OrderStatusEntityCopyWith<$Res> {
  _$OrderStatusEntityCopyWithImpl(this._self, this._then);
  final OrderStatusEntity _self;
  final $Res Function(OrderStatusEntity) _then;
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
              as ProductEntity,
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
  $ProductEntityCopyWith<$Res> get product {
    return $ProductEntityCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}
extension OrderStatusEntityPatterns on OrderStatusEntity {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderStatusEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderStatusEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderStatusEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderStatusEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusEntity() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String itemId,
            ProductEntity product,
            String status,
            int statusIndex,
            String group,
            @JsonKey(name: "updated_at") DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderStatusEntity() when $default != null:
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
            ProductEntity product,
            String status,
            int statusIndex,
            String group,
            @JsonKey(name: "updated_at") DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusEntity():
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
            ProductEntity product,
            String status,
            int statusIndex,
            String group,
            @JsonKey(name: "updated_at") DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderStatusEntity() when $default != null:
        return $default(_that.itemId, _that.product, _that.status,
            _that.statusIndex, _that.group, _that.updatedAt);
      case _:
        return null;
    }
  }
}
class _OrderStatusEntity implements OrderStatusEntity {
  const _OrderStatusEntity(
      {required this.itemId,
      required this.product,
      required this.status,
      required this.statusIndex,
      required this.group,
      @JsonKey(name: "updated_at") required this.updatedAt});
  @override
  final String itemId;
  @override
  final ProductEntity product;
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
  _$OrderStatusEntityCopyWith<_OrderStatusEntity> get copyWith =>
      __$OrderStatusEntityCopyWithImpl<_OrderStatusEntity>(this, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderStatusEntity &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusIndex, statusIndex) ||
                other.statusIndex == statusIndex) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }
  @override
  int get hashCode => Object.hash(
      runtimeType, itemId, product, status, statusIndex, group, updatedAt);
  @override
  String toString() {
    return 'OrderStatusEntity(itemId: $itemId, product: $product, status: $status, statusIndex: $statusIndex, group: $group, updatedAt: $updatedAt)';
  }
}
abstract mixin class _$OrderStatusEntityCopyWith<$Res>
    implements $OrderStatusEntityCopyWith<$Res> {
  factory _$OrderStatusEntityCopyWith(
          _OrderStatusEntity value, $Res Function(_OrderStatusEntity) _then) =
      __$OrderStatusEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String itemId,
      ProductEntity product,
      String status,
      int statusIndex,
      String group,
      @JsonKey(name: "updated_at") DateTime updatedAt});
  @override
  $ProductEntityCopyWith<$Res> get product;
}
class __$OrderStatusEntityCopyWithImpl<$Res>
    implements _$OrderStatusEntityCopyWith<$Res> {
  __$OrderStatusEntityCopyWithImpl(this._self, this._then);
  final _OrderStatusEntity _self;
  final $Res Function(_OrderStatusEntity) _then;
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
    return _then(_OrderStatusEntity(
      itemId: null == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
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
  $ProductEntityCopyWith<$Res> get product {
    return $ProductEntityCopyWith<$Res>(_self.product, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}
mixin _$ProductEntity {
  String get title;
  int get price;
  int get discountPrice;
  List<String> get images;
  String get id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductEntityCopyWith<ProductEntity> get copyWith =>
      _$ProductEntityCopyWithImpl<ProductEntity>(
          this as ProductEntity, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.id, id) || other.id == id));
  }
  @override
  int get hashCode => Object.hash(runtimeType, title, price, discountPrice,
      const DeepCollectionEquality().hash(images), id);
  @override
  String toString() {
    return 'ProductEntity(title: $title, price: $price, discountPrice: $discountPrice, images: $images, id: $id)';
  }
}
abstract mixin class $ProductEntityCopyWith<$Res> {
  factory $ProductEntityCopyWith(
          ProductEntity value, $Res Function(ProductEntity) _then) =
      _$ProductEntityCopyWithImpl;
  @useResult
  $Res call(
      {String title,
      int price,
      int discountPrice,
      List<String> images,
      String id});
}
class _$ProductEntityCopyWithImpl<$Res>
    implements $ProductEntityCopyWith<$Res> {
  _$ProductEntityCopyWithImpl(this._self, this._then);
  final ProductEntity _self;
  final $Res Function(ProductEntity) _then;
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
extension ProductEntityPatterns on ProductEntity {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ProductEntity value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProductEntity() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ProductEntity value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductEntity():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ProductEntity value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProductEntity() when $default != null:
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
      case _ProductEntity() when $default != null:
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
      case _ProductEntity():
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
      case _ProductEntity() when $default != null:
        return $default(_that.title, _that.price, _that.discountPrice,
            _that.images, _that.id);
      case _:
        return null;
    }
  }
}
class _ProductEntity implements ProductEntity {
  const _ProductEntity(
      {required this.title,
      required this.price,
      required this.discountPrice,
      required final List<String> images,
      required this.id})
      : _images = images;
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
  _$ProductEntityCopyWith<_ProductEntity> get copyWith =>
      __$ProductEntityCopyWithImpl<_ProductEntity>(this, _$identity);
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProductEntity &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.id, id) || other.id == id));
  }
  @override
  int get hashCode => Object.hash(runtimeType, title, price, discountPrice,
      const DeepCollectionEquality().hash(_images), id);
  @override
  String toString() {
    return 'ProductEntity(title: $title, price: $price, discountPrice: $discountPrice, images: $images, id: $id)';
  }
}
abstract mixin class _$ProductEntityCopyWith<$Res>
    implements $ProductEntityCopyWith<$Res> {
  factory _$ProductEntityCopyWith(
          _ProductEntity value, $Res Function(_ProductEntity) _then) =
      __$ProductEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String title,
      int price,
      int discountPrice,
      List<String> images,
      String id});
}
class __$ProductEntityCopyWithImpl<$Res>
    implements _$ProductEntityCopyWith<$Res> {
  __$ProductEntityCopyWithImpl(this._self, this._then);
  final _ProductEntity _self;
  final $Res Function(_ProductEntity) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? price = null,
    Object? discountPrice = null,
    Object? images = null,
    Object? id = null,
  }) {
    return _then(_ProductEntity(
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
