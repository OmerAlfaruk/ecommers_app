import 'package:ecommerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark=OHelperFunctions.isDark(context);
    return Column(
      children: [
        SectionHeading(title: 'Payment Method',buttonTitle: 'Change',showActionButton: true,onPressed: (){},),
        SizedBox(height: OSizes.spaceBtwItems/2,),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark?OAppColor.light:OAppColor.white,
              padding: EdgeInsets.all(OSizes.sm),
              child: Image(image: AssetImage(OImages.paypal),fit: BoxFit.contain,),
            ),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),

      ],
    );
  }
}
