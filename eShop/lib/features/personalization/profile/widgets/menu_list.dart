import 'package:iconsax/iconsax.dart';
import '../../../../core/routes/route_barel.dart';
final List<Map<String, dynamic>> accountMenu = [
  {
    "icon": Icon(Icons.person),
    "title": "My Profile",
  },
  {
    "icon": Icon(Icons.shopping_bag_outlined),
    "title": "My Orders",
  },
  {
    "icon": Icon(Iconsax.discount_circle),
    "title": "My Coupons",
  },
  {
    "icon": Icon(Icons.info),
    "title": "Help Center",
  },
  {
    "icon": Icon(
      Icons.logout,
      color: Colors.red.shade400,
    ),
    "title": "Log Out",
  },
  {
    "icon": Icon(
      Iconsax.pen_add,
    ),
    "title": "My Reviews",
  }
];
final List<Map<String, dynamic>> prefMenu = [
  {
    "icon": Icon(Icons.location_on),
    "title": "Manage Address",
  },
  {
    "icon": Icon(Iconsax.notification),
    "title": "Notiifications",
  },
  {
    "icon": Icon(Icons.color_lens),
    "title": "Theme",
  },
  {
    "icon": Icon(Icons.settings),
    "title": "Settings",
  }
];