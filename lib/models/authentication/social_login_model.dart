// ignore_for_file: prefer_if_null_operators

import 'package:cloud_firestore/cloud_firestore.dart';

const userUid = 'uId';
const userName = 'name';
const userEmail = 'email';
const userPhone = 'mobile';
const userImage = 'image';
const userTimeStamp = 'userCreationTime';

class UserModel {
  String uId;
  String? name;
  String email;
  String? mobile;
  String? image;
  Timestamp userCreationTime;

  UserModel({
    required this.uId,
    this.name,
    required this.email,
    this.mobile,
    this.image,
    required this.userCreationTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      userUid: uId,
      userName: name,
      userEmail: email,
      userPhone: mobile,
      userImage: image,
      userTimeStamp: userCreationTime,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        uId: map[userUid],
        name: map[userName],
        email: map[userEmail],
        mobile: map[userPhone],
        image: map[userImage],
        userCreationTime: map[userTimeStamp],
      );
}