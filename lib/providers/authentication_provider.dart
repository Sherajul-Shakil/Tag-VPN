import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tap_vpn_details/models/authentication/login_user.dart';
import 'package:tap_vpn_details/models/authentication/registration_successful.dart';
import 'package:tap_vpn_details/models/formalstatus/formal_status.dart';
import 'package:tap_vpn_details/repositories/authentication_repositories/authentication_repository.dart';

import '../db/db_helper.dart';
import '../models/authentication/social_login_model.dart';

class AuthenticationProvider extends ChangeNotifier {
  LoginUser _loginUser = LoginUser();
  FormalStatus _formalStatus = FormalStatus();
  RegistrationSuccessful _registrationSuccessful = RegistrationSuccessful();
  bool _isRegistrationSuccessful = false;
  String _emailForForgetPassword = "";
  String _otpPin = "";
  bool _completeChangePassword = false;
  bool _isForgetPasswordPageButtonPressed = false;
  dynamic _userTokenAfterLoginIn = "";

  // Getter And Setters

  dynamic get userTokenAfterLoginIn => _userTokenAfterLoginIn;

  set userTokenAfterLoginIn(dynamic value) {
    _userTokenAfterLoginIn = value;
    notifyListeners();
  }

  String get otpPin => _otpPin;
  set otpPin(String value) {
    _otpPin = value;
    notifyListeners();
  }

  LoginUser get loginUser => _loginUser;
  set loginUser(LoginUser value) {
    _loginUser = value;
    notifyListeners();
  }

  RegistrationSuccessful get registrationSuccessful => _registrationSuccessful;
  set registrationSuccessful(RegistrationSuccessful value) {
    _registrationSuccessful = value;
    notifyListeners();
  }

  bool get isRegistrationSuccessful => _isRegistrationSuccessful;
  set isRegistrationSuccessful(bool value) {
    _isRegistrationSuccessful = value;
    notifyListeners();
  }

  FormalStatus get formalStatus => _formalStatus;
  set formalStatus(FormalStatus value) {
    _formalStatus = value;
    notifyListeners();
  }

  String get emailForForgetPassword => _emailForForgetPassword;

  set emailForForgetPassword(String value) {
    _emailForForgetPassword = value;
    notifyListeners();
  }

  bool get completeChangePassword => _completeChangePassword;

  set completeChangePassword(bool value) {
    _completeChangePassword = value;
    notifyListeners();
  }

  bool get isForgetPasswordPageButtonPressed =>
      _isForgetPasswordPageButtonPressed;

  set isForgetPasswordPageButtonPressed(bool value) {
    _isForgetPasswordPageButtonPressed = value;
    notifyListeners();
  }

  // api functions

  // registration
  Future<void> registerNewUser(String name, String email, String password,
      String confirmPassword) async {
    var response = await AuthenticationRepository()
        .registerNewUser(name, email, password, confirmPassword);
    if (response.statusCode == 200) {
      registrationSuccessful = RegistrationSuccessful.fromJson(response.data);
      print(registrationSuccessful);
      isRegistrationSuccessful = true;
      notifyListeners();
    } else {
      isRegistrationSuccessful = false;
      notifyListeners();
    }
  }

  // login
  Future<void> loginUserInfo(
      String email, String password, String deviceName, String uid) async {
    var response = await AuthenticationRepository()
        .loginUserInfo(email, password, deviceName, uid);
    if (response.statusCode == 200) {
      loginUser = LoginUser.fromJson(response.data);
      userTokenAfterLoginIn = loginUser.token;
      notifyListeners();
    }
  }

  // send otp
  Future<void> sendOtp(String email) async {
    EasyLoading.show(status: 'Loading');
    var response = await AuthenticationRepository().sendOtp(email);
    if (response.statusCode == 200) {
      formalStatus = FormalStatus.fromJson(response.data);
      notifyListeners();
      EasyLoading.dismiss();
    } else {
      EasyLoading.showError("Error");
      EasyLoading.dismiss();
    }
  }

  // verify otp
  Future<void> verifyOtp(String email, String otpPin) async {
    var response = await AuthenticationRepository().verifyOtp(email, otpPin);
    if (response.statusCode == 200) {
      formalStatus = FormalStatus.fromJson(response.data);
      notifyListeners();
    }
  }

  // reset password
  Future<void> resetPassword(
      String email, String newPassword, String confirmPassword) async {
    var response = await AuthenticationRepository()
        .resetPassword(email, newPassword, confirmPassword);
    if (response.statusCode == 200) {
      completeChangePassword = response.data["status"];
      formalStatus = FormalStatus.fromJson(response.data);
      notifyListeners();
    }
  }

  // social login *******************************************************************

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get user => _auth.currentUser;

  Future<void> addUserGoogleLogIn(UserModel userModel) =>
      DBHelper.addUser(userModel);

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    print('mail');
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
print('mail');
    print(googleUser?.email??'');
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }




}
