import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/utils/data_formatter.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/orders/getx/order_controller.dart';

import '../../../../../core/presentation/theme/hint_color.dart';
import '../../../../../core/presentation/utils/app_asset_images.dart';
import '../../../../../core/presentation/utils/app_paddings.dart';
import '../../../../../core/presentation/utils/app_spacing.dart';
import '../../../../../core/presentation/widgets/app_text_input.dart';

class OrderScreen extends GetView<OrderController> {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildSearchTextField(context),
            Divider(
              height: 2,
              color: context.colors.primary.shade100,
            ),
            Expanded(
              child: _buildOrdersPage(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersPage(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: AppPaddings.mA,
            child: Container(
              padding: AppPaddings.mA,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: HintColor.color.shade300,
                      offset: const Offset(-1, 3),
                      blurRadius: 12,
                      spreadRadius: -5,
                    )
                  ]),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            blurRadius: 10,
                            color: HintColor.color.shade300,
                            spreadRadius: 3)
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: ColorFiltered(
                        colorFilter: const ColorFilter.mode(
                            Colors.white, BlendMode.color),
                        child: Image.asset(
                          AppAssetImages.washingMachine2,
                          height: 35,
                          width: 35,
                        ),
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
                        Text(
                          'Order no: #ORD-0000$index',
                          style: context.body2Bold,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'pending',
                                style:
                                    TextStyle(color: context.colors.secondary),
                              ),
                              Text(
                                DataFormatter.formatDateAndTimeToStringDigit(
                                  DateTime.now().toIso8601String(),
                                ),
                                style: TextStyle(
                                  color: context.colors.hint.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildSearchTextField(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Platform.isIOS
                ? Icons.arrow_back_ios_new_rounded
                : Icons.arrow_back,
            color: context.colors.hint,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Expanded(
          child: Padding(
            padding: AppPaddings.mA,
            child: Obx(
              () => AppTextInput(
                controller: controller.queryTextEditingController.value,
                hintText: 'Search order',
                onChanged: controller.onProductSearchInputChanged,
                validator: (String value) => null,
                suffixIcon: Obx(
                  () => Visibility(
                    visible: controller.query.isNotEmpty,
                    child: GestureDetector(
                      onTap: controller.clearSearchField,
                      child: Icon(
                        Icons.close_rounded,
                        color: context.colors.primary,
                        size: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(
            Iconsax.calendar5,
            color: context.colors.hint,
            size: 30,
          ),
          onPressed: () {
            showDatePicker(
              context: context,
              firstDate: DateTime(2023),
              lastDate: DateTime(DateTime.now().year),

            );
          },
        ),
      ],
    );
  }
}
