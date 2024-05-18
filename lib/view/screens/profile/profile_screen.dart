import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/auth/login_screen.dart';
import 'package:changin/view/screens/task_status/payment_history_page.dart';
import 'package:changin/view/screens/profile/profile_edit_screen.dart';
import 'package:changin/view/widgets/loader.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(null),
        leadingWidth: 0.w,
        iconTheme: IconThemeData(color: Style.colors.black),
        backgroundColor: Style.colors.white,
        elevation: 0.5.sp,
        title: Text(
          'Profile',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 2.h),
            Row(
              children: [
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
                    SizedBox(height: 0.5.h),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => ProfileViewEditPage(
                              isEdit: true,
                            ));
                      },
                      child: Row(
                        children: [
                          Text(
                            'Edit Profile',
                            style: Style.textStyles
                                .poppins(decoration: TextDecoration.underline),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Icons.edit,
                            color: Style.colors.black,
                            size: 10.sp,
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 3.h),
            // gradientCardSample(),
            // SizedBox(height: 2.h),
            ListTile(
              onTap: () {
                Get.to(() => ProfileViewEditPage(
                      isEdit: false,
                    ));
              },
              leading: Icon(
                Icons.person,
                color: Style.colors.black,
              ),
              title: Text(
                'Profile Information',
                style: Style.textStyles
                    .poppins(color: Style.colors.black, fontSize: 12.sp),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.sp,
              ),
            ),
            ListTile(
              onTap: () {
                Get.to(() => PaymentHistoryPage());
              },
              leading: Icon(
                Icons.history,
                color: Style.colors.black,
              ),
              title: Text(
                'Payment History',
                style: Style.textStyles
                    .poppins(color: Style.colors.black, fontSize: 12.sp),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.sp,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Style.colors.black,
              ),
              title: Text(
                'Settings',
                style: Style.textStyles
                    .poppins(color: Style.colors.black, fontSize: 12.sp),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.sp,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.feedback,
                color: Style.colors.black,
              ),
              title: Text(
                'Feedback',
                style: Style.textStyles
                    .poppins(color: Style.colors.black, fontSize: 12.sp),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.sp,
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.system_update_tv_rounded,
                color: Style.colors.black,
              ),
              title: Text(
                'Check updates',
                style: Style.textStyles
                    .poppins(color: Style.colors.black, fontSize: 12.sp),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.sp,
              ),
            ),
            ListTile(
              onTap: () {
                CustomLoader.showLoadingDialog(context,
                    message: 'Logging out..');
                Future.delayed(const Duration(seconds: 2), () {
                  Get.offAll(LoginScreen());
                });
              },
              focusColor: Style.colors.primary,
              leading: Icon(
                Icons.power_settings_new_rounded,
                color: Style.colors.black,
              ),
              title: Text(
                'Logout',
                style: Style.textStyles
                    .poppins(color: Style.colors.black, fontSize: 12.sp),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget gradientCardSample() {
  return Container(
    width: 100.w,
    padding: EdgeInsets.symmetric(vertical: 13.sp, horizontal: 5.sp),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 183, 255, 106),
          Color.fromARGB(255, 17, 170, 0),
          Color.fromARGB(255, 255, 107, 107),
          Colors.amber,
          Colors.amber,
        ],
      ),
      borderRadius: BorderRadius.all(Radius.circular(10.sp)),
    ), // Adds a gradient background and rounded corners to the container
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              '05',
              style: Style.textStyles.poppins(
                  color: Style.colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Completed',
              style: Style.textStyles.poppins(
                  color: Style.colors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Container(
          decoration: Style.customDecoration
              .buildBoxDecoration(color: Style.colors.white, radius: 20.sp),
          height: 5.h,
          width: 0.5.w,
        ),
        Column(
          children: [
            Text(
              '05',
              style: Style.textStyles.poppins(
                  color: Style.colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Pending',
              style: Style.textStyles.poppins(
                  color: Style.colors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Container(
          decoration: Style.customDecoration
              .buildBoxDecoration(color: Style.colors.white, radius: 20.sp),
          height: 5.h,
          width: 0.5.w,
        ),
        Column(
          children: [
            Text(
              '05',
              style: Style.textStyles.poppins(
                  color: Style.colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'On Going',
              style: Style.textStyles.poppins(
                  color: Style.colors.white,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        )
      ],
    ),
  );
}
