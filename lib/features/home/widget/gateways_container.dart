import 'package:banksync/app/app.dart';
import 'package:banksync/core/core.dart';
import 'package:flutter/material.dart';

class GatewaysContainer extends StatelessWidget {
  const GatewaysContainer(
      {Key? key,
      required this.name,
      required this.digit,
      required this.logoName,
      required this.onpress})
      : super(key: key);
  final VoidCallback onpress;
  final String name;
  final String digit;
  final String logoName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: double.infinity,
          height: 75,
          decoration: BoxDecoration(
              color: AppColors.gateWayColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 9, top: 20, right: 9, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  logoName,
                  width: 130,
                ),
                TextRegular(
                  name,
                  fontSize: 20,
                  fontFamily: AppFonts.rambla,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                TextRegular(
                  digit,
                  fontSize: 20,
                  fontFamily: AppFonts.rambla,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
