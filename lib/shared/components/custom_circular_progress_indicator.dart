import 'package:flutter/material.dart';
import 'package:honey_bee/shared/themes/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    this.strokeWidth = 4.0,
  });

  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      width: 22,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: const AlwaysStoppedAnimation<Color>(
          AppColors.cream,
        ),
      ),
    );
  }
}
