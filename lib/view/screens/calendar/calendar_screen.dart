import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/home/task_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Style.colors.primaryfade,
          elevation: 0,   leading: Icon(null),
        leadingWidth: 0.w,
          title: Text(
            'Calendar',
            style: Style.textStyles.poppins(
                color: Style.colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
        backgroundColor: Style.colors.white,
        body: Column(children: <Widget>[
          SizedBox(
            height: 20.h,
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
                            ? Style.colors.primary
                            : Style.colors.white,
                        radius: 10.sp,
                        borderColor: Style.colors.primaryAlt,
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
                                    ? Style.colors.primaryfade
                                    : Style.colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            dayNumber,
                            style: Style.textStyles.poppins(
                                color: isSelected
                                    ? Style.colors.primaryfade
                                    : Style.colors.black,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          const Column(
                            children: [
                              // paymentController
                              //         .schedulePaymentDateList
                              //         .value
                              //         .contains(DateFormat(
                              //                 Variables
                              //                     .TimeDateType)
                              //             .format(
                              //                 fullDate))
                              //     ? Container(
                              //         decoration: Style
                              //             .customDecoration
                              //             .buildBoxDecoration(
                              //                 color: Style
                              //                     .colors
                              //                     .green,
                              //                 radius:
                              //                     25.sp),
                              //         width: 2.w,
                              //         height: 1.h,
                              //       )
                              //     : SizedBox(
                              //         width: 2.w,
                              //         height: 1.h,
                              //       ),
                            ],
                          ),
                        ]),
                  ),
                );
              },
              // disabledDates:
              //     paymentController.dateObjects.value,
              initialDate: DateTime.now(),
              onDateChange: (selectedDate) {
                // choosedDate.value = selectedDate;
                // logger.w(choosedDate.value);
              },

              headerProps: EasyHeaderProps(
                showHeader: true,
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
                    fontWeight: FontWeight.w600),
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

          // paymentController
          //         .paymentActivitylist.value.isEmpty
          //     ? Center(
          //         child: Column(
          //             mainAxisAlignment:
          //                 MainAxisAlignment.center,
          //             children: [
          //               SizedBox(height: 5.h),
          //               CircleAvatar(
          //                 backgroundColor:
          //                     Style.colors.white,
          //                 radius: 70.sp,
          //                 child: Padding(
          //                   padding: EdgeInsets.all(10.sp),
          //                   child: Image.asset(
          //                     Variables.wallet_gif,
          //                     repeat: ImageRepeat.noRepeat,
          //                     filterQuality:
          //                         FilterQuality.medium,
          //                     width: 70.w,
          //                     height: 30.h,
          //                   ),
          //                 ),
          //               ),
          //               SizedBox(
          //                 height: 2.h,
          //               ),
          //               Text('${Variables.NOO} !',
          //                   style: Style.textStyles.poppins(
          //                     color: Style
          //                         .colors.primaryAltDark,
          //                     fontSize: 20.sp,
          //                     fontWeight: FontWeight.w700,
          //                   )),
          //               SizedBox(height: 2.h),
          //               Text(
          //                   '${Variables.PAYMENT_COLLECTION} !',
          //                   style: Style.textStyles.poppins(
          //                     color: Style.colors.black,
          //                     fontSize: 14.sp,
          //                     fontWeight: FontWeight.w600,
          //                   )),
          //             ]),
          //       )
          //     :
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.sp),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=> const TaskDetailsPage());
                      },
                      child: Container(
                        width: 60.w,
                        decoration: Style.customDecoration.buildCustomNotch1(
                            borderColor: Style.colors.primaryAlt,
                            color: Style.colors.white,
                            fill: true,
                            radius: 10.sp),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.sp, vertical: 8.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.filter_list,
                                  color: Style.colors.black.withOpacity(.8),
                                  size: 20.sp,
                                ),
                                const Spacer(),
                                Container(
                                  decoration: Style.customDecoration
                                      .buildCustomNotch1(
                                          borderColor: Style.colors.primaryLight,
                                          color: Style.colors.primaryLight,
                                          fill: true,
                                          radius: 20.sp),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.sp),
                                  child: Text(
                                    'Ongoing',
                                    style: Style.textStyles.poppins(
                                        color: Style.colors.black,
                                        fontSize: 10.sp),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                            SizedBox(
                              width: 80.w,
                              child: Text(
                                'Take site photographs & Clean Grass..',
                                style: Style.textStyles.poppins(
                                    color: Style.colors.black,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const Divider(),
                            SizedBox(
                              height: .5.h,
                            ),
                            Row(
                              children: List.generate(
                                2,
                                (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: 5.sp),
                                    child: Container(
                                      decoration: Style.customDecoration
                                          .buildCustomNotch1(
                                              borderColor:
                                                  Style.colors.primaryLight,
                                              fill: true,
                                              color: Style.colors.primaryfade,
                                              radius: 10.sp),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.sp, vertical: 3.sp),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                          SizedBox(
                                            width: .5.w,
                                          ),
                                          Icon(
                                            Icons.check,
                                            size: 15.sp,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: .5.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ]));
  }
}
