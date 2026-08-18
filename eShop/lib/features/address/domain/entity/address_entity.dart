import 'package:equatable/equatable.dart';
class AddressEntity extends Equatable {
  final String user;
  final String addressLine1;
  final String city;
  final String state;
  final String postalCode;
  final bool isDefault;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? addressLine2;
  final String? country;
  final String? optionalRemarks;
  const AddressEntity({
    required this.user,
    required this.addressLine1,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.isDefault,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.addressLine2,
    this.country,
    this.optionalRemarks,
  });
  @override
  List<Object?> get props => [
        user,
        addressLine1,
        addressLine2,
        city,
        state,
        postalCode,
        country,
        optionalRemarks,
        isDefault,
        id,
        createdAt,
        updatedAt,
      ];
  AddressEntity copyWith({
    String? user,
    String? addressLine1,
    String? city,
    String? state,
    String? postalCode,
    bool? isDefault,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? addressLine2,
    String? country,
    String? optionalRemarks,
  }) {
    return AddressEntity(
      user: user ?? this.user,
      addressLine1: addressLine1 ?? this.addressLine1,
      city: city ?? this.city,
      state: state ?? this.state,
      postalCode: postalCode ?? this.postalCode,
      isDefault: isDefault ?? this.isDefault,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      addressLine2: addressLine2 ?? this.addressLine2,
      country: country ?? this.country,
      optionalRemarks: optionalRemarks ?? this.optionalRemarks,
    );
  }
}