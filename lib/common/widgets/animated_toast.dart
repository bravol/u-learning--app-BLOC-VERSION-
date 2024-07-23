import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

showMaterialSnackBar(
    {required String message,
    required BuildContext context,
    required AnimatedSnackBarType type}) {
  return AnimatedSnackBar.material(
    message,
    type: type,
  ).show(context);
}
