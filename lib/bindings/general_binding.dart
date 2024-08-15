import 'package:ecommerce/feature/authentication/controllers/signup/signup_controller.dart';
import 'package:ecommerce/utils/connection/connectivity_manager.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(SignupController());
  }

}