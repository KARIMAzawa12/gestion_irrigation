import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class LoginController extends GetxController{
  login();
  goToSignUp();
  goToForgetPassword();
  showPassword();
}
class LoginControllerImp extends LoginController{

  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  login() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.offAllNamed(AppRoute.rootPage);
    }else{
      print("Not Valid");
    }
    throw UnimplementedError();
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
    throw UnimplementedError();
  }

  @override
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
    throw UnimplementedError();
  }
}