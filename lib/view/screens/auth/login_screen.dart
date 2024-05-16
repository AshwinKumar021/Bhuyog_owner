import 'package:changin/utils/constant/variables.dart';
import 'package:changin/view/screens/auth/mpin_page.dart';
import 'package:changin/view/screens/dashboard/dashboard_screen.dart';
import 'package:changin/view/screens/home/home_screen.dart';
import 'package:changin/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/style/style.dart';
import '../../widgets/auth/auth_bg.dart';
// ignore_for_file: use_build_context_synchronously

class LoginScreen extends HookWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    //Loader
    // var pr = ProgressDialog(
    //   context,
    //   type: ProgressDialogType.normal,
    //   isDismissible: false,
    // );
    // pr.update(
    //   message: 'Please wait..',
    //   progressWidget: Platform.isIOS
    //       ? const CircularProgressIndicator.adaptive()
    //       : ClipRRect(
    //           borderRadius: BorderRadius.all(Radius.circular(10.sp)),
    //           child: Image.asset(
    //             Variables.loaderGif,
    //             width: 20.w,
    //           ),
    //         ),
    //   messageTextStyle:
    //       Style.textStyles.lato(fontSize: 12.sp, color: Style.colors.black),
    // );
    TextEditingController userMobileNumController = useTextEditingController();
    TextEditingController passwordController = useTextEditingController();
    ValueNotifier<bool> hasError = useState(false);
    ValueNotifier<bool> rememberMe = useState(false);
    ValueNotifier<bool> isSubmitted = useState(false);

    Future<void> checkRememberStatus() async {
      // var rememberMobileNum =
      //     await Storage.get(Storage.authBox, Variables.MOBILE_NUMBER);
      // var rememberPassword =
      //     await Storage.get(Storage.authBox, Variables.PASSWORD);

      // if (checkNullOrEmpty(passwordController.text) &&
      //     !checkNullOrEmpty(rememberPassword) &&
      //     rememberPassword is String) {
      //   passwordController.text = rememberPassword;
      //   userMobileNumController.text = rememberMobileNum;
      //   rememberMe.value = true;
      // }
    }

    useEffect(() {
      // signInController.initPlatformState();
      checkRememberStatus();
      return null;
    });

    return AuthBgScreen(
      hideButton: isSubmitted.value,
      title: 'Sign in to Continue',
      buttonText: 'Next',
      bgImage: Variables.LOGIN,
      form: Form(
        key: _formKey,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              CustomTextField(
                  inputType: TextInputType.number,
                  controller: userMobileNumController,
                  hasError: hasError,
                  hintText: 'Mobile number',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Mobile number is required';
                    }
                  },
                  isValid: userMobileNumController.text.isNotEmpty),
             
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: Style.colors.primary,
                    value: rememberMe.value,
                    onChanged: (val) {
                      rememberMe.value = val ?? rememberMe.value;
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      rememberMe.value = !rememberMe.value;
                    },
                    child: Text(
                      'Remember me',
                      style: Style.textStyles.raleWay(
                        color: Colors.amber,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      onSubmit: () async {
        Get.to(() => const MpinPage());

        FocusScope.of(context).unfocus();
        hasError.value = !(_formKey.currentState?.validate() ?? false);
        if (!hasError.value) {
          _formKey.currentState?.save();
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
