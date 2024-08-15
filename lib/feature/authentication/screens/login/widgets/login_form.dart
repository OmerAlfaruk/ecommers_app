import 'package:ecommerce/feature/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce/feature/authentication/screens/sign_up/signup_screen.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../password_configuration/forget_password.dart';

class OLoginForm extends StatelessWidget {
  const OLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: OSizes.spaceBtwSections),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => OValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: OText.email,
              ),
            ),
            SizedBox(
              height: OSizes.spaceBtwInputFields,
            ),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                validator: (value) =>
                    OValidator.validateEmptyText('Password', value),
                decoration: InputDecoration(
                    labelText: OText.password,
                    prefixIcon: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye_slash
                            : Iconsax.eye))),
              ),
            ),
            const SizedBox(
              height: OSizes.spaceBtwInputFields / 2,
            ),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///Remember Me
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                            !controller.rememberMe.value)),
                    const Text(OText.rememberMe),
                  ],
                ),

                /// Forget password
                TextButton(
                    onPressed: () {
                      Get.to(() => const ForgetPassword());
                    },
                    child: const Text(OText.forgetPassword))
              ],
            ),
            const SizedBox(
              height: OSizes.spaceBtwSections,
            ),

            ///Sign in Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.emailAndPasswordSignIn();
                },
                child: const Text(OText.signIn),
              ),
            ),
            const SizedBox(
              height: OSizes.spaceBtwItems,
            ),

            ///Create account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: const Text(OText.createAccount),
              ),
            )
          ],
        ),
      ),
    );
  }
}
