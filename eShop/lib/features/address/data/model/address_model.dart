import '../repository/repository.dart';
class AddressModel extends AddressEntity {
  const AddressModel({
    required super.user,
    required super.addressLine1,
    required super.city,
    required super.state,
    required super.postalCode,
    required super.isDefault,
    required super.id,
    required super.createdAt,
    required super.updatedAt,
    super.addressLine2,
    super.country,
    super.optionalRemarks,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'user': user,
      'addressLine1': addressLine1,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'isDefault': isDefault,
      'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
      'addressLine2': addressLine2,
      'country': country,
      'optionalRemarks': optionalRemarks,
    };
  }
  factory AddressModel.fromJson(Map<String, dynamic> map) {
    return AddressModel(
      user: map['user'] as String,
      addressLine1: map['address_line1'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      postalCode: map['postal_code'] as String,
      isDefault: map['is_default'] as bool,
      id: map['id'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      addressLine2:
          map['address_line2'] != null ? map['address_line2'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      optionalRemarks: map['optional_remarks'] != null
          ? map['optional_remarks'] as String
          : null,
    );
  }
}
extension AddressModelX on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(
      user: user,
      id: id,
      addressLine1: addressLine1,
      city: city,
      state: state,
      postalCode: postalCode,
      createdAt: createdAt,
      updatedAt: updatedAt,
      addressLine2: addressLine2,
      country: country,
      isDefault: isDefault,
      optionalRemarks: optionalRemarks,
    );
  }
}
extension AddressEntityListX on List<AddressEntity> {
  AddressEntity get selectedAddress =>
      firstWhere((address) => address.isDefault);
}
extension AddressModelListX on List<AddressModel> {
  List<AddressEntity> toEntityList() =>
      map((value) => value.toEntity()).toList();
}