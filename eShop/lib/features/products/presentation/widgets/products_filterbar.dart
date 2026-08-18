import '../../../../utils/constants/colors.dart';
import 'package:flutter/material.dart';
class ProductsFilterBar extends StatelessWidget {
  const ProductsFilterBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(color: AppColors.white),
              decoration: InputDecoration(
                hintText: 'Search Products',
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: const Color(0xFF121826),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          const SizedBox(width: 8),
          _iconButton(Icons.filter_list, 'Filter'),
          const SizedBox(width: 6),
          _iconButton(Icons.swap_vert, 'Sort'),
          const SizedBox(width: 6),
          _iconButton(Icons.grid_view, 'List'),
        ],
      ),
    );
  }
  Widget _iconButton(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF121826),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.greenAccent),
      ),
    );
  }
}