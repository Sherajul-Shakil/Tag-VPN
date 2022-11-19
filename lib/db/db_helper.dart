import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/authentication/social_login_model.dart';

class DBHelper {
  static const usersCollection = 'Users';

   static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    return _db
        .collection(usersCollection)
        .doc(userModel.uId)
        .set(userModel.toMap());
  }
}