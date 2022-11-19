class DataModel {
  int? id;
  String? name;
  String? ip;
  String? port;
  String? icon;
  String? iconUrl;

  DataModel({this.id, this.name, this.ip, this.port, this.icon, this.iconUrl});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ip = json['ip'];
    port = json['port'];
    icon = json['icon'];
    iconUrl = json['icon_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['ip'] = ip;
    data['port'] = port;
    data['icon'] = icon;
    data['icon_url'] = iconUrl;
    return data;
  }
}