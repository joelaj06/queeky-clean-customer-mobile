import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/theme/hint_color.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/product/product_response.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/cart/getx/cart_controller.dart';

import '../../../../../core/presentation/theme/secondary_color.dart';
import '../../../../../core/presentation/utils/app_asset_images.dart';
import '../../../../../core/presentation/utils/app_paddings.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loadDependencies();
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Basket (${controller.cartList.length})')),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: _buildCartList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCartList() {
    return Obx(
      () => controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: controller.cartList.length,
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => _buildCartListTile(
                    context,
                    controller.cartList[index],
                  ),
                );
              }),
    );
  }

  Widget _buildCartListTile(BuildContext context, Product product) {
    return Padding(
      padding: AppPaddings.mH.add(AppPaddings.sV),
      child: Container(
        padding: AppPaddings.mH,
        decoration: BoxDecoration(
            border: Border.all(
          color: HintColor.color.shade200,
        )),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
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
                          product.category!.image!,
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
                        _buildCartInputField(product, context),
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
                              product.category!.name,
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
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCartInputField(Product product, BuildContext context) {
    return Row(
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
          child: Text(
            '${product.quantity ?? 0}',
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: AppPaddings.sR,
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
    );
  }
}
