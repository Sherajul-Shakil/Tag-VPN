import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInRepository{
  static Future<GoogleSignInAccount?> login(){
    return GoogleSignIn().signIn();
  }

}