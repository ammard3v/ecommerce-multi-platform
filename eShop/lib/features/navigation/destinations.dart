import 'package:eshop/features/admin/admin_users_manage/presentation/admin_logout.dart';
import 'package:eshop/features/admin/admin_users_manage/presentation/admin_users_manage_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../utils/constants/enums.dart';
import '../admin/admin_profile/admin_profile_screen.dart';
import '../cart/presentation/pages/cart_screen.dart';
import '../chat/chat_screen.dart';
import '../personalization/profile/profile_screen.dart';
import '../shop/home/home_screen.dart';
import '../wishlist/presentation/wishlist_screen.dart';
class NavigationDestinations {
  static final adminPages = [AdminUsersManageScreen(), AdminLogout()];
  static final userPages = [
    HomeScreen(),
    WishlistScreen(),
    CartScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  static final List<Map<String, dynamic>> userIcons = [
    {
      "icon": Iconsax.home,
      "label": "Home",
    },
    {
      "icon": Iconsax.card_receive,
      "label": "Products",
    },
    {
      "icon": Icons.favorite,
      "label": "WishList",
    },
    {
      "icon": Iconsax.shop,
      "label": "Cart",
    },
    {
      "icon": Iconsax.user,
      "label": "Profile",
    },
  ];
  static final adminNavDestinations = [
    GButton(
      icon: Icons.person_2_outlined,
      text: 'Users',
    ),
    GButton(
      icon: Icons.home_outlined,
      text: 'Home',
    ),
  ];
  static final userNavDestinations = [
    GButton(
      icon: Icons.home,
      text: 'Home',
    ),
    GButton(
      icon: Icons.favorite,
      text: 'WishList',
    ),
    GButton(
      icon: Icons.shopping_cart,
      text: 'Cart',
    ),
    GButton(
      icon: Iconsax.message_25,
      text: 'Chat',
    ),
    GButton(
      icon: Icons.person,
      text: 'Profile',
    )
  ];
  static List pagesByRole(UserRole role) {
    return role == UserRole.admin ? adminPages : userPages;
  }
  static List destinationsByRole(UserRole role) {
    return role == UserRole.admin ? adminNavDestinations : userNavDestinations;
  }
}