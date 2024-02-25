import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddressRequestModel {
  final String? name;
  final String? fullAddress;
  final String? phone;
  final String? provId;
  final String? cityId;
  final String? districtId;
  final int? postalCode;
  final int? isDefault;
  AddressRequestModel({
    this.name,
    this.fullAddress,
    this.phone,
    this.provId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.isDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'fullAddress': fullAddress,
      'phone': phone,
      'provId': provId,
      'cityId': cityId,
      'districtId': districtId,
      'postalCode': postalCode,
      'isDefault': isDefault,
    };
  }

  factory AddressRequestModel.fromMap(Map<String, dynamic> map) {
    return AddressRequestModel(
      name: map['name'] != null ? map['name'] as String : null,
      fullAddress:
          map['fullAddress'] != null ? map['fullAddress'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      provId: map['provId'] != null ? map['provId'] as String : null,
      cityId: map['cityId'] != null ? map['cityId'] as String : null,
      districtId:
          map['districtId'] != null ? map['districtId'] as String : null,
      postalCode: map['postalCode'] != null ? map['postalCode'] as int : null,
      isDefault: map['isDefault'] != null ? map['isDefault'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressRequestModel.fromJson(String source) =>
      AddressRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
