import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/layout/grid_view.dart';
import 'package:ecommerce/common/widget/product/product/brand_card.dart';
import 'package:ecommerce/common/widget/product/product/sortable/sortable.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/feature/shop/screens/brand/brand_product.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OAppBar(title: Text('Brand'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              SectionHeading(title: 'Brands',showActionButton: false,),
              SizedBox(height: OSizes.spaceBtwItems,),

              /// -- Brands
              OGridLayout(itemCount: 10,mainAxisExtent: 80, itemBuilder: (context,index){
                return BrandCard(showBorder: true,onTap: ()=>Get.to(()=>BrandProducts()),);
              })

            ],
          ),
        ),
      ),
    );
  }
}
