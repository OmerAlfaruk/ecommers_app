import 'package:ecommerce/common/widget/shimmer/shimmer.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class CategoryShimmer extends StatelessWidget{
  final int itemCount;

  const CategoryShimmer({super.key, this.itemCount=6});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_,__){
        return const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Image
            OShimmerEffect(width:55,height:55,radius:55),
            SizedBox(height: OSizes.spaceBtwItems/2,),
            /// Text
            OShimmerEffect(width:55,height:8),
          ],
        );
      }, separatorBuilder: (_,__)=>SizedBox(width: OSizes.spaceBtwItems,), itemCount: itemCount),
    );
  }

}