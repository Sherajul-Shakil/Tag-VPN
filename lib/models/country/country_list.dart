// ignore_for_file: prefer_void_to_null, avoid_print

import 'data_model.dart';

class CountryListModel {
  List<DataModel>? data;

  CountryListModel({this.data});

  CountryListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        print(v);
        data!.add(DataModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
