import 'package:flutter/material.dart';
class ProductsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProductsAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "All Products",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.mic, color: Colors.white70),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.qr_code_scanner, color: Colors.greenAccent),
          onPressed: () {},
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}