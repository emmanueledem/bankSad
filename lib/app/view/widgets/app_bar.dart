// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:banksync/app/app.dart';
import 'package:banksync/core/core.dart';

class SecondaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: HeaderText(
        title,
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.rambla,
        fontSize: 24,
      ),
      leading: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.black,
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: AppColors.white,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 37),
          child: Icon(
            Icons.notifications_active,
            color: AppColors.black,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size(15, 100);
}

class PrimaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.white,
      centerTitle: false,
      elevation: 0,
      title: HeaderText(
        'Banksad',
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.rambla,
        fontSize: 24,
      ),
    );
  }

  @override
  Size get preferredSize => const Size(15, 100);
}
