

import 'package:ecommerce/common/styles/spacing_styles.dart';
import 'package:ecommerce/common/widget/login_sign_up/form_divider.dart';
import 'package:ecommerce/common/widget/login_sign_up/social_buttons.dart';
import 'package:ecommerce/feature/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/feature/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: OSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OLoginHeader(),

              /// Form
              const OLoginForm(),

              ///Divider
              FormDivider(dark: dark, text: OText.orSignInWith.toUpperCase(),),

              /// Footer
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}








