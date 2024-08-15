import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/widget/loader/animation_loader.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: OHelperFunctions.isDark(Get.context!)
              ? OAppColor.dark
              : OAppColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              AnimationLoaderWidget(
                text: text,
                animation: animation,
              )
            ],
          ),
        ),
      ),
    );

  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}
