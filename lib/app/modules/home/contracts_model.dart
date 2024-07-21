import 'package:musaneda/app/modules/home/musaneda_model.dart';
class Contracts {
  String? message;
  int? code;
  List<ContractsData>? data;

  Contracts({this.message, this.code, this.data});

  Contracts.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    code = json['code'];
    if (json['data'] != null) {
      data = <ContractsData>[];
      json['data'].forEach((v) {
        data!.add(new ContractsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContractsData {
  int? id;
  dynamic rentEnded;
  String? payTime;
  Package? package;
  User? user;
  MusanedaData? musaneda;
  Nationality? branch;
  double? price;
  int? isPaid;
  String? status;

  ContractsData(
      { this.id ,
        this.rentEnded,
        this.payTime,
        this.package,
        this.user,
        this.musaneda,
        this.branch,
        this.price,
        this.isPaid,
        this.status});

  ContractsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rentEnded = json['rent_ended'];
    payTime = json['pay_time'];
    package =
    json['package'] != null ? new Package.fromJson(json['package']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    musaneda = json['musaneda'] != null
        ? new MusanedaData.fromJson(json['musaneda'])
        : null;
    branch = json['branch'] != null
        ? new Nationality.fromJson(json['branch'])
        : null;
    price = json['price'] != null ? double.parse(json['price'].toString()):null;
    isPaid = json['is_paid'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['rent_ended'] = this.rentEnded;
    data['pay_time'] = this.payTime;
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.musaneda != null) {
      data['musaneda'] = this.musaneda!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    data['price'] = this.price;
    data['is_paid'] = this.isPaid;
    data['status'] = this.status;
    return data;
  }
}

class Package {
  int? id;
  Name? name;
  dynamic price;
  int? duration;
  dynamic discount;
  dynamic tax;
  dynamic total;
  bool? forAllNationality;
  List? servants;

  Package(
      {this.id,
        this.name,
        this.price,
        this.duration,
        this.discount,
        this.tax,
        this.total,
        this.forAllNationality,
        this.servants});

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
    price = json['price'] != null ? double.parse(json['price'].toString()):null;
    duration = json['duration'];
    discount = json['discount'] != null ? double.parse(json['discount'].toString()):null;
    tax = json['tax'] != null ? double.parse(json['tax'].toString()):null;
    total = json['total'] != null ? double.parse(json['total'].toString()):null;
    forAllNationality = json['for_all_nationality'];
    if (json['servants'] != null) {
      servants = json['servants'] ;

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    data['price'] = this.price;
    data['duration'] = this.duration;
    data['discount'] = this.discount;
    data['tax'] = this.tax;
    data['total'] = this.total;
    data['for_all_nationality'] = this.forAllNationality;
    if (this.servants != null) {
      data['servants'] = this.servants!;
    }
    return data;
  }
}

class Name {
  String? ar;
  String? en;

  Name({this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ar'] = this.ar;
    data['en'] = this.en;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? phone;
  String? email;
  int? otp;
  String? createdAt;
  String? updatedAt;
  String? emailVerifiedAt;
  String? iqama;

  User(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.otp,
        this.createdAt,
        this.updatedAt,
        this.emailVerifiedAt,
        this.iqama});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    emailVerifiedAt = json['email_verified_at'];
    iqama = json['iqama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['iqama'] = this.iqama;
    return data;
  }
}
class Education {
  Name? name;

  Education({this.name});

  Education.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    return data;
  }
}

class Nationality {
  int? id;
  Name? name;

  Nationality({this.id, this.name});

  Nationality.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] != null ? new Name.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    return data;
  }
}