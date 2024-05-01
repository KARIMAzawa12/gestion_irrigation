 import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController{
  checkCode();
  goToSuccessPage();
  goToResetPassword();
}
class VerifyCodeControllerImp extends VerifyCodeController{
  late String verifyCode;
  @override
  checkCode() {
    throw UnimplementedError();
  }

  @override
  goToSuccessPage() {
    Get.offNamed(AppRoute.successSignUp);
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  goToResetPassword() {
    Get.offNamed(AppRoute.resetPassword);
  }

}