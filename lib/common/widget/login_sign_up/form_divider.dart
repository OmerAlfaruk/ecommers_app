
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class FormDivider extends StatelessWidget {
  const FormDivider({
    super.key,
    required this.dark, required this.text,
  });

  final bool dark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              color: dark ? OAppColor.darkerGrey : OAppColor.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5,
            ),
            Text(text,
                style: Theme.of(context).textTheme.labelMedium),
            Divider(
              color: dark ? OAppColor.darkerGrey : OAppColor.grey,
              thickness: 0.5,
              indent: 60,
              endIndent: 5,
            ),
          ],
        ),
        const SizedBox(
          height: OSizes.spaceBtwItems,
        ),
      ],
    );
  }
}