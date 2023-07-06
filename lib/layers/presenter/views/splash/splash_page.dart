import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../../../shared/shared.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.richHoneyGold,
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: RiveAnimation.asset(
                'assets/rive/bee_blue_sky.riv',
              ),
            ),
            CustomCircularProgressIndicator(
              strokeWidth: 3,
            ),
            SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "honeybee",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                Text(
                  "innertech",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'Quicksand',
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
