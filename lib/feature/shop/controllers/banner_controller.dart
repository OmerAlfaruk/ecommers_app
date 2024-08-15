import 'package:ecommerce/data/repositories/banners/banners_repository.dart';
import 'package:ecommerce/feature/shop/models/banner_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();


  /// variables
  final carousalCurrentIndex=0.obs;
  final RxBool isLoading = false.obs;
  final RxList<BannerModel> banners=<BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();

  }

  /// Update Page Navigational Dots

 void updatePageIndicator(index){
   carousalCurrentIndex.value=index;
 }

/// Fetch banner
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      // fetch banner
      final bannerRepo=Get.put(BannersRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign banners
      this.banners.assignAll(banners);

    } catch (e) {
      print('Error fetching categories: $e');
      Loader.errorSnackBar(
        title: 'Oh snap',
        message: 'Failed to load categories',
      );
    } finally {
      isLoading.value = false;
    }
  }

}