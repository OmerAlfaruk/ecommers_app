
import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class OLoginHeader extends StatelessWidget {
  const OLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
            alignment: Alignment.center,
            child: Image(
                height: 150, image: AssetImage(OImages.appLogo))),
        const SizedBox(
          height: OSizes.spaceBtwItems,
        ),
        Text(
          OText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          OText.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),

      ],
    );
  }
}