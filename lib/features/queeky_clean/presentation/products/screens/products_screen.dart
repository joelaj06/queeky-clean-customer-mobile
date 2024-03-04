import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/utils/app_paddings.dart';
import 'package:queeky_clean/core/presentation/utils/app_spacing.dart';
import 'package:queeky_clean/features/queeky_clean/data/models/response/product/product_response.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/products/getx/products_controller.dart';

import '../../../../../core/presentation/utils/app_asset_images.dart';
class ProductsScreen extends GetView<ProductsController> {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? image = ModalRoute.of(context)?.settings.arguments as String?;
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: <Widget>[
              Tab(text: 'Normal',),
              Tab(text: 'Express',),
            ],
          ),
          title: const Text('Select clothes'),
        ),
        body:  TabBarView(
          children: <Widget>[
           _buildNormalServiceList(image!),
            _buildNormalServiceList(image),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNormalServiceList(String image){
    return Padding(
      padding: AppPaddings.mA,
      child: ListView.builder(
        itemCount: controller.products.length,
          itemBuilder: (BuildContext context, int index){
        final Product product = controller.products[index];
        return Row(
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
                  image,
                  height: 50,

                ),
              ),
            ),
            const AppSpacing(h: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(product.name),
                  Text(product.price.toStringAsFixed(2)),
                ],
              ),
            ),
            const AppSpacing(h: 10,),
            InkWell(
              child: Container(
                padding: AppPaddings.mA.add(AppPaddings.mH),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                ),
                child: const Text('Add', style: TextStyle(color: Colors.white,),),
              ),
            )
          ],
        );
      }),
    );
  }
}
