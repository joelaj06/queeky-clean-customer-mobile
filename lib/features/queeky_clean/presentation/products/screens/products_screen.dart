import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/theme/secondary_color.dart';
import 'package:queeky_clean/core/presentation/utils/app_paddings.dart';
import 'package:queeky_clean/core/presentation/utils/app_spacing.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/category/category.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/product/product_response.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/products/getx/products_controller.dart';

import '../../../../../core/presentation/utils/app_asset_images.dart';

class ProductsScreen extends GetView<ProductsController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getCartItems();
    final Category? catArgs =
        ModalRoute.of(context)?.settings.arguments as Category?;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: controller.navigateToCartScreen,
              icon: Badge(
                label: Obx(() => Text(controller.cartList.length.toString())),
                child: const Icon(
                  Iconsax.shopping_cart5,
                ),
              ),
            )
          ],
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(
                text: 'Normal',
              ),
              Tab(
                text: 'Express',
              ),
            ],
          ),
          title: const Text('Select clothes'),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildNormalServiceList(catArgs!),
            _buildNormalServiceList(catArgs),
          ],
        ),
      ),
    );
  }

  Widget _buildNormalServiceList(Category cat) {
    return Padding(
      padding: AppPaddings.mA,
      child: Obx(() =>ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              final Product product = controller.products[index];
              return _buildServiceListTile(cat, product, context);
            }),
      ),
    );
  }

  Widget _buildServiceListTile(
      Category cat, Product product, BuildContext context) {
    return Padding(
      padding: AppPaddings.mV,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: AppPaddings.mV,
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.1,
                image: AssetImage(
                  AppAssetImages.bubbles,
                ),
              ),
            ),
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                cat.image!,
                height: 50,
              ),
            ),
          ),
          const AppSpacing(
            h: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(product.name),
                Text(product.price.toStringAsFixed(2)),
              ],
            ),
          ),
          const AppSpacing(
            h: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Obx(
                () => controller.checkService(product.id).value
                    ? _buildCartInputField(product, context)
                    : Padding(
                      padding: AppPaddings.sR,
                      child: InkWell(
                          onTap: () => controller.addServiceToCart(product, cat),
                          child: Container(
                            padding: AppPaddings.mA.add(AppPaddings.mH),
                            decoration: BoxDecoration(
                              color: context.colors.primary,
                            ),
                            child: const Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ),
              ),
              const AppSpacing(
                v: 10,
              ),
              Padding(
                padding: AppPaddings.sR,
                child: Container(
                  padding: AppPaddings.sA.add(AppPaddings.sH),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: SecondaryColor.color.shade50,
                  ),
                  child: Text(
                    cat.name,
                    style: context.caption.copyWith(
                      color: SecondaryColor.color,
                      fontSize: 10,
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Column _buildCartInputField(Product product, BuildContext context) {
    final Rx<Product> selectedProduct = controller.getProductFromCart(product.id);
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                controller.adjustServiceQuantity(product, isIncrease: false);
              },
              child: Padding(
                padding: AppPaddings.sR,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.primary),
                    borderRadius: BorderRadius.circular(5),
                    // color: PrimaryColor.secBackgroundColor,
                  ),
                  child: Icon(
                    Icons.remove,
                    color: context.colors.primary,
                    size: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 32,
              child: Obx(() =>
                 Text(
                  '${selectedProduct.value.quantity ?? 0}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding:AppPaddings.sR,
              child: InkWell(
                onTap: () {
                  controller.adjustServiceQuantity(
                    product,
                    isIncrease: true,
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: context.colors.primary),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Icon(
                    Icons.add,
                    color: context.colors.primary,
                    size: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Divider(height: 1,)
      ],
    );
  }
}
