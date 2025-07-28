import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppStyles {
  static final ButtonStyle roundedButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary, // ✅ instead of "primary"
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  );
}
