class HourlyOrderModel {
  String? msg;
  Data? data;
  int? code;

  HourlyOrderModel({this.msg, this.data, this.code});

  HourlyOrderModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  Order? order;

  Data({this.order});

  Data.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.order != null) {
      data['order'] = this.order!.toJson();
    }
    return data;
  }
}

class Order {
  dynamic countryId;
  dynamic fromDate;
  dynamic visits;
 dynamic toDate;
  dynamic servantCount;
  dynamic userAddressId;
  dynamic cost;
  dynamic userId;
  dynamic packageId;
  dynamic updatedAt;
  dynamic createdAt;
  dynamic id;

  Order(
      {this.countryId,
      this.fromDate,
      this.visits,
      this.toDate,
      this.servantCount,
      this.userAddressId,
      this.cost,
      this.userId,
      this.packageId,
      this.updatedAt,
      this.createdAt,
      this.id});

  Order.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    fromDate = json['from_date'];
    visits = json['visits'];
    toDate = json['to_date'];
    servantCount = json['servant_count'];
    userAddressId = json['user_address_id'];
    cost = json['cost'];
    userId = json['user_id'];
    packageId = json['package_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['from_date'] = this.fromDate;
    data['visits'] = this.visits;
    data['to_date'] = this.toDate;
    data['servant_count'] = this.servantCount;
    data['user_address_id'] = this.userAddressId;
    data['cost'] = this.cost;
    data['user_id'] = this.userId;
    data['package_id'] = this.packageId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}