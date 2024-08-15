import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/custom_shapes/container/search_container.dart';
import 'package:ecommerce/common/widget/layout/grid_view.dart';
import 'package:ecommerce/common/widget/product/cart/cart_menu_icon.dart';
import 'package:ecommerce/common/widget/product/product/brand_card.dart';
import 'package:ecommerce/common/widget/tab_bar/tab_bar.dart';
import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/feature/shop/controllers/category_controller.dart';
import 'package:ecommerce/feature/shop/screens/store/widgets/category_tab.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../brand/brand.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
  final categories =CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: OAppBar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [CartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 440,
                backgroundColor: OHelperFunctions.isDark(context)
                    ? OAppColor.black
                    : OAppColor.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(OSizes.defaultSpace / 2),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// search
                      const SizedBox(
                        height: OSizes.spaceBtwItems,
                      ),
                      const SearchContainer(
                        text: 'search in store',
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: OSizes.spaceBtwSections,
                      ),

                      /// feature brands
                      SectionHeading(
                        title: 'Featured Brands',
                        onPressed: ()=>Get.to(()=>AllBrandScreen()),
                      ),
                      OGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const BrandCard(
                              showBorder: true,
                            );
                          }),
                    ],
                  ),
                ),

                /// Tabs
                bottom:  OTabBar(
                  tabs:categories.map((category)=>Tab(child: Text(category.name),)).toList()
                ),
              )
            ];
          },

          /// body
          body: TabBarView(
            children:categories.map((category)=>CategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}
