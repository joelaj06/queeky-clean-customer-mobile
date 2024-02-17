import 'package:flutter/cupertino.dart';
import 'package:iconsax/iconsax.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/cart/screens/cart_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/home/screens/home_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/more/screens/more_screen.dart';
import 'package:queeky_clean/features/queeky_clean/presentation/notification/screens/notification_screen.dart';

const List<IconData> navIcons = <IconData>[
  Iconsax.home_21,
  Iconsax.shopping_cart5,
  Iconsax.notification5,
  Iconsax.menu5,
];

const List<String> navIconsText = <String>[
  'Home',
  'Cart',
  'Notification',
  'More'
];

const List<Widget> navPages = <Widget>[
  HomeScreen(),
  CartScreen(),
  NotificationScreen(),
  MoreScreen(),
];
