
import 'package:ecommerce/common/widget/login_sign_up/form_divider.dart';
import 'package:ecommerce/common/widget/login_sign_up/social_buttons.dart';
import 'package:ecommerce/feature/authentication/screens/sign_up/widgets/signup_form.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///Title
              Text(
                OText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),

              ///Form
              const SignUpForm(),

              const SizedBox(
                height: OSizes.spaceBtwSections,
              ),
              ///Divider
              FormDivider(dark: dark, text: OText.orSignUpWith),

             /// social Buttons
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}



