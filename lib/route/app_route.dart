import 'package:ecommerce/feature/authentication/screens/login/login_screen.dart';
import 'package:ecommerce/feature/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:ecommerce/feature/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce/feature/authentication/screens/sign_up/signup_screen.dart';
import 'package:ecommerce/feature/authentication/screens/sign_up/verify_email_screen.dart';
import 'package:ecommerce/feature/personalization/screens/address/address.dart';
import 'package:ecommerce/feature/personalization/screens/profile/profile_Screen.dart';
import 'package:ecommerce/feature/personalization/screens/settings/settings.dart';
import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:ecommerce/feature/shop/screens/cart/cart.dart';
import 'package:ecommerce/feature/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/feature/shop/screens/home/home.dart';
import 'package:ecommerce/feature/shop/screens/order/order.dart';
import 'package:ecommerce/feature/shop/screens/product_detail/product_detail.dart';
import 'package:ecommerce/feature/shop/screens/product_review/product_review.dart';
import 'package:ecommerce/feature/shop/screens/store/store.dart';
import 'package:ecommerce/feature/shop/screens/wish_list/wish_list.dart';
import 'package:ecommerce/route/route.dart';
import 'package:get/get.dart';

class AppRoutes{
  static final pages =[
    GetPage(name: ORoutes.home, page: ()=> const HomePage()),
    GetPage(name: ORoutes.store, page: ()=> const StoreScreen()),
    GetPage(name: ORoutes.favorite, page: ()=> const WishList()),
    GetPage(name: ORoutes.settings, page: ()=> const SettingScreen()),
    GetPage(name: ORoutes.productReviews, page: ()=> const ProductReviewScreen()),
   // GetPage(name: ORoutes.productDetail, page: ()=> const ProductDetail(product: ProductModel.empty(),)),
    GetPage(name: ORoutes.order, page: ()=> const OrderScreen()),
    GetPage(name: ORoutes.checkout, page: ()=> const CheckoutScreen()),
    GetPage(name: ORoutes.cart, page: ()=> const CartScreen()),
    GetPage(name: ORoutes.userProfile, page: ()=> const ProfileScreen()),
    GetPage(name: ORoutes.userAddress, page: ()=> const UserAddressScreen()),
    GetPage(name: ORoutes.signup, page: ()=> const SignupScreen()),
    GetPage(name: ORoutes.verifyEmail, page: ()=> const VerifyEmailScreen()),
    GetPage(name: ORoutes.signIn, page: ()=> const LoginScreen()),
    GetPage(name: ORoutes.forgetPassword, page: ()=> const ForgetPassword()),
    GetPage(name: ORoutes.onBoarding, page: ()=> const OnBoardingScreen()),

  ];
}