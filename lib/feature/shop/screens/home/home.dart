import 'package:ecommerce/common/widget/custom_shapes/container/search_container.dart';
import 'package:ecommerce/common/widget/shimmer/vertical_product_shimmer.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/feature/shop/controllers/banner_controller.dart';
import 'package:ecommerce/feature/shop/controllers/product_controller.dart';
import 'package:ecommerce/feature/shop/screens/all_product/all_products.dart';
import 'package:ecommerce/feature/shop/screens/home/widgets/home_app_bar.dart';
import 'package:ecommerce/common/widget/custom_shapes/container/primary_header_container.dart';
import 'package:ecommerce/feature/shop/screens/home/widgets/home_category.dart';
import 'package:ecommerce/feature/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widget/layout/grid_view.dart';
import '../../../../common/widget/product/product/product_cards/product_card_vertical.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(
              child: Column(
                /// header
                children: [
                  /// AppBar
                  HomeAppBar(),
                  //
                  SizedBox(
                    height: OSizes.spaceBtwSections,
                  ),

                  /// Search bar
                  SearchContainer(
                    text: 'search item in the store',
                    padding:
                        EdgeInsets.symmetric(horizontal: OSizes.defaultSpace),
                  ),
                  SizedBox(
                    height: OSizes.spaceBtwSections,
                  ),

                  /// categories
                  Padding(
                    padding: EdgeInsets.only(left: OSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///--- Heading
                        SectionHeading(
                          title: 'Popular categories',
                        ),

                        SizedBox(
                          height: OSizes.spaceBtwItems,
                        ),

                        ///---Categories
                        HomeCategory(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: OSizes.defaultSpace + 5,
                  )
                ],
              ),
            ),

            ///
            Padding(
              padding: EdgeInsets.all(OSizes.defaultSpace),
              child: Column(
                children: [
                  PromoSlider (

                  ),
                  SectionHeading(
                    title: "Popular Product",
                    onPressed: () => Get.to(() => AllProducts()),
                  ),
                  SizedBox(
                    height: OSizes.spaceBtwItems / 2,
                  ),
                  Obx((){
                    if(controller.isLoading.value) return const VerticalProductShimmer();
                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('No Data Found',style: Theme.of(context).textTheme.bodyMedium,),);
                    }
                    return  OGridLayout(
                      itemCount: controller.featuredProducts.length,
                      itemBuilder: (_, index) {
                        return ProductCardVertical(product: controller.featuredProducts[index],);
                      },
                    );
                  }
                   ,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
