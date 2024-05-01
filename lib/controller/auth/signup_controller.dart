import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SignUpController extends GetxController{
  signUp();
  goToLogIn();
}
class SignUpControllerImp extends SignUpController{
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  bool isShowPassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();


  @override
  signUp() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.verifyCodeSignUp);
    }else{
      print("Not Valid");
    }
    throw UnimplementedError();
  }

  @override
  goToLogIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
    throw UnimplementedError();
  }
}