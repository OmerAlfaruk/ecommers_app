import 'package:ecommerce/common/widget/image_text_widget/image_text_widget.dart';
import 'package:ecommerce/common/widget/shimmer/category_shimmer.dart';
import 'package:ecommerce/feature/shop/controllers/category_controller.dart';
import 'package:ecommerce/feature/shop/screens/sub_category/sub_categories.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const CategoryShimmer();
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {

              final category = categoryController.featuredCategories[index];

              return VerticalImageText(
                image: category.image,
                title: category.name,
                textColor: Colors.white,
                backgroundColor: Colors.white,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            }),
      );
    });
  }
}
