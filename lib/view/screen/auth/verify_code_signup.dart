import 'package:lepfe/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/verify_code_controller.dart';
import '../../../controller/auth/verify_code_signup_controller.dart';
import '../../widget/auth/custom_text_body_auth.dart';
import '../../widget/auth/custom_text_title_auth.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp controller = Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(children: [
          CustomTextBodyAuth(text: "29".tr),
          const SizedBox(height: 20),
          OtpTextField(
            fieldWidth: 50.0,
            borderRadius: BorderRadius.circular(20),
            numberOfFields: 5,
            borderWidth: 5,
            focusedBorderColor: AppColor.green,
            borderColor: AppColor.green,
            // Définir à true pour montrer sous forme de boîte ou à false pour montrer comme un tiret
            showFieldAsBox: true,
            // Appelée lorsque du code est tapé
            onCodeChanged: (String code) {
              // Gestion des validations ou des contrôles ici
            },
            // Appelée lorsque tous les champs de texte sont remplis
            onSubmit: (String verificationCode) {
              controller.goToSuccessSignUp();
            }, // fin onSubmit
          ),
          const SizedBox(height: 30),
        ]),
      ),
    );
  }
}
