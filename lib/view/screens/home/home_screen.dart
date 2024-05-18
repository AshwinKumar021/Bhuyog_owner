import 'package:cached_network_image/cached_network_image.dart';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/view/screens/home/notification_page.dart';
import 'package:changin/view/screens/home/task_details_page.dart';
import 'package:changin/view/screens/service/add_properties_page.dart';
import 'package:changin/view/screens/service/add_service_page.dart';
import 'package:changin/view/screens/service/property_page.dart';
import 'package:changin/view/widgets/home/my_properties_card_widget.dart';
import 'package:changin/view/widgets/home/today_task_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() =>  AddPropertiesPage(isClass: 1,)),
        tooltip: 'Add Properties',
        backgroundColor: Style.colors.black,
        child: Icon(
          Icons.add,
          color: Style.colors.white,
        ),
      ),
      backgroundColor: Style.colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: AppBar(
          backgroundColor: Style.colors.white,
          elevation: 0.5.sp,
          leadingWidth: 0,
          leading: const SizedBox.shrink(),
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.sp),
                child: CircleAvatar(
                  radius: 20.sp,
                  backgroundImage: const CachedNetworkImageProvider(
                      Variables.PROFILE_IAMGE2),
                ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi Ashwin',
                    style: Style.textStyles.poppins(
                      fontSize: 13.sp,
                      color: Style.colors.black,
                    ),
                  ),
                  Text(
                    'Do you need any services? ',
                    style: Style.textStyles.poppins(
                      fontSize: 9.sp,
                      color: Style.colors.black,
                    ),
                  )
                ],
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.sp, top: 5.sp),
              child: CircleAvatar(
                backgroundColor: Style.colors.primaryfade,
                child: IconButton(
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Style.colors.black,
                    size: 18.sp,
                  ),
                  color: Style.colors.black,
                  onPressed: () {
                    Get.to(() => const NotificationPage());
                  },
                ),
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.sp),
        child: DefaultTabController(
          length: 3,
          initialIndex: 1,
          child: ListView(
            children: [
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text(
                    'Book Your Services',
                    style: Style.textStyles.poppins(
                        color: Style.colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                  const Spacer(),
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      4,
                      (index) => GestureDetector(
                            onTap: () {
                              Get.to(() => const AddServicePage());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.sp),
                              child: Column(
                                children: [
                                  Container(
                                    width: 25.w,
                                    height: 7.h,
                                    decoration: Style.customDecoration
                                        .buildCustomNotchImage(
                                            borderColor: Style.colors.grey
                                                .withOpacity(0.4),
                                            color: Style.colors.grey
                                                .withOpacity(0.4),
                                            fill: true,
                                            radius: 10.sp,
                                            image:
                                                Variables.SERVICES_LIST[index]),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Text(
                                    Variables.SERVICES_TITLE_LIST[index],
                                    style: Style.textStyles
                                        .poppins(fontSize: 10.sp),
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Text(
                    'Ongoing Task',
                    style: Style.textStyles.poppins(
                        color: Style.colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.calendar_today,
                    size: 12.sp,
                    color: Style.colors.black,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    '23-AUG 2024',
                    style: Style.textStyles.poppins(
                        color: Style.colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      4,
                      (index) => Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() => const TaskDetailsPage());
                              },
                              child: TodayTaskCardWidget()))),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text(
                    'Your Properties',
                    style: Style.textStyles.poppins(
                        color: Style.colors.black.withOpacity(0.7),
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp),
                  ),
                  const Spacer(),
                  Text(
                    'See All',
                    style: Style.textStyles.poppins(
                        decoration: TextDecoration.underline,
                        color: Style.colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp),
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      Variables.SERVICES_LIST.length,
                      (index) => Padding(
                          padding: EdgeInsets.only(right: 5.sp),
                          child: GestureDetector(
                              onTap: () {
                                Get.to(() =>  PropertyPage(titleText: Variables.SERVICES_LIST[index],));
                              },
                              child: Hero(
                                tag: Variables.SERVICES_LIST[index],
                                child: const MyPropertiesCardWidget())))),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
