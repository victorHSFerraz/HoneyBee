import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:honey_bee/shared/components/custom_circular_progress_indicator.dart';
import 'package:honey_bee/shared/themes/app_colors.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'loading',
              style: TextStyle(
                color: AppColors.cream,
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            SizedBox(height: 30),
            CustomCircularProgressIndicator(
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
