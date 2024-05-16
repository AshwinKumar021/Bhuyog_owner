import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/helper/logger.dart';
import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ChatTextFormField extends HookWidget {
  const ChatTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: '');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(width: 6.w),
        SizedBox(
          width: 80.w,
          child: TextFormField(
            controller: controller,
            decoration: Style.customDecoration.buildTextfieldDcoration(
                suffIcon: Padding(
                  padding: EdgeInsets.only(right: 8.sp),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_a_photo_outlined,
                        color: Style.colors.grey,
                        size: 23.sp,
                      )),
                ),
                hintext: Variables.MESSAGES),
            keyboardType: TextInputType.text,
            validator: (value) {},
            maxLines: controller.text.length > 10 ? 5 : 1,
            onChanged: (value) {},
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 3.sp),
          child: CircleAvatar(
            radius: 18.sp,
            backgroundColor: Style.colors.primary,
            child: Center(
              child: IconButton(
                onPressed: () {
                  if (controller.text.isNotEmpty) {
                    logger.w(controller.text);
                  }
                  FocusScope.of(context).unfocus();
                },
                icon: Icon(Icons.send_rounded,
                    size: 20.sp, color: Style.colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
