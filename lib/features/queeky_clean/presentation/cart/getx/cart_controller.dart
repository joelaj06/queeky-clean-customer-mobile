import 'dart:convert';

import 'package:get/get.dart';
import 'package:queeky_clean/core/utils/shared_preferences_wrapper.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/product/product_response.dart';

import '../../../../../core/presentation/utils/app_snack.dart';
import '../../../../../core/utils/shared_prefs_keys.dart';

class CartController extends GetxController{


  //reactive variables
  RxList<Product> cartList = <Product>[].obs;
  RxBool isLoading = false.obs;


  final SharedPreferencesWrapper _sharedPreferencesWrapper = Get.find();

  void loadDependencies(){
    print('getting items...');
    getCartItems();

  }

  void getCartItems() async{
    isLoading(true);
    final List<Product>? items = await getPersistedCartItems();
    cartList(items);
    isLoading(false);
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


}