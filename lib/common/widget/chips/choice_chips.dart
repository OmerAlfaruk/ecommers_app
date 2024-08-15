import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../custom_shapes/container/circular_container.dart';

class OChoiceChips extends StatelessWidget {
  const OChoiceChips({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = OHelperFunctions.geColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? OAppColor.white : null),
      avatar: isColor
          ? CircularContainer(
              width: 50,
              height: 50,
              backGroundColor: OHelperFunctions.geColor(text),
            )
          : null,
      shape: isColor ? CircleBorder() : null,
      labelPadding: isColor ? EdgeInsets.all(0) : null,
      //make icon in the center
      padding: isColor ? EdgeInsets.all(0) : null,

      backgroundColor: isColor ? OHelperFunctions.geColor(text) : null,
      selectedColor: isColor ? OHelperFunctions.geColor(text) : null,
    );
  }
}
