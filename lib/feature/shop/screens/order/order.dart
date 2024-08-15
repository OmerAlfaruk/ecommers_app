
import 'package:ecommerce/common/widget/appbar/app_bar.dart';
import 'package:ecommerce/feature/shop/screens/order/widgets/order_list.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      /// App bar
      appBar: OAppBar(title: Text('My Orders',style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: Padding(
        padding: EdgeInsets.all(OSizes.defaultSpace),
        /// -- Orders
        child: OrderListItems(),
      ),
    );
  }
}
