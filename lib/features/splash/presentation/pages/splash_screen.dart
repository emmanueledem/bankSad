import 'package:banksync/app/style/text_style.dart';
import 'package:banksync/app/view/widgets/busy_button.dart';
import 'package:banksync/core/core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashView extends StatefulWidget {
  const SplashView({
    super.key,
  });

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, top: 500),
            child: Column(
              children: [
                TextBold(
                  'Help You Digitize Your Finances',
                  color: AppColors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 48,
                ),
                const Gap(24),
                BusyButton(
                  fontSize: 24,
                  title: 'Get Started',
                  onpress: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RouteName.home, (Route<dynamic> route) => false);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
