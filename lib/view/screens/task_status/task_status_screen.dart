import 'package:changin/utils/helper/logger.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/home/task_details_page.dart';
import 'package:changin/view/widgets/home/today_task_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class TaskStatusScreen extends StatefulHookWidget {
  const TaskStatusScreen({super.key});

  @override
  State<TaskStatusScreen> createState() => _TaskStatusScreenState();
}

class _TaskStatusScreenState extends State<TaskStatusScreen>
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
        appBar: AppBar(
          backgroundColor: Style.colors.white,
          elevation: 0,
          leading: const Icon(null),
          leadingWidth: 0.w,
          title: Text(
            'Order Status',
            style: Style.textStyles.poppins(
                color: Style.colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Style.colors.white,
        body: Column(children: <Widget>[
          TabBar(
            dividerColor: Style.colors.primary,
            labelStyle: Style.textStyles.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Style.colors.black),
            unselectedLabelStyle: Style.textStyles
                .poppins(fontWeight: FontWeight.w500, fontSize: 11.sp),
            indicatorWeight: 3,
            indicatorColor: Style.colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding:
                EdgeInsets.symmetric(vertical: 5.sp, horizontal: 15.sp),
            controller: _tabController,
            tabs: const [
              Tab(text: 'Not Started'),
              Tab(text: 'Ongoing'),
              Tab(text: 'Completed'),
            ],
          ),
          SizedBox(height: 1.h),
          SizedBox(
            height: 11.h,
            child: EasyDateTimeLine(
              itemBuilder: (context, dayNumber, dayName, monthName, fullDate,
                  isSelected) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.0.sp),
                  child: Container(
                    height: 15.h,
                    width: 16.w,
                    decoration: Style.customDecoration.buildCustomNotch1(
                        color: isSelected
                            ? Style.colors.primaryfade
                            : Style.colors.grey.withOpacity(.10),
                        radius: 10.sp,
                        borderColor: isSelected
                            ? Style.colors.primary.withOpacity(0.3)
                            : Style.colors.white,
                        fill: true),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text(
                            monthName,
                            style: Style.textStyles.poppins(
                                color: isSelected
                                    ? Style.colors.black
                                    : Style.colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            dayNumber,
                            style: Style.textStyles.poppins(
                                color: isSelected
                                    ? Style.colors.black
                                    : Style.colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                        ]),
                  ),
                );
              },
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                logger.w(selectedDate);
              },
              headerProps: EasyHeaderProps(
                showHeader: false,
                monthStyle: Style.textStyles.poppins(
                    color: Style.colors.primary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600),
                selectedDateStyle: Style.textStyles.poppins(
                    color: Style.colors.primary,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600),
                monthPickerType: MonthPickerType.switcher,
                selectedDateFormat: SelectedDateFormat.fullDateDMY,
              ),
              dayProps: EasyDayProps(
                activeDayNumStyle: Style.textStyles.poppins(
                    color: Style.colors.primary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
                activeDayStrStyle: Style.textStyles.poppins(
                    color: Style.colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w900),
                inactiveDayNumStyle: Style.textStyles.poppins(
                    color: Style.colors.primary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600),
                height: 10.h,
                todayHighlightColor: Style.colors.primary,
                borderColor: Style.colors.primary,
                dayStructure: DayStructure.dayStrDayNum,
                activeDayStyle: DayStyle(
                    decoration: Style.customDecoration.buildBoxDecoration(
                        color: Style.colors.white, radius: 10.sp)),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 5.sp, horizontal: 5.sp),
                      child: GestureDetector(
                          onTap: () {
                            Get.to(() => TaskDetailsPage());
                          },
                          child: TodayTaskCardWidget(
                            containerWidth: 100.w,
                          )));
                },
              ),
            ),
          ),
        ]));
  }
}
