import 'package:banksync/app/app.dart';
import 'package:banksync/core/core.dart';
import 'package:flutter/material.dart';

class VirtualCard extends StatelessWidget {
  const VirtualCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
          color: AppColors.black, borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          Positioned(
            left: 37,
            top: 32,
            child: TextBody(
              '1,200',
              color: AppColors.white,
              fontSize: 24,
            ),
          ),
          Positioned(
              right: 37, top: 32, child: Image.asset(AppAssets.visaLogo)),
          Positioned(
              top: 100,
              left: 37,
              child: TextBody(
                '1234  ****  ****  ****',
                fontSize: 24,
                color: AppColors.white,
              )),
          Positioned(
              top: 166,
              left: 37,
              child: TextRegular(
                'Debit Card',
                fontFamily: AppFonts.rambla,
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              )),
          Positioned(
              top: 166,
              left: 243,
              child: TextRegular(
                '02/24',
                fontFamily: AppFonts.rambla,
                color: AppColors.white,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ))
        ],
      ),
    );
  }
}
