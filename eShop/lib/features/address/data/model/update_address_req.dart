class UpdateAddressReq {
  final String? addressLine1;
  final String? city;
  final String? state;
  final String? postalCode;
  final bool? isDefault;
  final String? addressLine2;
  final String? country;
  final String? optionalRemarks;
  UpdateAddressReq({
    this.addressLine1,
    this.city,
    this.state,
    this.postalCode,
    this.isDefault,
    this.addressLine2,
    this.country,
    this.optionalRemarks,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'addressLine1': addressLine1,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'isDefault': isDefault,
      'addressLine2': addressLine2,
      'country': country,
      'optionalRemarks': optionalRemarks,
    };
  }
}