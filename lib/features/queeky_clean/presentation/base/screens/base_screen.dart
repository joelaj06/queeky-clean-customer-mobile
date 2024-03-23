import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/nav/bottom_nav.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/products/getx/products_controller.dart';

import '../../../../../core/presentation/theme/secondary_color.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

int _selectedIndexItem = 0;

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> navBarItemList = <Widget>[];

    for (int i = 0; i < navIcons.length; i++) {
      navBarItemList.add(
        _buildNavIconContainer(context, navIcons[i], i),
      );
    }
    return Scaffold(
      body: SafeArea(child: navPages[_selectedIndexItem]),
      bottomNavigationBar: _buildNavContainer(navBarItemList),
    );
  }

  Widget _buildNavContainer(List<Widget> navBarItemList) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Set the color of the shadow
            spreadRadius: 5, // Set the spread radius of the shadow
            blurRadius: 7, // Set the blur radius of the shadow
            offset: const Offset(0, 3), // Set the offset of the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(children: navBarItemList),
    );
  }

  Widget _buildNavIconContainer(
      BuildContext context, IconData icon, int index) {
    final double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndexItem = index;
        });
      },
      child: Container(
        color: Colors.transparent,
        height: 60,
        width: width / navIcons.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              alignment: index == _selectedIndexItem
                  ? Alignment.center
                  : Alignment.bottomCenter,
              decoration: BoxDecoration(
                  color: index == _selectedIndexItem
                      ? context.colors.primary
                      : Colors.transparent,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
              height: 10,
              width: (width / navIcons.length) * 0.15,
            ),
            GetBuilder<ProductsController>(
                builder: (ProductsController controller) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: index == 1
                    ? Badge(
                        isLabelVisible: true,
                        backgroundColor: SecondaryColor.color.shade900,
                        label: Obx(
                          () =>  Text(
                            controller.cartList.length.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        child: Icon(
                          icon,
                          color: index == _selectedIndexItem
                              ? context.colors.primary.shade300
                              : Colors.grey,
                        ),
                      )
                    : Icon(
                        icon,
                        color: index == _selectedIndexItem
                            ? context.colors.primary.shade300
                            : Colors.grey,
                      ),
              );
            }),
            FittedBox(
              fit: BoxFit.fill,
              child: Text(
                navIconsText[index],
                style: TextStyle(
                  color: index == _selectedIndexItem
                      ? context.colors.primary
                      : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
