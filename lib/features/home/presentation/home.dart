import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:banksync/app/app.dart';
import 'package:banksync/core/core.dart';
import 'package:banksync/features/home/home.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const PrimaryAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38),
          child: Column(
            children: [
              const Gap(37),
              const VirtualCard(),
              const Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextBody(
                    'Recent GateWays',
                    fontSize: 24,
                    color: AppColors.black,
                  ),
                  const Icon(Icons.more_horiz),
                ],
              ),
              const Gap(20),
              GatewaysContainer(
                onpress: () {
                  Navigator.pushNamed(context, RouteName.paystackUserDetails);
                },
                digit: '\$19',
                logoName: AppAssets.paystackLogo,
                name: 'Paystack',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
