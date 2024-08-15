import 'package:ecommerce/bindings/general_binding.dart';
import 'package:ecommerce/route/app_route.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/themes/theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'feature/authentication/screens/on_boarding/on_boarding_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBindings(),
      debugShowCheckedModeBanner: false,
      theme:OAppTheme.lightTheme,
      darkTheme: OAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      getPages: AppRoutes.pages,
      /// show Loader until Authentication Repository decides to show relevant Screen
      home:  Scaffold(backgroundColor:OAppColor.primary,body: Center(child: CircularProgressIndicator(color: OAppColor.white,),),),
    );
  }
}