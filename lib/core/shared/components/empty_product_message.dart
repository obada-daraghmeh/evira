import 'package:flutter/material.dart';

import '../../constants/assets_const.dart';
import '../../utils/extensions/constants_extension.dart';
import '../../utils/extensions/intl_extension.dart';
import 'empty_message.dart';

class EmptyProductMessage extends StatelessWidget {
  const EmptyProductMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyMessage(
      message: context.l10n.emptyProductMsg,
      icon: AssetsConst.empty,
      iconSize: context.iconSize.xxl * 2,
    );
  }
}
