class RegistrationSuccessful {
  bool? _success;
  String? _message;
  Data? _data;
  String? _token;

  RegistrationSuccessful(
      {bool? success, String? message, Data? data, String? token}) {
    if (success != null) {
      this._success = success;
    }
    if (message != null) {
      this._message = message;
    }
    if (data != null) {
      this._data = data;
    }
    if (token != null) {
      this._token = token;
    }
  }

  bool? get success => _success;
  set success(bool? success) => _success = success;
  String? get message => _message;
  set message(String? message) => _message = message;
  Data? get data => _data;
  set data(Data? data) => _data = data;
  String? get token => _token;
  set token(String? token) => _token = token;

  RegistrationSuccessful.fromJson(Map<String, dynamic> json) {
    _success = json['success'];
    _message = json['message'];
    _data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this._success;
    data['message'] = this._message;
    if (this._data != null) {
      data['data'] = this._data!.toJson();
    }
    data['token'] = this._token;
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