import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/circular_icon/circular_icon.dart';
import 'package:ecommerce/common/widget/layout/grid_view.dart';
import 'package:ecommerce/common/widget/product/product/product_cards/product_card_vertical.dart';
import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:ecommerce/feature/shop/screens/home/home.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: OAppBar(
        title: Text('Wishlist',style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          CircularIcon( icon: Icons.add,onPressed: ()=>Get.to(()=>const HomePage()),),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              OGridLayout(itemCount: 6, itemBuilder: (_,index)=>ProductCardVertical(product: ProductModel.empty()))
            ],
          ),
        ),
      ),
    );
  }
}
