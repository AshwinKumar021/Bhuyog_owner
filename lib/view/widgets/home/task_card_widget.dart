import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class TasksCardWidget extends StatelessWidget {
  int index;
  TasksCardWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: Style.customDecoration.buildCustomNotch1(
          borderColor: Style.colors.primaryAlt,
          color: Style.colors.white,
          fill: true,
          radius: 10.sp),
      padding: EdgeInsets.symmetric(horizontal: 5.sp, vertical: 5.sp),
      child: Column(
        children: [
          ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '07',
                  style: Style.textStyles
                      .poppins(color: Style.colors.black, fontSize: 14.sp),
                ),
                Text(
                  'JUL',
                  style: Style.textStyles.poppins(
                      color: Style.colors.primary,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    index == 0
                        ? 'Clean the Site Entrance and Also clean the Drainage Area'
                        : index == 1
                            ? 'Add Fencing to the KMCH Hospital'
                            : 'Site Cleaning for house warming function',
                    textAlign: TextAlign.left,
                    style: Style.textStyles.poppins(
                        color: Style.colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp)),
              ],
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              size: 10.sp,
              color: Style.colors.black,
            ),
          ),
          // const Divider(),
          Visibility(
            visible: false,
            child: Row(
                children: List.generate(3, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.sp),
                child: Container(
                  decoration: Style.customDecoration.buildCustomNotch1(
                      borderColor: Style.colors.primaryLight,
                      fill: true,
                      color: Style.colors.primaryfade.withOpacity(.5),
                      radius: 5.sp),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.sp, vertical: 3.sp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        index == 0
                            ? Icons.attach_money_rounded
                            : index == 1
                                ? Icons.access_time
                                : Icons.check_circle_outline,
                        color: Style.colors.black,
                        size: 15.sp,
                      ),
                      SizedBox(
                        width: .5.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            index == 0
                                ? '120'
                                : index == 1
                                    ? '3hrs'
                                    : 'Urgent',
                            style: Style.textStyles.poppins(
                                color: Style.colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          // Text(
                          //   index == 0
                          //       ? 'Price'
                          //       : index == 1
                          //           ? 'D/hr'
                          //           : 'Priority',
                          //   style: Style.textStyles
                          //       .poppins(
                          //           color: Style
                          //               .colors.green,
                          //           fontSize: 11.sp,
                          //           fontWeight:
                          //               FontWeight
                          //                   .w500),
                          // )
                        ],
                      )
                    ],
                  ),
                ),
              );
            })),
          ),
        ],
      ),
    );
  }
}
