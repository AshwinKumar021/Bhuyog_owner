import 'dart:io';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomLoader {
  CustomLoader._();

  static Future<void> showLoadingDialog(context, {String? message}) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.sp)),
          backgroundColor: Colors.white,
          content: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Platform.isIOS
                  ? const CircularProgressIndicator.adaptive()
                  : Image.asset(
                      Variables.LOGOUT,
                      width: 20.w,
                    ),
              SizedBox(
                width: 15.sp,
              ),
              SizedBox(
                width: 30.w,
                child: Text(
                  message ?? 'Please wait...',
                  style: Style.textStyles.poppins(
                    fontSize: 12.sp,
                    color: Style.colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
