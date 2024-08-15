import 'package:flutter/material.dart';

import '../../../../../common/widget/product/cart/add_and_remove.dart';
import '../../../../../common/widget/product/cart/cart_item.dart';
import '../../../../../common/widget/product/product/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';
class OCartItems extends StatelessWidget {
  const OCartItems({
    super.key,  this.showAddRemoveButton=true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(
        height: OSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [

          CartItem(),
          if(showAddRemoveButton) SizedBox(height: OSizes.spaceBtwItems,),
          if(showAddRemoveButton)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  ProductQuantityWithAddAndRemoveButton(),
                ],
              ),
              ProductPriceText(price: '256'),
            ],
          )
        ],
      ),
    );
  }
}

