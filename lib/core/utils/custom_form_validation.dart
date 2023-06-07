import 'package:banksync/core/core.dart';
import 'package:banksync/core/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomFormValidation {
  static Color getColor(
    String? text,
    FocusNode focus,
    String? validationError,
  ) {
    if (focus.hasFocus && text == null) {
      return AppColors.kDanger;
    } else if (focus.hasFocus &&
        text!.isEmpty &&
        validationError != null &&
        validationError.isNotEmpty) {
      return AppColors.kDanger;
    } else if (focus.hasFocus &&
        text!.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primaryColor;
    } else if (text != null &&
        text.isNotEmpty &&
        validationError != null &&
        validationError.isEmpty) {
      return AppColors.primaryColor;
    } else if (validationError != null && validationError.isNotEmpty) {
      return AppColors.kDanger;
    } else {
      return const Color(0xffEBEAED);
    }
  }

  static Color getColorBvn(String? text, FocusNode focus) {
    if (focus.hasFocus && text == null) {
      return const Color.fromRGBO(255, 255, 255, 0.1);
    }
    if (focus.hasFocus && text != null && text.isEmpty) {
      return Colors.redAccent;
    } else if (text != null && text.length != 11) {
      return Colors.redAccent;
    } else if (focus.hasFocus && text != null && text.isNotEmpty) {
      return const Color(0xffEBEAED);
    } else {
      return const Color(0xffEBEAED);
    }
  }

  static String errorEmailMessage(
    String? text,
    String message, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (EmailValidator.validEmail(text) == false) {
      return 'Email must be a valid email address';
    } else {
      return '';
    }
  }

  static String errorMessage(String? text, String message, [String? type]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }

  static String errorMessageUrl(String? text, String message, [String? type]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else {
      final textInput = Uri.parse(text).isAbsolute;
      if (textInput) {
        return '';
      } else {
        return 'Enter a valid url';
      }
    }
  }

  static String errorMessagePassword(
    String? text,
    String message, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 5) {
      return 'Password must have 5 or more characters';
    } else {
      return '';
    }
  }

  static String errorMessageConfirmPassword(
    String? text,
    String message,
    String password, [
    String? type,
  ]) {
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length <= 4) {
      return 'Password must have 5 or more characters';
    } else if (text != password) {
      return 'Confirmation password must match password';
    } else {
      return '';
    }
  }

  static String errorMessageOtp(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasANumber = RegExp('(?=.*?[0-9])');
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 4) {
      return 'OTP must have 4 characters';
    } else if (!hasANumber.hasMatch(text)) {
      return 'OTP must have a number';
    } else {
      return '';
    }
  }

  static String errorMessageOtpSix(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasANumber = RegExp('(?=.*?[0-9])');
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 6) {
      return 'OTP must have 6 characters';
    } else if (!hasANumber.hasMatch(text)) {
      return 'OTP must have a number';
    } else {
      return '';
    }
  }

  static String errorMessageBvn(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasANumber = RegExp('(?=.*?[0-9])');
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 11) {
      return 'BVN must have 11 characters';
    } else if (!hasANumber.hasMatch(text)) {
      return 'BVN must be a number';
    } else {
      return '';
    }
  }

  static String errorMessageNin(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasANumber = RegExp('(?=.*?[0-9])');
    if (text == null) {
      return '';
    } else if (text.isEmpty) {
      return message;
    } else if (text.length != 11) {
      return 'NIN must have 11 characters';
    } else if (!hasANumber.hasMatch(text)) {
      return 'NIN must be a number';
    } else {
      return '';
    }
  }

  static String errorMessageUserName(
    String? text,
    String message, [
    String? type,
  ]) {
    final hasSpace = RegExp('[^A-Za-z0-9_]');
    if (text == null) {
      return '';
    }
    if (hasSpace.hasMatch(text)) {
      return 'Username can contain only letters, numbers and underscores.';
    } else if (text.isEmpty) {
      return message;
    } else {
      return '';
    }
  }
}
