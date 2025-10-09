import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class FlushbarWidget {
  static void show({
    required BuildContext context,
    required String message,
    required IconData icon,
    Color color = Colors.white,
  }) {
    Flushbar(
      message: message,
      icon: Icon(icon, size: 28.0, color: color),
      duration: const Duration(seconds: 2),
      flushbarPosition: FlushbarPosition.BOTTOM,
      margin: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(8),
    ).show(context);
  }
}
