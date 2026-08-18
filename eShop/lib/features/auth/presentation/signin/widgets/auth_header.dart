import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: AppSizes.md),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(
            height: AppSizes.sm,
          ),
          Text(subtitle),
        ],
      ),
    );
  }
}