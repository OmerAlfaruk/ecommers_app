import 'package:ecommerce/feature/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/feature/authentication/screens/sign_up/widgets/terms%20and%20condition.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignupController());
    final dark = OHelperFunctions.isDark(context);
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator:(value)=>OValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: OText.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  )),
              const SizedBox(
                width: OSizes.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator:(value)=>OValidator.validateEmptyText('First name', value),
                  decoration: const InputDecoration(
                    labelText: OText.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: OSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.userName,
            validator: (value)=>OValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              labelText: OText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: OSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.email,
            validator: (value)=>OValidator.validateEmail(value),
            decoration: const InputDecoration(
              labelText: OText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(
            height: OSizes.spaceBtwInputFields,
          ),
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value)=>OValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              labelText: OText.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: OSizes.spaceBtwInputFields,
          ),
          Obx(
    ()=> TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              validator: (value)=>OValidator.validatePassword(value),
              decoration:  InputDecoration(
                  labelText: OText.password,
                  prefixIcon: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(onPressed: () {
                    controller.hidePassword.value=!controller.hidePassword.value;
                  },
                  icon: Icon(controller.hidePassword.value?Iconsax.eye_slash:Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: OSizes.spaceBtwSections,
          ),
          /// Terms and condition
          TermsAndConditions(dark: dark),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(OText.createAccount),
            ),
          ),

        ],
      ),
    );
  }
}
