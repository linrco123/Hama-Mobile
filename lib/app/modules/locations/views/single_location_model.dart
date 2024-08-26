class LocationModel {
  int? code;
  String? message;
  Data? data;

  LocationModel({this.code, this.message, this.data});

  LocationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? cityId;
  String? addressDetails;
  String? location;
  String? locationName;
  String? anotherInfo;
  String? longitude;
  String? latitude;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;
  String? buildingNumber;
  String? floorNumber;

  Data(
      {this.cityId,
      this.addressDetails,
      this.location,
      this.locationName,
      this.anotherInfo,
      this.longitude,
      this.latitude,
      this.userId,
      this.buildingNumber,
      this.floorNumber,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    addressDetails = json['address_details'];
    location = json['location'];
    locationName = json['location_name'];
    anotherInfo = json['another_info'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    buildingNumber = json["building_num"];
    floorNumber = json["floor_num"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['address_details'] = this.addressDetails;
    data['location'] = this.location;
    data['location_name'] = this.locationName;
    data['another_info'] = this.anotherInfo;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data["building_num"] = this.buildingNumber;
    data["floor_num"] = this.floorNumber;
    return data;
  }
}
