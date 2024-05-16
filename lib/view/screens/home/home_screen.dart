import 'package:cached_network_image/cached_network_image.dart';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/view/screens/dashboard/dashboard_screen.dart';
import 'package:changin/view/screens/home/notification_page.dart';
import 'package:changin/view/screens/home/task_details_page.dart';
import 'package:changin/view/widgets/home/task_card_widget.dart';
import 'package:changin/view/widgets/home/today_task_card_widget.dart';
import 'package:changin/view/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../utils/style/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(8.h),
        child: AppBar(
          backgroundColor: Style.colors.white,
          elevation: 0.sp,
          leadingWidth: 0,
          leading: const SizedBox.shrink(),
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.sp),
                child: CircleAvatar(
                  radius: 20.sp,
                  backgroundImage: const CachedNetworkImageProvider(
                      'https://img.freepik.com/free-photo/young-bearded-man-with-striped-shirt_273609-5677.jpg?t=st=1715883719~exp=1715887319~hmac=7ea7a9295b72cc489c60d61d773ac605a80320fa435ac3731b6f415d6da3c3e1&w=740'),
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
              SizedBox(height: 3.h),
              Row(
                children: [
                  Text(
                    'Ongoing Task',
                    style: Style.textStyles.poppins(
                        color: Style.colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp),
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
                              child: const TodayTaskCardWidget()))),
                ),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Text(
                    'All Tasks',
                    style: Style.textStyles.poppins(
                        color: Style.colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp),
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
              TabBar(
                dividerColor: Style.colors.primary,
                labelStyle: Style.textStyles
                    .poppins(fontWeight: FontWeight.w600, fontSize: 12.sp),
                unselectedLabelStyle: Style.textStyles
                    .poppins(fontWeight: FontWeight.w500, fontSize: 11.sp),
                indicator: Style.customDecoration.buildBoxDecoration(
                    color: Style.colors.white, radius: 25.sp),
                indicatorPadding: EdgeInsets.symmetric(vertical: 5.sp),
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Not Started'),
                  Tab(text: 'Ongoing'),
                  Tab(text: 'Completed'),
                ],
              ),
              SizedBox(height: 1.h),
              SizedBox(
                height: 50.h,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    for (int i = 0; i <= 2; i++)
                      Column(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.sp),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => const TaskDetailsPage());
                                  },
                                  child: TasksCardWidget(
                                    index: index,
                                  ),
                                ))),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
