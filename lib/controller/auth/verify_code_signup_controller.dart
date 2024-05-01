import 'package:get/get.dart';
import '../../core/constant/routes.dart';

abstract class VerifyCodeSignUpController extends GetxController{
  checkCode();
  goToSuccessSignUp();
}
class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController{
  late String verifyCode;
  @override
  checkCode() {
    Get.offNamed(AppRoute.login);
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }

}