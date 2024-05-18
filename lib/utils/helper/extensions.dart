import 'package:bot_toast/bot_toast.dart';
import 'package:changin/utils/style/style.dart';
import 'package:sizer/sizer.dart';


extension StringExtension on String {
  void showText() {
    BotToast.showText(
        contentColor: Style.colors.black,
        textStyle: Style.textStyles.poppins(
          color: Style.colors.white,
          fontSize: 12.sp,
        ),
        text: this);
  }
}