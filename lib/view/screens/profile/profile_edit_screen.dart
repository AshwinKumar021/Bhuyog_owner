import 'package:changin/utils/helper/logger.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/widgets/textformfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileViewEditPage extends HookWidget {
  final bool isEdit;
  const ProfileViewEditPage({required this.isEdit, super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isEditProfile = useState(isEdit);
    ValueNotifier<bool> hasError = useState(false);

    var _emailController = useTextEditingController();
    var _contactController = useTextEditingController();
    var _locationController = useTextEditingController();
    var _educationController = useTextEditingController();

    return Scaffold(
      backgroundColor: Style.colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(7.h),
        child: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back,
                color: Style.colors.black,
              )),
          leadingWidth: 12.w,
          iconTheme: IconThemeData(color: Style.colors.black),
          backgroundColor: Style.colors.white,
          elevation: 0.5.sp,
          title: Text(
            isEdit ? 'Edit Profile' : 'Profile Information',
            style: Style.textStyles.poppins(
                color: Style.colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Style.colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  SizedBox(width: 5.w),
                  CircleAvatar(
                    radius: 40.sp,
                    backgroundImage: const CachedNetworkImageProvider(
                        'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDJ8fHxlbnwwfHx8fHw%3D'),
                  ),
                  SizedBox(width: 3.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jhonson King',
                        style: Style.textStyles.poppins(
                            color: Style.colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'jhonsonking@gmail.com',
                        style: Style.textStyles.poppins(
                            color: Style.colors.grey,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              !isEditProfile.value
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 35.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'EMAIL ID',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'CONTACT NUMBER',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'JOINED DATE',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'LOCATION',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'EDUCATION',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'CERTIFICATION',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'HANDLING_CLASS',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'PERFORMANCE',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: List.generate(
                                  8,
                                  (index) => Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.sp),
                                            child: Text(
                                              ':',
                                              style: Style.textStyles.poppins(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      )),
                            ),
                          ),
                          SizedBox(
                            width: 40.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'email@gmail.com',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  '8758754870',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  '08 AUG - 2023',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'East Corb',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  'MCA ',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  '3',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Text(
                                  '5',
                                  style: Style.textStyles.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Row(
                                  children: List.generate(
                                    5,
                                    (starIndex) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 0.sp),
                                        child: Icon(
                                          Icons.star,
                                          color: starIndex != 4
                                              ? Style.colors.yellow
                                              : Style.colors.grey
                                                  .withOpacity(0.5),
                                          size: 20.sp,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.symmetric(horizontal: 23.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            'EMAIL_ID',
                            style: Style.textStyles.poppins(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                          CustomTextField(
                              height: true,
                              controller: _emailController,
                              hintText: 'EMAIL_ID',
                              hasError: hasError,
                              isValid: false),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'CONTACT_NUMBER',
                            style: Style.textStyles.poppins(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                          CustomTextField(
                              height: true,
                              controller: _contactController,
                              hintText: 'CONTACT_NUMBER',
                              hasError: hasError,
                              isValid: false),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'LOCATION',
                            style: Style.textStyles.poppins(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                          CustomTextField(
                              height: true,
                              controller: _locationController,
                              hintText: 'LOCATION',
                              hasError: hasError,
                              isValid: false),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            'EDUCATION',
                            style: Style.textStyles.poppins(
                                fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                          CustomTextField(
                              height: true,
                              controller: _educationController,
                              hintText: 'EDUCATION',
                              hasError: hasError,
                              isValid: false),
                        ],
                      ),
                    ),
              SizedBox(
                height: 15.h,
              ),
              isEditProfile.value
                  ? TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Style.colors.primary),
                          fixedSize: MaterialStatePropertyAll(Size(90.w, 6.h))),
                      onPressed: () {
                        logger.i('Submit');
                      },
                      child: Text(
                        'Submit',
                        style: Style.textStyles.poppins(
                          color: Style.colors.white,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
