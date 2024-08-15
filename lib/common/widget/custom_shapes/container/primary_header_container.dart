
import 'package:ecommerce/common/widget/custom_shapes/container/circular_container.dart';
import 'package:ecommerce/common/widget/custom_shapes/curved_shape/curved_edge_widget.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PrimaryHeaderContainer extends StatelessWidget {
  const PrimaryHeaderContainer({
    super.key, required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CurvedEdgeWidget(
      child: Container(
        color: OAppColor.primary,
        padding: const EdgeInsets.all(0),


        child: Stack(
          children: [
            /// ---Back ground custom shape
            Positioned(
              top: -150,
              right: -250,
              child: CircularContainer(
                backGroundColor: OAppColor.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: CircularContainer(
                backGroundColor: OAppColor.textWhite.withOpacity(0.1),
              ),
            ),
            child,

          ],
        ),
      ),);
  }
}