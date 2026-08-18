part of 'admin_users_manage_model.dart';
T _$identity<T>(T value) => value;
mixin _$AdminUsersManageModel {
  String get name;
  String get email;
  String get role;
  String get authProvider;
  @JsonKey(name: 'is_verified')
  bool get isVerified;
  bool get active;
  String get verificationMethod;
  String get id;
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  String? get phoneNumber;
  String? get photo;
  String? get verificationOTP;
  @JsonKey(name: 'verificationOTPExpires')
  DateTime? get verificationOTPExpires;
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AdminUsersManageModelCopyWith<AdminUsersManageModel> get copyWith =>
      _$AdminUsersManageModelCopyWithImpl<AdminUsersManageModel>(
          this as AdminUsersManageModel, _$identity);
  Map<String, dynamic> toJson();
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdminUsersManageModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.authProvider, authProvider) ||
                other.authProvider == authProvider) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.verificationMethod, verificationMethod) ||
                other.verificationMethod == verificationMethod) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.verificationOTP, verificationOTP) ||
                other.verificationOTP == verificationOTP) &&
            (identical(other.verificationOTPExpires, verificationOTPExpires) ||
                other.verificationOTPExpires == verificationOTPExpires));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      role,
      authProvider,
      isVerified,
      active,
      verificationMethod,
      id,
      createdAt,
      updatedAt,
      phoneNumber,
      photo,
      verificationOTP,
      verificationOTPExpires);
  @override
  String toString() {
    return 'AdminUsersManageModel(name: $name, email: $email, role: $role, authProvider: $authProvider, isVerified: $isVerified, active: $active, verificationMethod: $verificationMethod, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, phoneNumber: $phoneNumber, photo: $photo, verificationOTP: $verificationOTP, verificationOTPExpires: $verificationOTPExpires)';
  }
}
abstract mixin class $AdminUsersManageModelCopyWith<$Res> {
  factory $AdminUsersManageModelCopyWith(AdminUsersManageModel value,
          $Res Function(AdminUsersManageModel) _then) =
      _$AdminUsersManageModelCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String email,
      String role,
      String authProvider,
      @JsonKey(name: 'is_verified') bool isVerified,
      bool active,
      String verificationMethod,
      String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? phoneNumber,
      String? photo,
      String? verificationOTP,
      @JsonKey(name: 'verificationOTPExpires')
      DateTime? verificationOTPExpires});
}
class _$AdminUsersManageModelCopyWithImpl<$Res>
    implements $AdminUsersManageModelCopyWith<$Res> {
  _$AdminUsersManageModelCopyWithImpl(this._self, this._then);
  final AdminUsersManageModel _self;
  final $Res Function(AdminUsersManageModel) _then;
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? authProvider = null,
    Object? isVerified = null,
    Object? active = null,
    Object? verificationMethod = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? phoneNumber = freezed,
    Object? photo = freezed,
    Object? verificationOTP = freezed,
    Object? verificationOTPExpires = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      authProvider: null == authProvider
          ? _self.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationMethod: null == verificationMethod
          ? _self.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
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
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationOTP: freezed == verificationOTP
          ? _self.verificationOTP
          : verificationOTP // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationOTPExpires: freezed == verificationOTPExpires
          ? _self.verificationOTPExpires
          : verificationOTPExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}
extension AdminUsersManageModelPatterns on AdminUsersManageModel {
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_AdminUsersManageModel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminUsersManageModel() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_AdminUsersManageModel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUsersManageModel():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_AdminUsersManageModel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUsersManageModel() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            String email,
            String role,
            String authProvider,
            @JsonKey(name: 'is_verified') bool isVerified,
            bool active,
            String verificationMethod,
            String id,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? phoneNumber,
            String? photo,
            String? verificationOTP,
            @JsonKey(name: 'verificationOTPExpires')
            DateTime? verificationOTPExpires)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AdminUsersManageModel() when $default != null:
        return $default(
            _that.name,
            _that.email,
            _that.role,
            _that.authProvider,
            _that.isVerified,
            _that.active,
            _that.verificationMethod,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.phoneNumber,
            _that.photo,
            _that.verificationOTP,
            _that.verificationOTPExpires);
      case _:
        return orElse();
    }
  }
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            String email,
            String role,
            String authProvider,
            @JsonKey(name: 'is_verified') bool isVerified,
            bool active,
            String verificationMethod,
            String id,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? phoneNumber,
            String? photo,
            String? verificationOTP,
            @JsonKey(name: 'verificationOTPExpires')
            DateTime? verificationOTPExpires)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUsersManageModel():
        return $default(
            _that.name,
            _that.email,
            _that.role,
            _that.authProvider,
            _that.isVerified,
            _that.active,
            _that.verificationMethod,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.phoneNumber,
            _that.photo,
            _that.verificationOTP,
            _that.verificationOTPExpires);
      case _:
        throw StateError('Unexpected subclass');
    }
  }
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String name,
            String email,
            String role,
            String authProvider,
            @JsonKey(name: 'is_verified') bool isVerified,
            bool active,
            String verificationMethod,
            String id,
            @JsonKey(name: 'created_at') DateTime createdAt,
            @JsonKey(name: 'updated_at') DateTime updatedAt,
            String? phoneNumber,
            String? photo,
            String? verificationOTP,
            @JsonKey(name: 'verificationOTPExpires')
            DateTime? verificationOTPExpires)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AdminUsersManageModel() when $default != null:
        return $default(
            _that.name,
            _that.email,
            _that.role,
            _that.authProvider,
            _that.isVerified,
            _that.active,
            _that.verificationMethod,
            _that.id,
            _that.createdAt,
            _that.updatedAt,
            _that.phoneNumber,
            _that.photo,
            _that.verificationOTP,
            _that.verificationOTPExpires);
      case _:
        return null;
    }
  }
}
@JsonSerializable()
class _AdminUsersManageModel implements AdminUsersManageModel {
  const _AdminUsersManageModel(
      {required this.name,
      required this.email,
      required this.role,
      required this.authProvider,
      @JsonKey(name: 'is_verified') required this.isVerified,
      required this.active,
      required this.verificationMethod,
      required this.id,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.phoneNumber,
      this.photo,
      this.verificationOTP,
      @JsonKey(name: 'verificationOTPExpires') this.verificationOTPExpires});
  factory _AdminUsersManageModel.fromJson(Map<String, dynamic> json) =>
      _$AdminUsersManageModelFromJson(json);
  @override
  final String name;
  @override
  final String email;
  @override
  final String role;
  @override
  final String authProvider;
  @override
  @JsonKey(name: 'is_verified')
  final bool isVerified;
  @override
  final bool active;
  @override
  final String verificationMethod;
  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? phoneNumber;
  @override
  final String? photo;
  @override
  final String? verificationOTP;
  @override
  @JsonKey(name: 'verificationOTPExpires')
  final DateTime? verificationOTPExpires;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AdminUsersManageModelCopyWith<_AdminUsersManageModel> get copyWith =>
      __$AdminUsersManageModelCopyWithImpl<_AdminUsersManageModel>(
          this, _$identity);
  @override
  Map<String, dynamic> toJson() {
    return _$AdminUsersManageModelToJson(
      this,
    );
  }
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AdminUsersManageModel &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.authProvider, authProvider) ||
                other.authProvider == authProvider) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.verificationMethod, verificationMethod) ||
                other.verificationMethod == verificationMethod) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.verificationOTP, verificationOTP) ||
                other.verificationOTP == verificationOTP) &&
            (identical(other.verificationOTPExpires, verificationOTPExpires) ||
                other.verificationOTPExpires == verificationOTPExpires));
  }
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      email,
      role,
      authProvider,
      isVerified,
      active,
      verificationMethod,
      id,
      createdAt,
      updatedAt,
      phoneNumber,
      photo,
      verificationOTP,
      verificationOTPExpires);
  @override
  String toString() {
    return 'AdminUsersManageModel(name: $name, email: $email, role: $role, authProvider: $authProvider, isVerified: $isVerified, active: $active, verificationMethod: $verificationMethod, id: $id, createdAt: $createdAt, updatedAt: $updatedAt, phoneNumber: $phoneNumber, photo: $photo, verificationOTP: $verificationOTP, verificationOTPExpires: $verificationOTPExpires)';
  }
}
abstract mixin class _$AdminUsersManageModelCopyWith<$Res>
    implements $AdminUsersManageModelCopyWith<$Res> {
  factory _$AdminUsersManageModelCopyWith(_AdminUsersManageModel value,
          $Res Function(_AdminUsersManageModel) _then) =
      __$AdminUsersManageModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String email,
      String role,
      String authProvider,
      @JsonKey(name: 'is_verified') bool isVerified,
      bool active,
      String verificationMethod,
      String id,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? phoneNumber,
      String? photo,
      String? verificationOTP,
      @JsonKey(name: 'verificationOTPExpires')
      DateTime? verificationOTPExpires});
}
class __$AdminUsersManageModelCopyWithImpl<$Res>
    implements _$AdminUsersManageModelCopyWith<$Res> {
  __$AdminUsersManageModelCopyWithImpl(this._self, this._then);
  final _AdminUsersManageModel _self;
  final $Res Function(_AdminUsersManageModel) _then;
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? role = null,
    Object? authProvider = null,
    Object? isVerified = null,
    Object? active = null,
    Object? verificationMethod = null,
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? phoneNumber = freezed,
    Object? photo = freezed,
    Object? verificationOTP = freezed,
    Object? verificationOTPExpires = freezed,
  }) {
    return _then(_AdminUsersManageModel(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _self.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      authProvider: null == authProvider
          ? _self.authProvider
          : authProvider // ignore: cast_nullable_to_non_nullable
              as String,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      active: null == active
          ? _self.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
      verificationMethod: null == verificationMethod
          ? _self.verificationMethod
          : verificationMethod // ignore: cast_nullable_to_non_nullable
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
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _self.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationOTP: freezed == verificationOTP
          ? _self.verificationOTP
          : verificationOTP // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationOTPExpires: freezed == verificationOTPExpires
          ? _self.verificationOTPExpires
          : verificationOTPExpires // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}
