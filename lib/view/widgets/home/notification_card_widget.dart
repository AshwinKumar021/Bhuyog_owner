import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class NotificationCardWidget extends StatelessWidget {
  int index;
  NotificationCardWidget({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      decoration: Style.customDecoration.buildCustomNotch1(
          borderColor: Style.colors.primaryAlt,
          color: Style.colors.white,
          fill: true,
          radius: 10.sp),
      padding: EdgeInsets.symmetric(
        horizontal: 5.sp,
      ),
      child: ListTile(
        leading: Icon(
          index % 2 == 0 ? Icons.check_circle : Icons.flag,
          color: Style.colors.green,
          size: 25.sp,
        ),
        minLeadingWidth: 10.w,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              index % 2 == 0
                  ? 'New Task Assigned!'
                  : index == 1
                      ? 'Add Fencing to the KMCH Hospital'
                      : 'Task Reminder !',
              textAlign: TextAlign.left,
              style: Style.textStyles.poppins(
                  color: Style.colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 0.5.h,
            )
          ],
        ),
        subtitle: SizedBox(
          width: 40.w,
          child: Text(
            index == 0
                ? 'New Task Assigned!'
                : index == 1
                    ? 'Add Fencing to the KMCH Hospital'
                    : 'Task Reminder !',
            textAlign: TextAlign.left,
            style: Style.textStyles.poppins(
                color: Style.colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 9.sp),
          ),
        ),
        trailing: Container(
          decoration: Style.customDecoration.buildCustomNotch1(
              borderColor: Style.colors.primaryLight,
              color: Style.colors.white,
              fill: true,
              radius: 15.sp),
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Text(
            '23 AUG',
            style: Style.textStyles
                .poppins(color: Style.colors.black, fontSize: 10.sp),
          ),
        ),
      ),
    );
  }
}
