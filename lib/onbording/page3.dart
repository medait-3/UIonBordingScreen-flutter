import 'package:flutter/material.dart';

import '../Resources/assets_manager.dart';
import '../Resources/colors_manager.dart';
import '../Resources/dimen_manager.dart';
import '../Resources/strings_manager.dart';
import '../Resources/styles_manager.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.onboarding3),
        SizedBox(
          height: AppMargin.m20,
        ),
        Text(
          AppStrings.onboarding3Title,
          style: getRegularStyle(color: AppColors.black, fontSize: 20),
        ),
        SizedBox(
          height: AppMargin.m16,
        ),
        Text(
          AppStrings.onboarding3SubTitle,
          style: getRegularStyle(fontSize: 15, color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
