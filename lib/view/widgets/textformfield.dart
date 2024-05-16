import 'package:changin/utils/style/style.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// ignore_for_file: must_be_immutable

class CustomTextField extends HookWidget {
  final String? title;
  final String hintText;
  double? fromTop;
  final VoidCallback? onTap;
  Widget? suffix;
  bool? obscureText;
  ValueNotifier<bool> hasError;
  IconData? icon;
  double? width;
  bool? height;
  final bool? showIcon;
  bool isValid;
  bool? showPrefix;
  bool? ignoreTyping;
  bool? showTitle;
  int? maxLines;
  IconData? leadingIcon;
  Widget? prefix;
  dynamic inputvalue;
  dynamic inputFormat;
  Function(String? data)? onChanged;
  final TextEditingController controller;
  final TextInputType? inputType;
  final String? Function(String?)? validator;
  final GlobalKey<FormState>? formKey;

  CustomTextField({
    required this.controller,
    required this.hintText,
    required this.hasError,
    required this.isValid,
    this.inputFormat,
    this.inputvalue,
    this.prefix,
    this.obscureText,
    this.maxLines,
    this.onTap,
    this.suffix,
    this.ignoreTyping,
    this.leadingIcon,
    this.inputType,
    this.height,
    this.width,
    this.title,
    this.icon,
    this.showIcon,
    this.showPrefix,
    this.showTitle,
    this.fromTop,
    this.validator,
    this.formKey,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> _show =
        useState((showTitle ?? false) || controller.text.isNotEmpty);
    ValueNotifier<bool> _obscure = useState(obscureText ?? false);
    return Padding(
      padding: EdgeInsets.only(
          top: fromTop == null ? 7.sp : fromTop!,
          bottom: hasError.value && !isValid ? 12.sp : 7.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            ignoring: ignoreTyping ?? false,
            child: Container(
              width: width ?? double.infinity,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                readOnly:
                    ignoreTyping == true && inputType != TextInputType.datetime,
                maxLines: obscureText == true ? 1 : maxLines,
                controller: controller,
                keyboardType: inputType ??
                    (maxLines != null && maxLines! > 1
                        ? TextInputType.multiline
                        : TextInputType.text),
                obscureText: _obscure.value,
                cursorColor: Style.colors.primary,
                validator: validator,
                onChanged: onChanged ??
                    (text) {
                      _show.value = controller.text.isNotEmpty;
                    },
                onTap: onTap,
                style: Style.textStyles.poppins(
                  fontSize: 13.sp,
                ),
                inputFormatters: inputFormat,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: height != true
                      ? EdgeInsets.only(left: 15.sp, top: 13.sp, bottom: 13.sp)
                      : EdgeInsets.only(left: 15.sp, top: 8.sp, bottom: 8.sp),
                  prefixIcon: showIcon == false || leadingIcon == null
                      ? null
                      : Icon(
                          leadingIcon,
                          size: 15.sp,
                        ),
                  prefix: showPrefix == true ? prefix : null,
                  filled: true,

                  isDense: true, // Added this
                  fillColor: Style.colors.white,
                  suffixIcon: obscureText == true
                      ? GestureDetector(
                          onTap: () {
                            _obscure.value = !_obscure.value;
                          },
                          child: Icon(
                            _obscure.value
                                ? Icons.remove_red_eye_outlined
                                : LineIcons.eyeSlash,
                            size: 16.sp,
                            color: Style.colors.primary,
                          ),
                        )
                      : suffix,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide: BorderSide(
                      color: Style.colors.primary,
                    ),
                  ),
                  hintStyle: Style.textStyles.poppins(
                    color: Style.colors.grey,
                    fontSize: 12.sp,
                    letterSpacing: 0.35,
                  ),
                  errorStyle: Style.textStyles.poppins(
                    color: Style.colors.error,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide: BorderSide(
                      color: Style.colors.grey.withOpacity(0.8),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide: BorderSide(
                      color: Style.colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide: BorderSide(
                      color: Style.colors.grey,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide: BorderSide(
                      color: Style.colors.grey,
                    ),
                  ),

                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                    borderSide: BorderSide(
                      color: Style.colors.grey,
                    ),
                  ),

                  hintText: hintText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
