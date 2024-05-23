import 'package:cached_network_image/cached_network_image.dart';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/service/add_properties_page.dart';
import 'package:changin/view/screens/booking/add_service_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class MyPropertiesCardWidget extends HookWidget {
  const MyPropertiesCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46.w,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: Variables.LAND,
              height: 15.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 4.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "2- Acre Land",
                    style: Style.textStyles.poppins(
                      fontSize: 12.sp,
                      color: Style.colors.black,
                    ),
                  ),
                  SizedBox(height: .5.h),
                  Text(
                    '@ Kenathukadav bus stop to malumichampatti road...',
                    style: Style.textStyles.poppins(
                      fontSize: 8.sp,
                      color: Style.colors.grey,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      TextButton(
                        style: TextButton.styleFrom(
                          fixedSize: Size(25.w, 0.sp),
                          padding: EdgeInsets.symmetric(
                              vertical: 0.sp, horizontal: 5.sp),
                          backgroundColor: Style.colors.green,
                          foregroundColor: Style.colors.primaryfade,
                        ),
                        child: Text(
                          "BOOK SERVICE",
                          style: Style.textStyles.poppins(
                              fontSize: 9.sp, color: Style.colors.white),
                        ),
                        onPressed: () {
                          Get.to(() => AddServicePage());
                        },
                      ),
                      IconButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Style.colors.grey.withOpacity(0.8))),
                        icon: Icon(
                          Icons.edit,
                          size: 11.sp,
                        ),
                        color: Style.colors.grey,
                        onPressed: () {
                          Get.to(() => AddPropertiesPage(
                                isClass: 2,
                              ));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
