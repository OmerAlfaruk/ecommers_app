import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/common/widget/product/product/brand_card.dart';
import 'package:ecommerce/common/widget/product/product/sortable/sortable.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OAppBar(title: Text('Nike')),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(OSizes.defaultSpace),
          child: Column(
            children: [
              /// Brand Detail
              BrandCard(showBorder: true),
              SizedBox(
                height: OSizes.spaceBtwSections,
              ),
              SortableProducts()

            ],
          ),
        ),
      ) ,
    );
  }
}
