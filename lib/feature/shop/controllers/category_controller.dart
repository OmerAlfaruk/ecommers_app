import 'package:ecommerce/data/repositories/category/category_repository.dart';
import 'package:ecommerce/feature/shop/models/category_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final CategoryRepository _categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final categories = await _categoryRepository.getAllCategories();
      if (categories != null && categories.isNotEmpty) {
        allCategories.assignAll(categories);
        featuredCategories.assignAll(
          allCategories
              .where(
                  (category) => category.isFeature && category.parentId.isEmpty)
              .take(8)
              .toList(),
        );
      } else {
        allCategories.clear();
        featuredCategories.clear();
      }
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
