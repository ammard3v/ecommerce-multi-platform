part of 'order_model.dart';
T _$identity<T>(T value) => value;
mixin _$OrderModel {
  PaymentResultModel? get paymentResult; // nullable for COD
  UserInfoModel get userInfo;
  List<OrderItemsModel> get orderItems;
  ShippingAddressModel get shippingAddress;
  double get itemsPrice;
  double get shippingPrice;
  double get taxPrice;
  double get totalPrice;
  String get status;
  @JsonKey(name: 'id')
  String get id;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  bool? get hasReviewed;
  bool? get canReview;
  DateTime? get shippedAt;
  DateTime? get deliveredAt;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<OrderModel> get copyWith =>
      _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderModel &&
            (identical(other.paymentResult, paymentResult) ||
                other.paymentResult == paymentResult) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            const DeepCollectionEquality()
                .equals(other.orderItems, orderItems) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.itemsPrice, itemsPrice) ||
                other.itemsPrice == itemsPrice) &&
            (identical(other.shippingPrice, shippingPrice) ||
                other.shippingPrice == shippingPrice) &&
            (identical(other.taxPrice, taxPrice) ||
                other.taxPrice == taxPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.hasReviewed, hasReviewed) ||
                other.hasReviewed == hasReviewed) &&
            (identical(other.canReview, canReview) ||
                other.canReview == canReview) &&
            (identical(other.shippedAt, shippedAt) ||
                other.shippedAt == shippedAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentResult,
      userInfo,
      const DeepCollectionEquality().hash(orderItems),
      shippingAddress,
      itemsPrice,
      shippingPrice,
      taxPrice,
      totalPrice,
      status,
      id,
      createdAt,
      updatedAt,
      hasReviewed,
      canReview,
      shippedAt,
      deliveredAt);
  @override
  String toString() {
    return 'OrderModel(paymentResult: $paymentResult, userInfo: $userInfo, orderItems: $orderItems, shippingAddress: $shippingAddress, itemsPrice: $itemsPrice, shippingPrice: $shippingPrice, taxPrice: $taxPrice, totalPrice: $totalPrice, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, hasReviewed: $hasReviewed, canReview: $canReview, shippedAt: $shippedAt, deliveredAt: $deliveredAt)';
  }
}
abstract mixin class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) _then) =
      _$OrderModelCopyWithImpl;
  @useResult
  $Res call(
      {PaymentResultModel? paymentResult,
      UserInfoModel userInfo,
      List<OrderItemsModel> orderItems,
      ShippingAddressModel shippingAddress,
      double itemsPrice,
      double shippingPrice,
      double taxPrice,
      double totalPrice,
      String status,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      bool? hasReviewed,
      bool? canReview,
      DateTime? shippedAt,
      DateTime? deliveredAt});
  $PaymentResultModelCopyWith<$Res>? get paymentResult;
  $UserInfoModelCopyWith<$Res> get userInfo;
  $ShippingAddressModelCopyWith<$Res> get shippingAddress;
}
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);
  final OrderModel _self;
  final $Res Function(OrderModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentResult = freezed,
    Object? userInfo = null,
    Object? orderItems = null,
    Object? shippingAddress = null,
    Object? itemsPrice = null,
    Object? shippingPrice = null,
    Object? taxPrice = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? hasReviewed = freezed,
    Object? canReview = freezed,
    Object? shippedAt = freezed,
    Object? deliveredAt = freezed,
  }) {
    return _then(_self.copyWith(
      paymentResult: freezed == paymentResult
          ? _self.paymentResult
          : paymentResult // ignore: cast_nullable_to_non_nullable
              as PaymentResultModel?,
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      orderItems: null == orderItems
          ? _self.orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItemsModel>,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as ShippingAddressModel,
      itemsPrice: null == itemsPrice
          ? _self.itemsPrice
          : itemsPrice // ignore: cast_nullable_to_non_nullable
              as double,
      shippingPrice: null == shippingPrice
          ? _self.shippingPrice
          : shippingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      taxPrice: null == taxPrice
          ? _self.taxPrice
          : taxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
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
      hasReviewed: freezed == hasReviewed
          ? _self.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      canReview: freezed == canReview
          ? _self.canReview
          : canReview // ignore: cast_nullable_to_non_nullable
              as bool?,
      shippedAt: freezed == shippedAt
          ? _self.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $PaymentResultModelCopyWith<$Res>? get paymentResult {
    if (_self.paymentResult == null) {
      return null;
    }
    return $PaymentResultModelCopyWith<$Res>(_self.paymentResult!, (value) {
      return _then(_self.copyWith(paymentResult: value));
    });
  }
  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res> get userInfo {
    return $UserInfoModelCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
  @override
  @pragma('vm:prefer-inline')
  $ShippingAddressModelCopyWith<$Res> get shippingAddress {
    return $ShippingAddressModelCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }
}
extension OrderModelPatterns on OrderModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            PaymentResultModel? paymentResult,
            UserInfoModel userInfo,
            List<OrderItemsModel> orderItems,
            ShippingAddressModel shippingAddress,
            double itemsPrice,
            double shippingPrice,
            double taxPrice,
            double totalPrice,
            String status,
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            bool? hasReviewed,
            bool? canReview,
            DateTime? shippedAt,
            DateTime? deliveredAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(
            _that.paymentResult,
            _that.userInfo,
            _that.orderItems,
            _that.shippingAddress,
            _that.itemsPrice,
            _that.shippingPrice,
            _that.taxPrice,
            _that.totalPrice,
            _that.status,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.hasReviewed,
            _that.canReview,
            _that.shippedAt,
            _that.deliveredAt);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            PaymentResultModel? paymentResult,
            UserInfoModel userInfo,
            List<OrderItemsModel> orderItems,
            ShippingAddressModel shippingAddress,
            double itemsPrice,
            double shippingPrice,
            double taxPrice,
            double totalPrice,
            String status,
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            bool? hasReviewed,
            bool? canReview,
            DateTime? shippedAt,
            DateTime? deliveredAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel():
        return $default(
            _that.paymentResult,
            _that.userInfo,
            _that.orderItems,
            _that.shippingAddress,
            _that.itemsPrice,
            _that.shippingPrice,
            _that.taxPrice,
            _that.totalPrice,
            _that.status,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.hasReviewed,
            _that.canReview,
            _that.shippedAt,
            _that.deliveredAt);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            PaymentResultModel? paymentResult,
            UserInfoModel userInfo,
            List<OrderItemsModel> orderItems,
            ShippingAddressModel shippingAddress,
            double itemsPrice,
            double shippingPrice,
            double taxPrice,
            double totalPrice,
            String status,
            @JsonKey(name: 'id') String id,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            bool? hasReviewed,
            bool? canReview,
            DateTime? shippedAt,
            DateTime? deliveredAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderModel() when $default != null:
        return $default(
            _that.paymentResult,
            _that.userInfo,
            _that.orderItems,
            _that.shippingAddress,
            _that.itemsPrice,
            _that.shippingPrice,
            _that.taxPrice,
            _that.totalPrice,
            _that.status,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.hasReviewed,
            _that.canReview,
            _that.shippedAt,
            _that.deliveredAt);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _OrderModel implements OrderModel {
  const _OrderModel(
      {this.paymentResult,
      required this.userInfo,
      required final List<OrderItemsModel> orderItems,
      required this.shippingAddress,
      required this.itemsPrice,
      required this.shippingPrice,
      required this.taxPrice,
      required this.totalPrice,
      required this.status,
      @JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.hasReviewed,
      this.canReview,
      this.shippedAt,
      this.deliveredAt})
      : _orderItems = orderItems;
  factory _OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  @override
  final PaymentResultModel? paymentResult;
  @override
  final UserInfoModel userInfo;
  final List<OrderItemsModel> _orderItems;
  @override
  List<OrderItemsModel> get orderItems {
    if (_orderItems is EqualUnmodifiableListView) return _orderItems;
    return EqualUnmodifiableListView(_orderItems);
  }
  @override
  final ShippingAddressModel shippingAddress;
  @override
  final double itemsPrice;
  @override
  final double shippingPrice;
  @override
  final double taxPrice;
  @override
  final double totalPrice;
  @override
  final String status;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final bool? hasReviewed;
  @override
  final bool? canReview;
  @override
  final DateTime? shippedAt;
  @override
  final DateTime? deliveredAt;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
            (identical(other.paymentResult, paymentResult) ||
                other.paymentResult == paymentResult) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            const DeepCollectionEquality()
                .equals(other._orderItems, _orderItems) &&
            (identical(other.shippingAddress, shippingAddress) ||
                other.shippingAddress == shippingAddress) &&
            (identical(other.itemsPrice, itemsPrice) ||
                other.itemsPrice == itemsPrice) &&
            (identical(other.shippingPrice, shippingPrice) ||
                other.shippingPrice == shippingPrice) &&
            (identical(other.taxPrice, taxPrice) ||
                other.taxPrice == taxPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.hasReviewed, hasReviewed) ||
                other.hasReviewed == hasReviewed) &&
            (identical(other.canReview, canReview) ||
                other.canReview == canReview) &&
            (identical(other.shippedAt, shippedAt) ||
                other.shippedAt == shippedAt) &&
            (identical(other.deliveredAt, deliveredAt) ||
                other.deliveredAt == deliveredAt));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      paymentResult,
      userInfo,
      const DeepCollectionEquality().hash(_orderItems),
      shippingAddress,
      itemsPrice,
      shippingPrice,
      taxPrice,
      totalPrice,
      status,
      id,
      createdAt,
      updatedAt,
      hasReviewed,
      canReview,
      shippedAt,
      deliveredAt);
  @override
  String toString() {
    return 'OrderModel(paymentResult: $paymentResult, userInfo: $userInfo, orderItems: $orderItems, shippingAddress: $shippingAddress, itemsPrice: $itemsPrice, shippingPrice: $shippingPrice, taxPrice: $taxPrice, totalPrice: $totalPrice, status: $status, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, hasReviewed: $hasReviewed, canReview: $canReview, shippedAt: $shippedAt, deliveredAt: $deliveredAt)';
  }
}
abstract mixin class _$OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) _then) =
      __$OrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PaymentResultModel? paymentResult,
      UserInfoModel userInfo,
      List<OrderItemsModel> orderItems,
      ShippingAddressModel shippingAddress,
      double itemsPrice,
      double shippingPrice,
      double taxPrice,
      double totalPrice,
      String status,
      @JsonKey(name: 'id') String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      bool? hasReviewed,
      bool? canReview,
      DateTime? shippedAt,
      DateTime? deliveredAt});
  @override
  $PaymentResultModelCopyWith<$Res>? get paymentResult;
  @override
  $UserInfoModelCopyWith<$Res> get userInfo;
  @override
  $ShippingAddressModelCopyWith<$Res> get shippingAddress;
}
class __$OrderModelCopyWithImpl<$Res> implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);
  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentResult = freezed,
    Object? userInfo = null,
    Object? orderItems = null,
    Object? shippingAddress = null,
    Object? itemsPrice = null,
    Object? shippingPrice = null,
    Object? taxPrice = null,
    Object? totalPrice = null,
    Object? status = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? hasReviewed = freezed,
    Object? canReview = freezed,
    Object? shippedAt = freezed,
    Object? deliveredAt = freezed,
  }) {
    return _then(_OrderModel(
      paymentResult: freezed == paymentResult
          ? _self.paymentResult
          : paymentResult // ignore: cast_nullable_to_non_nullable
              as PaymentResultModel?,
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      orderItems: null == orderItems
          ? _self._orderItems
          : orderItems // ignore: cast_nullable_to_non_nullable
              as List<OrderItemsModel>,
      shippingAddress: null == shippingAddress
          ? _self.shippingAddress
          : shippingAddress // ignore: cast_nullable_to_non_nullable
              as ShippingAddressModel,
      itemsPrice: null == itemsPrice
          ? _self.itemsPrice
          : itemsPrice // ignore: cast_nullable_to_non_nullable
              as double,
      shippingPrice: null == shippingPrice
          ? _self.shippingPrice
          : shippingPrice // ignore: cast_nullable_to_non_nullable
              as double,
      taxPrice: null == taxPrice
          ? _self.taxPrice
          : taxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalPrice: null == totalPrice
          ? _self.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
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
      hasReviewed: freezed == hasReviewed
          ? _self.hasReviewed
          : hasReviewed // ignore: cast_nullable_to_non_nullable
              as bool?,
      canReview: freezed == canReview
          ? _self.canReview
          : canReview // ignore: cast_nullable_to_non_nullable
              as bool?,
      shippedAt: freezed == shippedAt
          ? _self.shippedAt
          : shippedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveredAt: freezed == deliveredAt
          ? _self.deliveredAt
          : deliveredAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
  @override
  @pragma('vm:prefer-inline')
  $PaymentResultModelCopyWith<$Res>? get paymentResult {
    if (_self.paymentResult == null) {
      return null;
    }
    return $PaymentResultModelCopyWith<$Res>(_self.paymentResult!, (value) {
      return _then(_self.copyWith(paymentResult: value));
    });
  }
  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res> get userInfo {
    return $UserInfoModelCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
  @override
  @pragma('vm:prefer-inline')
  $ShippingAddressModelCopyWith<$Res> get shippingAddress {
    return $ShippingAddressModelCopyWith<$Res>(_self.shippingAddress, (value) {
      return _then(_self.copyWith(shippingAddress: value));
    });
  }
}
mixin _$UserInfoModel {
  String get userId;
  String get name;
  String get email;
  String get phone;
  @JsonKey(name: '_id')
  String get id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<UserInfoModel> get copyWith =>
      _$UserInfoModelCopyWithImpl<UserInfoModel>(
          this as UserInfoModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserInfoModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, email, phone, id);
  @override
  String toString() {
    return 'UserInfoModel(userId: $userId, name: $name, email: $email, phone: $phone, id: $id)';
  }
}
abstract mixin class $UserInfoModelCopyWith<$Res> {
  factory $UserInfoModelCopyWith(
          UserInfoModel value, $Res Function(UserInfoModel) _then) =
      _$UserInfoModelCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String name,
      String email,
      String phone,
      @JsonKey(name: '_id') String id});
}
class _$UserInfoModelCopyWithImpl<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  _$UserInfoModelCopyWithImpl(this._self, this._then);
  final UserInfoModel _self;
  final $Res Function(UserInfoModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension UserInfoModelPatterns on UserInfoModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_UserInfoModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_UserInfoModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_UserInfoModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String userId, String name, String email, String phone,
            @JsonKey(name: '_id') String id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
        return $default(
            _that.userId, _that.name, _that.email, _that.phone, _that.id);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String userId, String name, String email, String phone,
            @JsonKey(name: '_id') String id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel():
        return $default(
            _that.userId, _that.name, _that.email, _that.phone, _that.id);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String userId, String name, String email, String phone,
            @JsonKey(name: '_id') String id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _UserInfoModel() when $default != null:
        return $default(
            _that.userId, _that.name, _that.email, _that.phone, _that.id);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _UserInfoModel implements UserInfoModel {
  const _UserInfoModel(
      {required this.userId,
      required this.name,
      required this.email,
      required this.phone,
      @JsonKey(name: '_id') required this.id});
  factory _UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
  @override
  final String userId;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserInfoModelCopyWith<_UserInfoModel> get copyWith =>
      __$UserInfoModelCopyWithImpl<_UserInfoModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$UserInfoModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserInfoModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, name, email, phone, id);
  @override
  String toString() {
    return 'UserInfoModel(userId: $userId, name: $name, email: $email, phone: $phone, id: $id)';
  }
}
abstract mixin class _$UserInfoModelCopyWith<$Res>
    implements $UserInfoModelCopyWith<$Res> {
  factory _$UserInfoModelCopyWith(
          _UserInfoModel value, $Res Function(_UserInfoModel) _then) =
      __$UserInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String name,
      String email,
      String phone,
      @JsonKey(name: '_id') String id});
}
class __$UserInfoModelCopyWithImpl<$Res>
    implements _$UserInfoModelCopyWith<$Res> {
  __$UserInfoModelCopyWithImpl(this._self, this._then);
  final _UserInfoModel _self;
  final $Res Function(_UserInfoModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
    Object? id = null,
  }) {
    return _then(_UserInfoModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
mixin _$PaymentResultModel {
  String get id;
  String get status;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentResultModelCopyWith<PaymentResultModel> get copyWith =>
      _$PaymentResultModelCopyWithImpl<PaymentResultModel>(
          this as PaymentResultModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentResultModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status);
  @override
  String toString() {
    return 'PaymentResultModel(id: $id, status: $status)';
  }
}
abstract mixin class $PaymentResultModelCopyWith<$Res> {
  factory $PaymentResultModelCopyWith(
          PaymentResultModel value, $Res Function(PaymentResultModel) _then) =
      _$PaymentResultModelCopyWithImpl;
  @useResult
  $Res call({String id, String status});
}
class _$PaymentResultModelCopyWithImpl<$Res>
    implements $PaymentResultModelCopyWith<$Res> {
  _$PaymentResultModelCopyWithImpl(this._self, this._then);
  final PaymentResultModel _self;
  final $Res Function(PaymentResultModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension PaymentResultModelPatterns on PaymentResultModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PaymentResultModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentResultModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PaymentResultModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResultModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PaymentResultModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResultModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String status)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PaymentResultModel() when $default != null:
        return $default(_that.id, _that.status);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String status) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResultModel():
        return $default(_that.id, _that.status);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String status)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PaymentResultModel() when $default != null:
        return $default(_that.id, _that.status);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _PaymentResultModel implements PaymentResultModel {
  const _PaymentResultModel({required this.id, required this.status});
  factory _PaymentResultModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResultModelFromJson(json);
  @override
  final String id;
  @override
  final String status;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentResultModelCopyWith<_PaymentResultModel> get copyWith =>
      __$PaymentResultModelCopyWithImpl<_PaymentResultModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$PaymentResultModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentResultModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, status);
  @override
  String toString() {
    return 'PaymentResultModel(id: $id, status: $status)';
  }
}
abstract mixin class _$PaymentResultModelCopyWith<$Res>
    implements $PaymentResultModelCopyWith<$Res> {
  factory _$PaymentResultModelCopyWith(
          _PaymentResultModel value, $Res Function(_PaymentResultModel) _then) =
      __$PaymentResultModelCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String status});
}
class __$PaymentResultModelCopyWithImpl<$Res>
    implements _$PaymentResultModelCopyWith<$Res> {
  __$PaymentResultModelCopyWithImpl(this._self, this._then);
  final _PaymentResultModel _self;
  final $Res Function(_PaymentResultModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? status = null,
  }) {
    return _then(_PaymentResultModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
mixin _$OrderItemsModel {
  String get product;
  String get title;
  double get price;
  int get quantity;
  String get image;
  @JsonKey(name: '_id')
  String get id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderItemsModelCopyWith<OrderItemsModel> get copyWith =>
      _$OrderItemsModelCopyWithImpl<OrderItemsModel>(
          this as OrderItemsModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderItemsModel &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, product, title, price, quantity, image, id);
  @override
  String toString() {
    return 'OrderItemsModel(product: $product, title: $title, price: $price, quantity: $quantity, image: $image, id: $id)';
  }
}
abstract mixin class $OrderItemsModelCopyWith<$Res> {
  factory $OrderItemsModelCopyWith(
          OrderItemsModel value, $Res Function(OrderItemsModel) _then) =
      _$OrderItemsModelCopyWithImpl;
  @useResult
  $Res call(
      {String product,
      String title,
      double price,
      int quantity,
      String image,
      @JsonKey(name: '_id') String id});
}
class _$OrderItemsModelCopyWithImpl<$Res>
    implements $OrderItemsModelCopyWith<$Res> {
  _$OrderItemsModelCopyWithImpl(this._self, this._then);
  final OrderItemsModel _self;
  final $Res Function(OrderItemsModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? title = null,
    Object? price = null,
    Object? quantity = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension OrderItemsModelPatterns on OrderItemsModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_OrderItemsModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemsModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_OrderItemsModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemsModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_OrderItemsModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemsModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String product, String title, double price, int quantity,
            String image, @JsonKey(name: '_id') String id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _OrderItemsModel() when $default != null:
        return $default(_that.product, _that.title, _that.price, _that.quantity,
            _that.image, _that.id);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String product, String title, double price, int quantity,
            String image, @JsonKey(name: '_id') String id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemsModel():
        return $default(_that.product, _that.title, _that.price, _that.quantity,
            _that.image, _that.id);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String product, String title, double price, int quantity,
            String image, @JsonKey(name: '_id') String id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _OrderItemsModel() when $default != null:
        return $default(_that.product, _that.title, _that.price, _that.quantity,
            _that.image, _that.id);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _OrderItemsModel implements OrderItemsModel {
  const _OrderItemsModel(
      {required this.product,
      required this.title,
      required this.price,
      required this.quantity,
      required this.image,
      @JsonKey(name: '_id') required this.id});
  factory _OrderItemsModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemsModelFromJson(json);
  @override
  final String product;
  @override
  final String title;
  @override
  final double price;
  @override
  final int quantity;
  @override
  final String image;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderItemsModelCopyWith<_OrderItemsModel> get copyWith =>
      __$OrderItemsModelCopyWithImpl<_OrderItemsModel>(this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$OrderItemsModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderItemsModel &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, product, title, price, quantity, image, id);
  @override
  String toString() {
    return 'OrderItemsModel(product: $product, title: $title, price: $price, quantity: $quantity, image: $image, id: $id)';
  }
}
abstract mixin class _$OrderItemsModelCopyWith<$Res>
    implements $OrderItemsModelCopyWith<$Res> {
  factory _$OrderItemsModelCopyWith(
          _OrderItemsModel value, $Res Function(_OrderItemsModel) _then) =
      __$OrderItemsModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String product,
      String title,
      double price,
      int quantity,
      String image,
      @JsonKey(name: '_id') String id});
}
class __$OrderItemsModelCopyWithImpl<$Res>
    implements _$OrderItemsModelCopyWith<$Res> {
  __$OrderItemsModelCopyWithImpl(this._self, this._then);
  final _OrderItemsModel _self;
  final $Res Function(_OrderItemsModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? title = null,
    Object? price = null,
    Object? quantity = null,
    Object? image = null,
    Object? id = null,
  }) {
    return _then(_OrderItemsModel(
      product: null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
mixin _$ShippingAddressModel {
  @JsonKey(name: 'address_line1')
  String get addressLine1;
  @JsonKey(name: 'address_line2')
  String? get addressLine2;
  String get city;
  String get state;
  @JsonKey(name: 'postal_code')
  String get postalCode;
  String? get country;
  @JsonKey(name: 'optional_remarks')
  String? get optionalRemarks;
  @JsonKey(name: 'is_default')
  bool? get isDefault;
  @JsonKey(name: '_id')
  String get id;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShippingAddressModelCopyWith<ShippingAddressModel> get copyWith =>
      _$ShippingAddressModelCopyWithImpl<ShippingAddressModel>(
          this as ShippingAddressModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShippingAddressModel &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.optionalRemarks, optionalRemarks) ||
                other.optionalRemarks == optionalRemarks) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addressLine1, addressLine2, city,
      state, postalCode, country, optionalRemarks, isDefault, id);
  @override
  String toString() {
    return 'ShippingAddressModel(addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, optionalRemarks: $optionalRemarks, isDefault: $isDefault, id: $id)';
  }
}
abstract mixin class $ShippingAddressModelCopyWith<$Res> {
  factory $ShippingAddressModelCopyWith(ShippingAddressModel value,
          $Res Function(ShippingAddressModel) _then) =
      _$ShippingAddressModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'address_line1') String addressLine1,
      @JsonKey(name: 'address_line2') String? addressLine2,
      String city,
      String state,
      @JsonKey(name: 'postal_code') String postalCode,
      String? country,
      @JsonKey(name: 'optional_remarks') String? optionalRemarks,
      @JsonKey(name: 'is_default') bool? isDefault,
      @JsonKey(name: '_id') String id});
}
class _$ShippingAddressModelCopyWithImpl<$Res>
    implements $ShippingAddressModelCopyWith<$Res> {
  _$ShippingAddressModelCopyWithImpl(this._self, this._then);
  final ShippingAddressModel _self;
  final $Res Function(ShippingAddressModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressLine1 = null,
    Object? addressLine2 = freezed,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = freezed,
    Object? optionalRemarks = freezed,
    Object? isDefault = freezed,
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      addressLine1: null == addressLine1
          ? _self.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine2: freezed == addressLine2
          ? _self.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      optionalRemarks: freezed == optionalRemarks
          ? _self.optionalRemarks
          : optionalRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
extension ShippingAddressModelPatterns on ShippingAddressModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ShippingAddressModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingAddressModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ShippingAddressModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddressModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ShippingAddressModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddressModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'address_line1') String addressLine1,
            @JsonKey(name: 'address_line2') String? addressLine2,
            String city,
            String state,
            @JsonKey(name: 'postal_code') String postalCode,
            String? country,
            @JsonKey(name: 'optional_remarks') String? optionalRemarks,
            @JsonKey(name: 'is_default') bool? isDefault,
            @JsonKey(name: '_id') String id)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShippingAddressModel() when $default != null:
        return $default(
            _that.addressLine1,
            _that.addressLine2,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.optionalRemarks,
            _that.isDefault,
            _that.id);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'address_line1') String addressLine1,
            @JsonKey(name: 'address_line2') String? addressLine2,
            String city,
            String state,
            @JsonKey(name: 'postal_code') String postalCode,
            String? country,
            @JsonKey(name: 'optional_remarks') String? optionalRemarks,
            @JsonKey(name: 'is_default') bool? isDefault,
            @JsonKey(name: '_id') String id)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddressModel():
        return $default(
            _that.addressLine1,
            _that.addressLine2,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.optionalRemarks,
            _that.isDefault,
            _that.id);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'address_line1') String addressLine1,
            @JsonKey(name: 'address_line2') String? addressLine2,
            String city,
            String state,
            @JsonKey(name: 'postal_code') String postalCode,
            String? country,
            @JsonKey(name: 'optional_remarks') String? optionalRemarks,
            @JsonKey(name: 'is_default') bool? isDefault,
            @JsonKey(name: '_id') String id)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShippingAddressModel() when $default != null:
        return $default(
            _that.addressLine1,
            _that.addressLine2,
            _that.city,
            _that.state,
            _that.postalCode,
            _that.country,
            _that.optionalRemarks,
            _that.isDefault,
            _that.id);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _ShippingAddressModel implements ShippingAddressModel {
  const _ShippingAddressModel(
      {@JsonKey(name: 'address_line1') required this.addressLine1,
      @JsonKey(name: 'address_line2') this.addressLine2,
      required this.city,
      required this.state,
      @JsonKey(name: 'postal_code') required this.postalCode,
      this.country,
      @JsonKey(name: 'optional_remarks') this.optionalRemarks,
      @JsonKey(name: 'is_default') this.isDefault,
      @JsonKey(name: '_id') required this.id});
  factory _ShippingAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ShippingAddressModelFromJson(json);
  @override
  @JsonKey(name: 'address_line1')
  final String addressLine1;
  @override
  @JsonKey(name: 'address_line2')
  final String? addressLine2;
  @override
  final String city;
  @override
  final String state;
  @override
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @override
  final String? country;
  @override
  @JsonKey(name: 'optional_remarks')
  final String? optionalRemarks;
  @override
  @JsonKey(name: 'is_default')
  final bool? isDefault;
  @override
  @JsonKey(name: '_id')
  final String id;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShippingAddressModelCopyWith<_ShippingAddressModel> get copyWith =>
      __$ShippingAddressModelCopyWithImpl<_ShippingAddressModel>(
          this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$ShippingAddressModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShippingAddressModel &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.optionalRemarks, optionalRemarks) ||
                other.optionalRemarks == optionalRemarks) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.id, id) || other.id == id));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, addressLine1, addressLine2, city,
      state, postalCode, country, optionalRemarks, isDefault, id);
  @override
  String toString() {
    return 'ShippingAddressModel(addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, postalCode: $postalCode, country: $country, optionalRemarks: $optionalRemarks, isDefault: $isDefault, id: $id)';
  }
}
abstract mixin class _$ShippingAddressModelCopyWith<$Res>
    implements $ShippingAddressModelCopyWith<$Res> {
  factory _$ShippingAddressModelCopyWith(_ShippingAddressModel value,
          $Res Function(_ShippingAddressModel) _then) =
      __$ShippingAddressModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'address_line1') String addressLine1,
      @JsonKey(name: 'address_line2') String? addressLine2,
      String city,
      String state,
      @JsonKey(name: 'postal_code') String postalCode,
      String? country,
      @JsonKey(name: 'optional_remarks') String? optionalRemarks,
      @JsonKey(name: 'is_default') bool? isDefault,
      @JsonKey(name: '_id') String id});
}
class __$ShippingAddressModelCopyWithImpl<$Res>
    implements _$ShippingAddressModelCopyWith<$Res> {
  __$ShippingAddressModelCopyWithImpl(this._self, this._then);
  final _ShippingAddressModel _self;
  final $Res Function(_ShippingAddressModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addressLine1 = null,
    Object? addressLine2 = freezed,
    Object? city = null,
    Object? state = null,
    Object? postalCode = null,
    Object? country = freezed,
    Object? optionalRemarks = freezed,
    Object? isDefault = freezed,
    Object? id = null,
  }) {
    return _then(_ShippingAddressModel(
      addressLine1: null == addressLine1
          ? _self.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String,
      addressLine2: freezed == addressLine2
          ? _self.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      optionalRemarks: freezed == optionalRemarks
          ? _self.optionalRemarks
          : optionalRemarks // ignore: cast_nullable_to_non_nullable
              as String?,
      isDefault: freezed == isDefault
          ? _self.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}
