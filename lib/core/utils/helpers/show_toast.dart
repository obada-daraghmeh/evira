import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../constants/assets_const.dart';
import '../../shared/widgets/custom_icon.dart';

class ShowToast {
  static void _showToast({
    String? title,
    required String message,
    required ToastificationType type,
  }) {
    // toastification.dismissAll();
    toastification.show(
      title: title != null ? Text(title) : null,
      description: Text(message),
      type: type,
      autoCloseDuration: const Duration(seconds: 5),
      style: ToastificationStyle.minimal,
      alignment: Alignment.bottomLeft,
      icon: _getIcon(type: type),
      showProgressBar: true,
    );
  }

  static void showErrorToast({String? title, required String message}) {
    _showToast(title: title, message: message, type: ToastificationType.error);
  }

  static void showSuccessToast({String? title, required String message}) {
    _showToast(
      title: title,
      message: message,
      type: ToastificationType.success,
    );
  }

  static Widget _getIcon({required ToastificationType type}) {
    return type == ToastificationType.error
        ? CustomIcon(icon: AssetsConst.closeBold, customColor: Colors.red)
        : CustomIcon(
            icon: AssetsConst.checkInSquareBold,
            customColor: Colors.green,
          );
  }
}
