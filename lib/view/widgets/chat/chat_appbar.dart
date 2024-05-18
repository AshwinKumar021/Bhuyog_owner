import 'package:changin/utils/helper/functions.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/widgets/tools/zoom.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomChatAppBar extends StatelessWidget {
  String? userID;
  String? userName;
  String? userProfileImg;
  bool? isOnilne;
  CustomChatAppBar({
    this.userID,
    this.userProfileImg,
    this.userName,
    this.isOnilne,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return AppBar(
        iconTheme: IconThemeData(color: Style.colors.black),
        leadingWidth: 10.w,
        elevation: 0.5.sp,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ZoomableImageWidget(
                    imageUrl:
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                    userName: userName,
                  );
                }));
              },
              child: Hero(
                tag: 'profile_picture',
                child: Container(
                  decoration: Style.customDecoration.buildCustomNotch1(
                      color: Style.colors.white,
                      fill: true,
                      radius: 50.sp,
                      borderColor: Style.colors.white),
                  child: CircleAvatar(
                    backgroundColor: Style.colors.white,
                    radius: 18.sp,
                    backgroundImage: const NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName ?? 'Ashwin',
                  style: Style.textStyles.poppins(
                      fontSize: 15.sp,
                      color: Style.colors.black,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 30.w,
                  child: Stack(
                    children: [
                      Text(
                        isOnilne! ? 'Online' : 'Offline',
                        overflow: TextOverflow.ellipsis,
                        style: Style.textStyles.poppins(
                            color: Style.colors.grey,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      Positioned(
                        bottom: 5.sp,
                        left: 32.sp,
                        child: Container(
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: isOnilne!
                                ? Style.colors.green
                                : Style.colors.error,
                          ),
                          width: 2.w,
                          height: 1.h,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async => await makePhoneCall('+917558193342'),
            icon: Icon(Icons.call, color: Style.colors.black, size: 19.sp),
          ),
          SizedBox(width: 5.w),
        ],
        backgroundColor: Style.colors.white);
  }
}
