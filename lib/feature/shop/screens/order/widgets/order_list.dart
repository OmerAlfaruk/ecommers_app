import 'package:ecommerce/common/widget/custom_shapes/container/rounded_container.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = OHelperFunctions.isDark(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_,__)=>SizedBox(height: OSizes.spaceBtwItems,),
      itemBuilder: (_,__)=>RoundedContainer(
        padding: EdgeInsets.all(OSizes.md),
        showBoarder: true,
        backgroundColor: dark ? OAppColor.dark : OAppColor.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Row 1
            Row(
              children: [
                /// Icon
                Icon(Iconsax.ship),
                SizedBox(
                  width: OSizes.spaceBtwItems / 2,
                ),

                /// status and date
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: OAppColor.primary, fontWeightDelta: 1),
                      ),
                      Text(
                        '15 Jan 2024',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                             ),
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon:Icon( Iconsax.arrow_right,size: OSizes.iconSm,),
                ),
              ],
            ),

          SizedBox(height: OSizes.spaceBtwItems,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      Icon(Iconsax.tag),
                      SizedBox(
                        width: OSizes.spaceBtwItems / 2,
                      ),

                      /// Order and ID
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                         crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                            ),
                            Text(
                              '[12543567]',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                   ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      /// Icon
                      Icon(Iconsax.calendar),
                      SizedBox(
                        width: OSizes.spaceBtwItems / 2,
                      ),

                      /// Shippingdate
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                            ),
                            Text(
                              '17 Jan 2024',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                   ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
