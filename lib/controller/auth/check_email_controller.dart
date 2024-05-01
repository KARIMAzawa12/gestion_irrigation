import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../core/constant/routes.dart';

abstract class CheckEmailController extends GetxController{
  checkPhone();
  goToSuccessSignUp();
}
class CheckEmailControllerImp extends CheckEmailController{
  late TextEditingController email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  checkPhone() {
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp() {
    var formdata = formstate.currentState;
    if(formdata!.validate()){
      Get.offNamed(AppRoute.verifyCodeSignUp);
    }else{
      print("Not Valid");
    }
    throw UnimplementedError();
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}