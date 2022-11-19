class PremiumSubscriptionList {
  bool? _success;
  List<Data>? _data;

  PremiumSubscriptionList({bool? success, List<Data>? data}) {
    if (success != null) {
      this._success = success;
    }
    if (data != null) {
      this._data = data;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  List<Data>? get data => _data;
  set data(List<Data>? data) => _data = data;

  PremiumSubscriptionList.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = <Data>[];
      json['data'].forEach((v) {
        _data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    if (this._data != null) {
      data['data'] = this._data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? _id;
  String? _name;
  String? _subtitle;
  String? _price;
  String? _validity;
  String? _freeDays;

  Data(
      {int? id,
        String? name,
        String? subtitle,
        String? price,
        String? validity,
        String? freeDays}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (subtitle != null) {
      this._subtitle = subtitle;
    }
    if (price != null) {
      this._price = price;
    }
    if (validity != null) {
      this._validity = validity;
    }
    if (freeDays != null) {
      this._freeDays = freeDays;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get subtitle => _subtitle;
  set subtitle(String? subtitle) => _subtitle = subtitle;
  String? get price => _price;
  set price(String? price) => _price = price;
  String? get validity => _validity;
  set validity(String? validity) => _validity = validity;
  String? get freeDays => _freeDays;
  set freeDays(String? freeDays) => _freeDays = freeDays;

  Data.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _subtitle = json['subtitle'];
    _price = json['price'];
    _validity = json['validity'];
    _freeDays = json['free_days'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['subtitle'] = this._subtitle;
    data['price'] = this._price;
    data['validity'] = this._validity;
    data['free_days'] = this._freeDays;
    return data;
  }
}