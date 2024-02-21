import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:queeky_clean/core/presentation/theme/app_theme.dart';
import 'package:queeky_clean/core/presentation/theme/hint_color.dart';
import 'package:queeky_clean/core/presentation/utils/app_asset_images.dart';
import 'package:queeky_clean/core/presentation/utils/app_paddings.dart';
import 'package:queeky_clean/core/presentation/utils/app_spacing.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/home/getx/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppPaddings.mA,
        child: Column(
          children: <Widget>[
            SizedBox(height: 50, child: _buildUserProfile(context)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildServiceCategories(context),
                    const AppSpacing(
                      v: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Current Orders (3)',
                          style: context.h6,
                        ),
                        TextButton(
                          onPressed: controller.navigateToOrdersScreen,
                          child: const Text('View All'),
                        ),
                      ],
                    ),
                    const AppSpacing(
                      v: 10,
                    ),
                    _buildOrdersPage(context),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOrdersPage(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: AppPaddings.mV,
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
                        colorFilter:
                            const ColorFilter.mode(Colors.white, BlendMode.color),
                        child: Image.asset(
                          AppAssetImages.washingMachine2,
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ),
                  ),
                  const AppSpacing(h: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Order no: #125485',
                        style: context.body2Bold,
                      ),
                      Text(
                        'pending',
                        style: TextStyle(color: context.colors.secondary),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildServiceCategories(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      padding: AppPaddings.lA,
      shrinkWrap: true,
      crossAxisSpacing: 20.0,
      mainAxisSpacing: 40.0,
      childAspectRatio: 1,
      crossAxisCount: _calculateCrossAxisCount(context),
      children: <Widget>[
        _buildCategoryCard(
          context,
          title: 'Washing',
          image: AppAssetImages.washingMachine,
        ),
        _buildCategoryCard(
          context,
          title: 'Steam Press',
          image: AppAssetImages.steamPress,
        ),
        _buildCategoryCard(
          context,
          title: 'Dry Cleaning',
          image: AppAssetImages.cleaningSpray,
        ),
        _buildCategoryCard(
          context,
          title: 'Deep Cleaning',
          image: AppAssetImages.deepClean,
        ),
        _buildCategoryCard(
          context,
          title: 'Formal Wash',
          image: AppAssetImages.cleanClothes,
        ),
        _buildCategoryCard(
          context,
          title: 'Others',
          image: AppAssetImages.brush,
        ),
      ],
    );
  }

  Widget _buildCategoryCard(BuildContext context,
      {required String title, required String image}) {
    return Container(
      padding: AppPaddings.lA,
      height: 120,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: HintColor.color.withOpacity(0.4),
            offset: const Offset(-1, 3),
            blurRadius: 12,
            spreadRadius: -5,
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage(
                  AppAssetImages.bubbles,
                ),
              ),
            ),
            child: Image.asset(
              image,
              height: 80,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: HintColor.color,
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to calculate the number of columns based on the screen width
  int _calculateCrossAxisCount(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return 2;
    } else if (screenWidth < 900) {
      return 3;
    } else {
      return 4;
    }
  }

  Widget _buildUserProfile(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome,',
              style: context.h6,
            ),
            Expanded(
              child: SizedBox(
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'John Doe',
                    style: context.body2.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
        const Text('Tesano - Abeka ')
      ],
    );
  }
}
