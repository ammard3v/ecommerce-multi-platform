class AddAddressReq {
  final String addressLine1;
  final String city;
  final String state;
  final String postalCode;
  final bool isDefault;
  final String? addressLine2;
  final String? country;
  final String? optionalRemarks;
  AddAddressReq({
    required this.addressLine1,
    required this.city,
    required this.state,
    required this.postalCode,
    this.isDefault = false,
    this.addressLine2,
    this.country,
    this.optionalRemarks,
  });
  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'address_line1': addressLine1,
      'city': city,
      'state': state,
      'postal_code': postalCode,
      'is_default': isDefault,
      'address_line2': addressLine2,
      'country': country,
      'optional_remarks': optionalRemarks,
    };
  }
}