import 'package:banksync/core/core.dart';
import 'package:flutter/cupertino.dart';

class BusyButton extends StatefulWidget {
  const BusyButton({
    Key? key,
    this.deactivate = false,
    required this.title,
    required this.onpress,
    this.width,
    this.height,
    this.loading = false,
    this.fontSize = 16,
  }) : super(key: key);
  final String title;
  final bool? deactivate;
  final bool loading;

  final VoidCallback onpress;
  final double? width;
  final double? height;
  final double fontSize;
  @override
  State<BusyButton> createState() => _BusyButtonState();
}

class _BusyButtonState extends State<BusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.deactivate == true ? null : widget.onpress,
      child: Container(
        height: 100,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: widget.deactivate == true
              ? AppColors.deactivatedBtn
              : AppColors.green,
          borderRadius: BorderRadius.circular(
            30,
          ),
        ),
        child: Center(
          child: widget.loading
              ? const CupertinoActivityIndicator()
              : Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    color: AppColors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.rambla,
                  ),
                ),
        ),
      ),
    );
  }
}

class SecondaryBusyButton extends StatefulWidget {
  const SecondaryBusyButton({
    Key? key,
    required this.title,
    required this.onpress,
    this.width,
    this.borderColor = AppColors.primaryColor,
    this.textColor = AppColors.primaryColor,
    this.deactivate = false,
    this.loading = false,
  }) : super(key: key);
  final String title;

  final VoidCallback onpress;
  final double? width;
  final Color borderColor;
  final Color textColor;
  final bool? deactivate;
  final bool loading;

  @override
  State<SecondaryBusyButton> createState() => _SecondaryBusyButtonState();
}

class _SecondaryBusyButtonState extends State<SecondaryBusyButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onpress,
      child: Container(
        height: 51,
        width: widget.width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            88.77,
          ),
          border: Border.all(
            color: widget.deactivate == false
                ? widget.borderColor
                : AppColors.deactivatedColor,
          ),
        ),
        child: Center(
          child: widget.loading
              ? const CupertinoActivityIndicator()
              : Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    color: widget.deactivate == false
                        ? widget.textColor
                        : AppColors.deactivatedColor,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.rambla,
                  ),
                ),
        ),
      ),
    );
  }
}
