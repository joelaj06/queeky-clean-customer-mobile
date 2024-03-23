import 'dart:convert';

import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/routes/app_routes.dart';
import 'package:queeky_clean/core/presentation/utils/app_snack.dart';
import 'package:queeky_clean/core/utils/shared_preferences_wrapper.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/category/category.dart';

import '../../../../../core/utils/shared_prefs_keys.dart';
import '../../../data/models/response/product/product_response.dart';

class ProductsController extends GetxController {
  //reactive variables
  RxList<Product> cartList = <Product>[].obs;

  final SharedPreferencesWrapper _sharedPreferencesWrapper = Get.find();


  @override
  void onInit() {
   getCartItems();
    super.onInit();
  }

  void navigateToCartScreen(){
    Get.toNamed(AppRoutes.cart,);
  }
  void getCartItems() async {
    final List<Product>? items = await getPersistedCartItems();
    cartList(items);
  }

  Future<List<Product>?> getPersistedCartItems() async {
    final List<String>? productListString =
    await _sharedPreferencesWrapper.getStringList(SharedPrefsKeys.cart);

    if (productListString != null) {
      final List<Product> prods = productListString
          .map((String prod) => Product.fromJson(json.decode(prod)))
          .toList();
      return prods;
    }
    return null;
  }

  void addServiceToCart(Product prod, Category category,) {
    final Product product = Product(
      id: prod.id,
      name: prod.name,
      price: prod.price,
      quantity: 1,
      category: category,
    );
    cartList.add(product);
    persistCartItems(cartList);
    AppSnack.show(title: 'Basket', message: 'Item added to basket');
  }

  void adjustServiceQuantity(Product prod,{required bool isIncrease}){
    Product result = cartList.firstWhere((Product el) => el.id == prod.id,
    orElse: () => Product.empty(),);

    if(result.id.isNotEmpty && !isIncrease && result.quantity == 1){
      cartList.remove(result);
      persistCartItems(cartList);
    }else{
      if(result.id.isNotEmpty){
        if(isIncrease) {
          result = result.copyWith(quantity: result.quantity!+1);
        }else{
          result = result.copyWith(quantity: result.quantity!-1);
        }
        final int index = cartList.indexOf(cartList
            .firstWhere((Product element) => element.id == result.id));
        cartList[index] = result;
        persistCartItems(cartList);
        AppSnack.show(title: 'Basket', message: 'Basket updated successfully');
      }
    }

  }

  void persistCartItems(List<Product> list) async {
    final List<String> productListString =
        list.map((Product product) => jsonEncode(product.toJson())).toList();
    await _sharedPreferencesWrapper.setStringList(
      SharedPrefsKeys.cart,
      productListString,
    );
  }

  RxBool checkService(String productId){
    final Product prod = getProductFromCart(productId).value;
    if(prod.id.isNotEmpty){
      return true.obs;
    }return false.obs;
  }

  Rx<Product>  getProductFromCart(String productId) =>cartList.firstWhere((Product el) =>el.id == productId,
    orElse: () => Product.empty(),).obs;



  final RxList<Product> products = <Product>[
    const Product(
        id: '1',
        name: 'Summer Breeze Maxi Dress ',
        price: 49.99,
        description:
            'Flowy and comfortable maxi dress perfect for summer days.'),
    const Product(
        id: '2',
        name: 'Elegant Evening Gown',
        price: 129.99,
        description:
            'A stunning gown for special evening events and occasions.'),
    const Product(
        id: '3',
        name: 'Casual Striped Shirt Dress',
        price: 34.99,
        description: 'Versatile shirt dress with a stylish striped pattern.'),
    const Product(
        id: '4',
        name: 'Chic Little Black Dress',
        price: 69.99,
        description:
            'A timeless classic, perfect for various events and parties.'),
    const Product(
        id: '5',
        name: 'Bohemian Floral Midi Dress',
        price: 54.99,
        description:
            'Midi dress with a bohemian floral design, great for a casual day out.'),
    const Product(
        id: '6',
        name: 'Sporty Tank Dress',
        price: 29.99,
        description:
            'Comfortable and sporty tank dress for an active lifestyle.'),
    const Product(
        id: '7',
        name: 'Vintage Lace Cocktail Dress',
        price: 79.99,
        description: 'Elegant lace cocktail dress with a vintage touch.'),
    const Product(
        id: '8',
        name: 'Denim Overall Dress',
        price: 44.99,
        description: 'Trendy overall dress made from durable denim fabric.'),
    const Product(
        id: '9',
        name: 'Sweater Knit Turtleneck Dress',
        price: 39.99,
        description:
            'Cozy turtleneck dress made from soft sweater knit material.'),
    const Product(
        id: '10',
        name: 'Flirty Wrap Dress',
        price: 59.99,
        description: 'Flattering wrap dress with a playful and flirty design.'),
  ].obs;
}
