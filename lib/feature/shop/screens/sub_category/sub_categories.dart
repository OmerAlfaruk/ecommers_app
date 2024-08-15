import 'package:ecommerce/common/widget/images/rounded_image.dart';
import 'package:ecommerce/common/widget/product/product/product_cards/horizontal_product_card.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widget/appbar/app_bar.dart';
class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:OAppBar(title: Text(''),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(OSizes.defaultSpace) ,
          child: Column(
            children: [
              /// Banner
              RoundedBorderImage(imageUrl: OImages.promoBanner3,width: double.infinity,applyImageRadius: true,),
              SizedBox(height: OSizes.spaceBtwItems,),

              /// Sub-Categories

              Column(
                children: [
                  SectionHeading(title: 'Sports Shirt',onPressed: (){},),
                  SizedBox(height: OSizes.spaceBtwItems,),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>ProductCardHorizontal(), separatorBuilder: ( context, index) =>SizedBox(width: OSizes.spaceBtwItems,),),
                  )
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
