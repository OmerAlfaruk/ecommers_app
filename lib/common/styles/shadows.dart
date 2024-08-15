import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class ShadowStyle{
  static final verticalProductShadow=BoxShadow(
    color: OAppColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset:  const Offset(0,2)
  );
  static final horizontalProductShadow=BoxShadow(
    color: OAppColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset:  const Offset(0,2)
  );
}