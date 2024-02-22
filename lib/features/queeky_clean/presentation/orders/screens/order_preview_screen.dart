import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/utils/app_asset_images.dart';
import 'package:queeky_clean/core/presentation/utils/app_paddings.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/getx/order_controller.dart';

import '../../../data/models/response/product/product_response.dart';

class OrderPreviewScreen extends GetView<OrderController> {
  const OrderPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: SingleChildScrollView(child: _buildOrderDetailCard(context)),
    );
  }

  Widget _buildOrderDetailCard(BuildContext context) {
    return Container(
      padding: AppPaddings.mH,
      child: Column(
        children: <Widget>[
          Container(
            height: 400, //Todo implement dynamic height for list
            padding: AppPaddings.mA,
            decoration: BoxDecoration(
                color: Colors.white, // context.colors.primary.shade50,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: const Color(0x00b6b6b6).withOpacity(1),
                    offset: const Offset(0, 40),
                    blurRadius: 18,
                    spreadRadius: 2,
                  ),
                ]),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: context.width * 0.25,
                      child: Text(
                        'Qty',
                        style: context.h6.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Item',
                        style: context.h6.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.30,
                      child: Text(
                        'Price(GHS)',
                        textAlign: TextAlign.end,
                        style: context.h6.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 1,color: Colors.black,),
                const Divider( //height: 1,
                  color: Colors.black,),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.order.items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildOrderItemCard(
                        context,
                        controller.order.items[index],
                      );
                    }),
              ],
            ),
          ),
          Stack(children: <Widget>[
            Opacity(
              opacity: 0.2,
              child: Image.asset(
                AppAssetImages.paperCut,
                color: Colors.black,
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Image.asset(
                  AppAssetImages.paperCut,
                  color: Colors.white, // context.colors.primary.shade50,
                ),
              ),
            )
          ]),
        ],
      ),
    );
  }

  Row _buildOrderItemCard(BuildContext context, Product item) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: context.width * 0.25,
          child: Text(
            item.quantity.toString(),
          ),
        ),
        Expanded(
          child: Text(
            item.name,
          ),
        ),
        SizedBox(
          width: context.width * 0.30,
          child: Text(
            item.price.toStringAsFixed(2),
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
