import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/widget/images/rounded_image.dart';
import 'package:ecommerce/common/widget/shimmer/shimmer.dart';
import 'package:ecommerce/feature/shop/controllers/banner_controller.dart';
import 'package:ecommerce/feature/shop/controllers/home_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../common/widget/custom_shapes/container/circular_container.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class PromoSlider extends StatelessWidget {

  const PromoSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller=Get.put(BannerController());
    return Obx(
        (){
          if (controller.isLoading.value) return const OShimmerEffect(width: double.infinity, height: 190);
          if(controller.banners.isEmpty){
            return const Center(child: Text('No Data Found'),);
          }else{
            return Column(
              children: [
                CarouselSlider(
                    options: CarouselOptions(viewportFraction: 1,onPageChanged: (index,_){
                      controller.updatePageIndicator(index);
                    }),

                    items:controller.banners.map((banner) =>RoundedBorderImage(imageUrl: banner.imageUrl,isNetworkImage: true,onPressed: ()=>Get.toNamed(banner.targetScreen),)).toList()

                  // [
                  //   RoundedBorderImage(
                  //     imageUrl: OImages.banner1,
                  //     width: 250,
                  //   ),
                  //   RoundedBorderImage(
                  //     imageUrl: OImages.banner2,
                  //     width: 250,
                  //   ),
                  //   RoundedBorderImage(
                  //     imageUrl: OImages.banner3,
                  //     width: 250,
                  //   ),
                  // ],
                ),
                SizedBox(
                  height: OSizes.spaceBtwItems,
                ),
                Center(
                  child: Obx(
                        ()=> Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int i = 0; i < controller.banners.length; i++)
                          CircularContainer(
                            height: 4,
                            width: 20,

                            backGroundColor: controller.carousalCurrentIndex.value==i?OAppColor.primary:OAppColor.grey,
                            margin: EdgeInsets.only(right:10),
                          )
                      ],
                    ),
                  ),
                )
              ],
            );
          }

        }
    );
  }
}
