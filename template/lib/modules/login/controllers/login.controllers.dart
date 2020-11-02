

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:local_auth/local_auth.dart';
import 'package:template/modules/login/models/login.models.dart';
import 'package:template/modules/verifikasibongkar/views/listpengajuan.verifikasi.views.dart';
import 'dart:convert';

import 'package:template/routes/api.dart';

class LoginController extends GetxController{
  bool reload = false;
  bool canCheckBiometrics=false;
  String authorized = 'Not Authorized';
  final LocalAuthentication auth = LocalAuthentication();
  List<BiometricType> availableBiometrics;
  bool isAuthenticating = false;


  void login() async{
    this.reload = true;
    update();

    Map<String, dynamic> params = {};
    params["username"] = LoginModel.username_input;
    params["password"] = LoginModel.password_input;

    var request = await http.post(
        Api.route[LoginModel.modules]['sign_in'],
        body: params);
    if (request.statusCode == 200) {
      var data = json.decode(request.body);
      if(data["status_login"]){
        Get.snackbar("Informasi", "Berhasil Masuk");
        LoginModel.user_id = data["username"].toString();
        LoginModel.departemen = data["departemen"];
        this.reload = false;
        update();

        Get.to(ListPengajuanVerifikasiView());
      }else{
        Get.snackbar("Informasi", "Username dan password tidak ditemukan");
        this.reload = false;
        update();
      }
    }
  }

  void checkBiometrixAuth () async{
    bool canCheckBiometricsData;
    try {
      canCheckBiometricsData = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print("ERROR AUTH"+e.message);
    }

    this.canCheckBiometrics = canCheckBiometricsData;
    update();
  }

  void verifikasiFinger() async{
    List<BiometricType> availableBiometricsData;
    try {
      availableBiometricsData = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print("ERROR AUTH TIDAK TERSEDIA"+e.message);
    }
    checkBiometrixAuth();

    if(!this.canCheckBiometrics){
      Get.snackbar("Informasi", "Tidak support Finger");
    }else{
      //scan
    }
  }

  void authentificationFinger() async{
    bool authenticated = false;
    try {
        this.isAuthenticating = true;
        this.authorized = 'Authenticating';
        update();

        print(this.authorized);
        authenticated = await auth.authenticateWithBiometrics(
          localizedReason: 'Scan your fingerprint to authenticate',
          useErrorDialogs: true,
          stickyAuth: true);

        this.isAuthenticating = false;
        this.authorized = 'Authenticating';
        update();

        print(this.authorized);
    } on PlatformException catch (e) {
      print(e);
    }

    final String message = authenticated ? 'Authorized' : 'Not Authorized';

    this.authorized = message;
    update();

    print(message);
  }

}