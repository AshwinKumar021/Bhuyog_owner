import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class TodayTaskCardWidget extends HookWidget {
  const TodayTaskCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 85.w,
      decoration: Style.customDecoration.buildCustomNotch1(
          borderColor: Style.colors.primaryAlt,
          color: Style.colors.white,
          fill: true,
          radius: 10.sp),
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 8.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 6.h,
                width: 15.w,
                decoration:
                    Style.customDecoration.buildCustomlogo(Variables.LAND),
              ),
              SizedBox(
                width: 2.w,
              ),
              SizedBox(
                width: 45.w,
                child: Column(
                  children: [
                    Text(
                      'Take site photographs & Clean Grass..',
                      style: Style.textStyles.poppins(
                          color: Style.colors.black,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 1.w,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Style.colors.error,
                          size: 15.sp,
                        ),
                        SizedBox(width: 1.w),
                        SizedBox(
                          width: 35.w,
                          child: Text(
                            'Vedapatti, Siruvani road.',
                            overflow: TextOverflow.ellipsis,
                            style: Style.textStyles.poppins(
                              color: Style.colors.grey,
                              fontSize: 9.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: Style.customDecoration.buildCustomNotch1(
                    borderColor: Style.colors.primaryLight,
                    color: Style.colors.primaryLight,
                    fill: true,
                    radius: 20.sp),
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Text(
                  'Pending',
                  style: Style.textStyles
                      .poppins(color: Style.colors.black, fontSize: 9.sp),
                ),
              )
            ],
          ),
          SizedBox(height: 1.h),
          const Divider(),
          Row(
            children: [
              Icon(
                Icons.access_time_sharp,
                color: Style.colors.brown,
                size: 13.sp,
              ),
              SizedBox(width: 1.w),
              Text(
                '07-00 AM - 9.00 Am',
                overflow: TextOverflow.ellipsis,
                style: Style.textStyles.poppins(
                  color: Style.colors.grey,
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(width: 2.w),
              Icon(
                Icons.person_2_outlined,
                color: Style.colors.brown,
                size: 13.sp,
              ),
              SizedBox(width: 1.w),
              Text(
                '3',
                overflow: TextOverflow.ellipsis,
                style: Style.textStyles.poppins(
                  color: Style.colors.grey,
                  fontSize: 11.sp,
                ),
              ),
              SizedBox(width: 2.w),
              Icon(
                Icons.wallet,
                color: Style.colors.brown,
                size: 13.sp,
              ),
              SizedBox(width: 1.w),
              Text(
                'Rs.2,500',
                overflow: TextOverflow.ellipsis,
                style: Style.textStyles.poppins(
                  color: Style.colors.grey,
                  fontSize: 11.sp,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Style.colors.black,
                size: 14.sp,
              )
            ],
          ),
        ],
      ),
    );
  }
}
