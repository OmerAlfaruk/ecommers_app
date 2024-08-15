import 'package:ecommerce/common/widget/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column
      (
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping Address',buttonTitle: 'change',showActionButton: true,onPressed: (){},)
        ,Text('OM ecommerce',style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: OSizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.phone,color: Colors.grey,size: 16,),
            SizedBox(width: OSizes.spaceBtwItems,),
            Text('+251 943567898',style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        SizedBox(height: OSizes.spaceBtwItems/2,),
        Row(
          children: [
            Icon(Icons.location_history,color: Colors.grey,size: 16,),
            SizedBox(width: OSizes.spaceBtwItems,),
            Expanded(child: Text('Piassa,Addis Ababa,Ethiopia',style: Theme.of(context).textTheme.bodyMedium,softWrap:true,),),

          ],
        ),


      ],
    );
  }
}
