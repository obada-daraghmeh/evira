import 'package:flutter/material.dart';

import '../../../../core/constants/assets_const.dart';
import '../../../../core/shared/widgets/custom_icon.dart';
import '../../../../core/utils/extensions/theme_extension.dart';

class RecentListTile extends StatelessWidget {
  final String title;
  const RecentListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: context.textTheme.bodyLarge?.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: IconButton(
        icon: const CustomIcon(icon: AssetsConst.close),
        onPressed: () {},
      ),
      contentPadding: EdgeInsets.zero,
    );
  }
}
