import 'package:flutter/material.dart';

import 'colors.dart';

class AppFunction {
  static Future<void> pushAndRemove(
    BuildContext context,
    Widget screen,
  ) async {
    await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => screen),
      (route) => false,
    );
  }

  static Future<void> pushTo(
    BuildContext context,
    Widget screen,
  ) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static loadingPage({required context}) => showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => Center(
          child: CircularProgressIndicator(
            color: AppColors.yellowColor,
          ),
        ),
      );
}
