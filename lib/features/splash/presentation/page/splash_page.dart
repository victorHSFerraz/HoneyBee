import 'package:flutter/material.dart';
import '../../../../core/storage/i_storage.dart';
import 'package:rive/rive.dart';

import '../../../../shared/shared.dart';

class SplashPage extends StatelessWidget {
  final IStorage storage;

  const SplashPage({super.key, required this.storage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.richHoneyGold,
      body: Center(
        child: Column(
          children: [
            const Expanded(
              child: RiveAnimation.asset(
                'assets/rive/bee_blue_sky.riv',
              ),
            ),
            FutureBuilder(
              future: storage.get('token'),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  String? token = snapshot.data;
                  if (token != null) {
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacementNamed(context, '/home');
                    });
                  } else {
                    Future.delayed(const Duration(seconds: 2), () {
                      Navigator.pushReplacementNamed(context, '/login');
                    });
                  }
                }

                return const CustomCircularProgressIndicator(
                  strokeWidth: 3,
                );
              },
            ),
            const SizedBox(height: 30),
            const Column(
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
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
