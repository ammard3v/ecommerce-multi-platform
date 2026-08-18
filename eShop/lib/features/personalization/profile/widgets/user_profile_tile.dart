import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsetsGeometry.zero,
      trailing: Icon(Iconsax.edit_24),
      title: Text(
        'AMMar',
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Text(
        'YOUR BEST EXp',
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}