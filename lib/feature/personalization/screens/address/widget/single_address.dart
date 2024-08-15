import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widget/custom_shapes/container/rounded_container.dart';
class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark=OHelperFunctions.isDark(context);
    return  RoundedContainer(
      width: double.infinity,
      showBoarder: true,
      backgroundColor: selectedAddress?OAppColor.primary.withOpacity(0.5):Colors.transparent,
      borderColor: selectedAddress?Colors.transparent:dark?OAppColor.darkerGrey:OAppColor.grey,
      margin:EdgeInsets.only(bottom: OSizes.spaceBtwItems) ,
      padding: EdgeInsets.all(OSizes.spaceBtwItems),
      child: Stack(children: [
        Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress?Iconsax.tick_circle:null,color: selectedAddress?dark?OAppColor.light:OAppColor.dark:null,),),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Lali Lencho',maxLines: 1,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: OSizes.sm/2,),
            Text('(+251)945678965',maxLines: 1,overflow: TextOverflow.ellipsis,),
            SizedBox(height: OSizes.sm/2,),
            Text("1265 sefera,Nifas silk lafto,Addis Ababa,Ethiopia",style: Theme.of(context).textTheme.titleLarge,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: OSizes.sm/2,
            ),


          ],
        )
      ],),
      
    );
  }
}
