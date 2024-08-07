// class HourlyOrderModel {
//   String? msg;
//   Data? data;
//   int? code;

//   HourlyOrderModel({this.msg, this.data, this.code});

//   HourlyOrderModel.fromJson(Map<String, dynamic> json) {
//     msg = json["msg"];
//     data = json["data"] == null ? null : Data.fromJson(json["data"]);
//     code = int.parse(json["code"]);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["msg"] = msg;
//     if (data != null) {
//       _data["data"] = data?.toJson();
//     }
//     _data["code"] = code;
//     return _data;
//   }
// }

// class Data {
//   Order? order;

//   Data({this.order});

//   Data.fromJson(Map<String, dynamic> json) {
//     order = json["order"] == null ? null : Order.fromJson(json["order"]);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (order != null) {
//       _data["order"] = order?.toJson();
//     }
//     return _data;
//   }
// }

// class Order {
//   int? countryId;
//   int? duration;
//   String? shift;
//   String? fromDate;
//   int? visits;
//   String? toDate;
//   String? fromTime;
//   int? servantCount;
//   int? userAddressId;
//   double? cost;
//   int? userId;
//   String? updatedAt;
//   String? createdAt;
//   int? id;

//   Order(
//       {this.countryId,
//       this.duration,
//       this.shift,
//       this.fromDate,
//       this.visits,
//       this.toDate,
//       this.fromTime,
//       this.servantCount,
//       this.userAddressId,
//       this.cost,
//       this.userId,
//       this.updatedAt,
//       this.createdAt,
//       this.id});

//   Order.fromJson(Map<String, dynamic> json) {
//     countryId = int.parse(json["country_id"]);
//     duration = int.parse(json["duration"]);
//     shift = json["shift"].toString();
//     fromDate = json["from_date"].toString();
//     visits = int.parse(json["visits"]);
//     toDate = json["to_date"].toString();
//     fromTime = json["from_time"].toString();
//     servantCount = int.parse(json["servant_count"]);
//     userAddressId = int.parse(json["user_address_id"]);
//     cost = double.parse(json["cost"]);
//     userId = int.parse(json["user_id"]);
//     updatedAt = json["updated_at"].toString();
//     createdAt = json["created_at"].toString();
//     id = int.parse(json["id"]);
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["country_id"] = countryId;
//     _data["duration"] = duration;
//     _data["shift"] = shift;
//     _data["from_date"] = fromDate;
//     _data["visits"] = visits;
//     _data["to_date"] = toDate;
//     _data["from_time"] = fromTime;
//     _data["servant_count"] = servantCount;
//     _data["user_address_id"] = userAddressId;
//     _data["cost"] = cost;
//     _data["user_id"] = userId;
//     _data["updated_at"] = updatedAt;
//     _data["created_at"] = createdAt;
//     _data["id"] = id;
//     return _data;
//   }
// }
/////////////////////////////////////////////////////////////////////////

class HourlyOrderModel {
    String? msg;
    Data? data;
    int? code;

    HourlyOrderModel({this.msg, this.data, this.code});

    HourlyOrderModel.fromJson(Map<String, dynamic> json) {
        msg = json["msg"];
        data = json["data"] == null ? null : Data.fromJson(json["data"]);
        code = json["code"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["msg"] = msg;
        if(data != null) {
            _data["data"] = data?.toJson();
        }
        _data["code"] = code;
        return _data;
    }
}

class Data {
    Order? order;

    Data({this.order});

    Data.fromJson(Map<String, dynamic> json) {
        order = json["order"] == null ? null : Order.fromJson(json["order"]);
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        if(order != null) {
            _data["order"] = order?.toJson();
        }
        return _data;
    }
}

class Order {
    dynamic countryId;
    dynamic duration;
    dynamic shift;
    dynamic fromDate;
    dynamic visits;
    dynamic toDate;
    dynamic fromTime;
    dynamic servantCount;
    dynamic userAddressId;
    dynamic cost;
    dynamic userId;
    dynamic updatedAt;
    dynamic createdAt;
    dynamic id;

    Order({this.countryId, this.duration, this.shift, this.fromDate, this.visits, this.toDate, this.fromTime, this.servantCount, this.userAddressId, this.cost, this.userId, this.updatedAt, this.createdAt, this.id});

    Order.fromJson(Map<String, dynamic> json) {
        countryId = json["country_id"];
        duration = json["duration"];
        shift = json["shift"];
        fromDate = json["from_date"];
        visits = json["visits"];
        toDate = json["to_date"];
        fromTime = json["from_time"];
        servantCount = json["servant_count"];
        userAddressId = json["user_address_id"];
        cost = json["cost"];
        userId = json["user_id"];
        updatedAt = json["updated_at"];
        createdAt = json["created_at"];
        id = json["id"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["country_id"] = countryId;
        _data["duration"] = duration;
        _data["shift"] = shift;
        _data["from_date"] = fromDate;
        _data["visits"] = visits;
        _data["to_date"] = toDate;
        _data["from_time"] = fromTime;
        _data["servant_count"] = servantCount;
        _data["user_address_id"] = userAddressId;
        _data["cost"] = cost;
        _data["user_id"] = userId;
        _data["updated_at"] = updatedAt;
        _data["created_at"] = createdAt;
        _data["id"] = id;
        return _data;
    }
}
