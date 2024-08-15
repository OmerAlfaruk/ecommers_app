
import 'package:ecommerce/data/repositories/product/product_repository.dart';
import 'package:ecommerce/feature/shop/models/enum/enum.dart';
import 'package:ecommerce/feature/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  static ProductController get instance=>Get.find();
  final isLoading=false.obs;
  final  productRepository= Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts=<ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();

  }

  void fetchFeaturedProducts() async{
    try{
      // show loader while loading product
      isLoading.value=true;
      // fetch products
      final products =await productRepository.getFeaturedProducts();
      // Assign Products
      featuredProducts.assignAll(products);
    }
    catch(e){
Loader.errorSnackBar(title: 'Oh snap',message: e.toString());
    }
    finally{
      isLoading.value=false;
    }

  }

  /// Get the product price or price range from variation
  String getProductPrice(ProductModel product){
    double smallestPrice=double.infinity;
    double largestPrice=0.0;

    // If no variation exists return the single price or sale Price

    if (product.productType==ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    }
    else{
      // Calculate the largest and the smallest price among variations

      for(var variation in product.productVariation!){

        // Determine  to consider (sale price if available ,otherwise regular price)

        double priceToConsider=variation.salePrice>0.0 ? variation.salePrice:variation.price;

        // update the smallest and the Largest Price
        if (priceToConsider<smallestPrice){
          smallestPrice=priceToConsider;
        }
        if (priceToConsider>largestPrice){
          largestPrice=priceToConsider;
        }
      }
      // if the smallest and the larges price are the same return a Single price
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      }else{
        // otherwise return the price range
        return "$smallestPrice-\$largestPrice";
      }

    }

  }

  ///--- calculate Discount percentage
  String? calculateSalePercentage(double originalPrice, salePrice){
    if(salePrice==null||salePrice<=0.0)return null;

    if(originalPrice<=0)return null;

    double percentage = ((originalPrice-salePrice)/originalPrice)*100;

    return percentage.toStringAsFixed(0);
  }

  /// check Product Status

String getProductStockStatus(int stock){
    return stock>0? 'In Stock':'Out of Stock';
}
}