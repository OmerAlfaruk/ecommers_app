import 'package:ecommerce/feature/shop/models/banner_model.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';

import 'models/category_model.dart';

class DummyData {
  static final List<BannerModel> banners = [
    BannerModel(targetScreen: '', active: false, imageUrl: OImages.banner1),
    BannerModel(targetScreen: '', active: false, imageUrl: OImages.banner2),
    BannerModel(targetScreen: '', active: false, imageUrl: OImages.banner3),
    BannerModel(targetScreen: '', active: false, imageUrl: OImages.banner4),
    BannerModel(targetScreen: '', active: false, imageUrl: OImages.banner5),
    BannerModel(targetScreen: '', active: false, imageUrl: OImages.banner6),
    BannerModel(targetScreen: '', active: false, imageUrl: OImages.banner8),
  ];
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', name: 'Sports', image: OImages.sportIcon, isFeature: true),
    CategoryModel(
        id: '2',
        name: 'Furniture',
        image: OImages.furnitureIcon,
        isFeature: true),
    CategoryModel(
        id: '3',
        name: 'Electronics',
        image: OImages.electronicsIcon,
        isFeature: true),
    CategoryModel(
        id: '4', name: 'Clothes', image: OImages.clothIcon, isFeature: true),
    CategoryModel(
        id: '5', name: 'Animals', image: OImages.animalIcon, isFeature: true),
    CategoryModel(
        id: '6',
        name: 'Cosmetics',
        image: OImages.cosmeticsIcon,
        isFeature: true),
    CategoryModel(
        id: '7',
        name: 'Jewelery',
        image: OImages.jeweleryIcon,
        isFeature: true),
    CategoryModel(
        id: '8', name: 'Shoes', image: OImages.shoeIcon, isFeature: true),

    ///sub_categories

    CategoryModel(
        id: '9',
        name: 'Sports Shoes',
        image: OImages.sportIcon,
        parentId: '1',
        isFeature: false),
    CategoryModel(
        id: '10',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '1',
        isFeature: false),
    CategoryModel(
        id: '11',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '1',
        isFeature: false),
    CategoryModel(
        id: '12',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '5',
        isFeature: false),
    CategoryModel(
        id: '13',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '5',
        isFeature: false),
    CategoryModel(
        id: '14',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '5',
        isFeature: false),
    CategoryModel(
        id: '15',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '2',
        isFeature: false),
    CategoryModel(
        id: '16',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '2',
        isFeature: false),
    CategoryModel(
        id: '17',
        name: 'sports',
        image: OImages.sportIcon,
        parentId: '3',
        isFeature: false),
  ];
}
