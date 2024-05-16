import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/auth/auth_bg.dart';

class MpinPage extends HookWidget {
  const MpinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey();
    ValueNotifier<bool> hasError = useState(false);

    final pinController = TextEditingController();
    final focusNode = FocusNode();
    ValueNotifier<bool> rememberMe = useState(false);
    ValueNotifier<bool> isSubmitted = useState(false);
    const focusedBorderColor = Colors.amber;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: Style.textStyles.poppins(
        fontSize: 22.sp,
        color: Style.colors.black,
      ),
      decoration: Style.customDecoration.buildCustomNotch(
        fill: false,
        color: Style.colors.white,
        radius: 17.sp,
      ),
    );
    return AuthBgScreen(
      bgImage: Variables.LOGIN,
      hideButton: isSubmitted.value,
      title: 'Enter Your Mpin',
      buttonText: 'Next',
      form: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Pinput(
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,errorTextStyle: Style.textStyles.poppins(color: Style.colors.error,fontSize: 15.sp,fontWeight: FontWeight.w700),
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == '2222' ? null : 'Pin is incorrect';
                },
                // onClipboardFound: (value) {
                //   debugPrint('onClipboardFound: $value');
                //   pinController.setText(value);
                // },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                },
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 9),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
              SizedBox(height: 4.h,)
            ],
          ),
        ),
      ),
      onSubmit: () async {
        Get.to(() => const DashboardScreen());

        FocusScope.of(context).unfocus();
        hasError.value = !(_formKey.currentState?.validate() ?? false);
        if (!hasError.value) {
          _formKey.currentState?.save();
          if(pinController.value.text.isNotEmpty){
            Get.to(const DashboardScreen());
          }
          // ConnectivityResult res = await Connectivity().checkConnectivity();
          // bool isConnected = hasInternet(res);
          // if (isConnected) {
          // await pr.show();
          isSubmitted.value = true;
          // await AuthService.signIn(
          //         mobileNumber: userMobileNumController.value.text,
          //         password: passwordController.value.text,
          //         context: context,
          //         rememberPassword: rememberMe.value)
          //     .then((value) async {
          //   // await pr.hide();
          // });
        } else {
          // Variables.NO_INTERNET.showError(context);
        }
        // }
      },
    );
  }
}
