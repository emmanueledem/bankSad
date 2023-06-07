import 'package:banksync/app/app.dart';
import 'package:banksync/core/core.dart';
import 'package:flutter/material.dart';

class SecondaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SecondaryAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: HeaderText(
        'User Details',
        fontWeight: FontWeight.w400,
        fontFamily: AppFonts.rambla,
        fontSize: 24,
      ),
      leading: const Padding(
        padding: EdgeInsets.only(left: 25),
        child: Icon(
          Icons.arrow_back,
          color: AppColors.black,
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
