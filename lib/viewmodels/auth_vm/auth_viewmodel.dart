// ignore_for_file: prefer_final_fields
import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../main.dart';
import '../../managers/dio_client.dart';
import '../../managers/push_notification_manager.dart';
import '../../utils/api_constants.dart';
import '../../utils/shared_pref_instance.dart';
import '../../views/auth/login_screen.dart';

class AuthViewmodel extends ChangeNotifier {

  bool _loginError = false;
  bool get loginError => _loginError;
  bool _loading = false;
  bool get loading => _loading;
  TextEditingController forgetEmailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController conformPasswordController=TextEditingController();
  //PushNotificationsManager pushNotificationsManager=PushNotificationsManager();




  setLoginError(bool value) {
    _loginError = value;
    notifyListeners();
  }

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  logout()async{
    await DioClient.instance.post(APIConstants.logout,data: {});
    SharedPreference.instance.setData(key: "token", value: "");
    navigatorKey.currentState?.pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
  }






  login({required String password, required String email, required BuildContext context}) async {
    if (loading) {
      return;
    }
    //log("token: is :${pushNotificationsManager.token}");
    setLoginError(false);
    setLoading(true);
    dynamic body = {
      'Email': email,
      'Password': password,
     // 'deviceID': "${pushNotificationsManager.token}",
      "deviceType": 'Android'
    };
    body= FormData.fromMap(body);
    try {
      dynamic response = await DioClient.instance.post(
        APIConstants.login,
        data: body,
      );
       response=jsonDecode(response.toString());

    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      debugPrint('eeror is $e');
    } finally {
      setLoading(false);
    }
  }


}
