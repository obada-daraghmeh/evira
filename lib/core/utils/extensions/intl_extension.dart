import 'package:flutter/material.dart';

import '../../localization/generated/l10n.dart';

extension IntlExtension on BuildContext {
  FlutterIntl get l10n => FlutterIntl.of(this);

  bool get isAM => DateTime.now().hour < 12;
}
