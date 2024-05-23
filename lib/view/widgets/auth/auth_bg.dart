import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class AuthBgScreen extends StatelessWidget {
  final String title;
  final String bgImage;
  final String buttonText;
  final Widget form;
  final bool hideButton;
  final void Function()? onSubmit;
  // ignore: use_super_parameters
  const AuthBgScreen(
      {required this.title,
      required this.buttonText,
      required this.bgImage,
      required this.form,
      required this.onSubmit,
      required this.hideButton,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Style.colors.white,
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 3.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(right: 20.sp, top: 10.sp),
              //       child: Container(
              //         height: 10.h,
              //         width: 50.w,
              //         decoration: Style.customDecoration.buildCustomlogo(Variables.APP_LOGO),
              //       ),
              //     )
              //   ],
              // ),

              Image.asset(
                bgImage,
                width: 100.w,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.w,
                  right: 8.w,
                  top: 0.h,
                  bottom: 15.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Style.textStyles.poppins(
                        fontSize: 20.sp,
                        color: Style.colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    form,
                    SizedBox(
                      height: 8.h,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.black),
                            fixedSize:
                                MaterialStatePropertyAll(Size(100.w, 6.h))),
                        onPressed: onSubmit,
                        child: Text(buttonText))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
