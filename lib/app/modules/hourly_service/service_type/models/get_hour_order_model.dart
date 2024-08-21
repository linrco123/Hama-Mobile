class GetHourOrderModel {
  int? code;
  String? message;
  Data? data;

  GetHourOrderModel({this.code, this.message, this.data});

  GetHourOrderModel.fromJson(Map<String, dynamic> json) {
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
  int? currentPage;
  List<HourData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  Data(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <HourData>[];
      json['data'].forEach((v) {
        data!.add(new HourData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class HourData {
  int? id;
  String? fromDate;
  String? toDate;
  int? servantCount;
  int? cost;
  int? visits;
  String? userName;
  String? paymentStatus;
  Package? package;
  List<Servants>? servants;

  HourData(
      {this.id,
      this.fromDate,
      this.toDate,
      this.servantCount,
      this.cost,
      this.visits,
      this.userName,
      this.paymentStatus,
      this.package,
      this.servants});

  HourData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    servantCount = json['servant_count'];
    cost = json['cost'];
    visits = json['visits'];
    userName = json['user_name'];
    paymentStatus = json['payment_status'];
    package =
        json['package'] != null ? new Package.fromJson(json['package']) : null;
    if (json['servants'] != null) {
      servants = <Servants>[];
      json['servants'].forEach((v) {
        servants!.add(new Servants.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['servant_count'] = this.servantCount;
    data['cost'] = this.cost;
    data['visits'] = this.visits;
    data['user_name'] = this.userName;
    data['payment_status'] = this.paymentStatus;
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    if (this.servants != null) {
      data['servants'] = this.servants!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Package {
  String? title;
  String? shift;
  String? duration;
  int? fromTime;
  int? endTime;

  Package({this.title, this.shift, this.duration, this.fromTime, this.endTime});

  Package.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    shift = json['shift'];
    duration = json['duration'];
    fromTime = json['from_time'];
    endTime = json['end_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['shift'] = this.shift;
    data['duration'] = this.duration;
    data['from_time'] = this.fromTime;
    data['end_time'] = this.endTime;
    return data;
  }
}

class Servants {
  int? id;
  String? name;
  String? fileNo;

  Servants({this.id, this.name, this.fileNo});

  Servants.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fileNo = json['file_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['file_no'] = this.fileNo;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}