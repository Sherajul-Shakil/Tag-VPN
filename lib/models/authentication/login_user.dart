class LoginUser {
  bool? _success;
  String? _token;
  Data? _data;
  String? _message;

  LoginUser({bool? success, String? token, Data? data, String? message}) {
    if (success != null) {
      this._success = success;
    }
    if (token != null) {
      this._token = token;
    }
    if (data != null) {
      this._data = data;
    }
    if (message != null) {
      this._message = message;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get token => _token;
  set token(String? token) => _token = token;
  Data? get data => _data;
  set data(Data? data) => _data = data;
  String? get message => _message;
  set message(String? message) => _message = message;

  LoginUser.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _token = json['token'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['token'] = this._token;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    data['message'] = this._message;
    return data;
  }
}

class Data {
  int? _userId;
  String? _name;
  String? _email;

  Data({int? userId, String? name, String? email}) {
    if (userId != null) {
      this._userId = userId;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
  }

  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;

  Data.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
    _name = json['name'];
    _email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this._userId;
    data['name'] = this._name;
    data['email'] = this._email;
    return data;
  }
}