import 'package:changin/controller/home_controller.dart';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/helper/logger.dart';
import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TaskDetailsPage extends StatefulHookWidget {
  const TaskDetailsPage({super.key});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  int value = -1;
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());

    ValueNotifier<List<bool>> isChecked = useState([false, false, false]);
    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: isChecked.value.any((element) => element == true)
                ? MaterialStatePropertyAll(Style.colors.green)
                : MaterialStatePropertyAll(Style.colors.grey),
            fixedSize: MaterialStatePropertyAll(Size(90.w, 5.h))),
        onPressed: () {
          Get.back();
        },
        child: Builder(builder: (context) {
          return Text(
            value == 1 ? homeController.timeContoller.value.text : 'DONE',
            style: Style.textStyles.poppins(
                color: Style.colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600),
          );
        }),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Style.colors.black),
        backgroundColor: Style.colors.white,
        elevation: 0.5.sp,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'John Kennedy',
              style: Style.textStyles.poppins(
                  color: Style.colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700),
            ),
            Row(
              children: [
                Image.asset(
                  Variables.CALENDAR_ICON,
                  width: 4.w,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  '26 OCT',
                  style: Style.textStyles
                      .poppins(color: Style.colors.black, fontSize: 10.sp),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Icon(
                  Icons.access_time_sharp,
                  color: Style.colors.brown,
                  size: 11.sp,
                ),
                SizedBox(width: 1.w),
                Text(
                  '07-00 AM - 9.00 Am',
                  overflow: TextOverflow.ellipsis,
                  style: Style.textStyles.poppins(
                    color: Style.colors.black,
                    fontSize: 11.sp,
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Style.colors.black,
            ),
          )
        ],
      ),
      backgroundColor: Style.colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.sp),
        child: ListView(
          children: [
            SizedBox(height: 2.h),
            Text(
              'Property',
              style: Style.textStyles.poppins(
                  color: Style.colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 1.h),
            Container(
              height: 17.h,
              width: 100.w,
              decoration: Style.customDecoration.buildCustomNotchImage(
                  borderColor: Style.colors.grey,
                  color: Style.colors.black,
                  fill: true,
                  image: Variables.LAND,
                  radius: 10.sp),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  'Tasks Details',
                  style: Style.textStyles.poppins(
                      color: Style.colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Container(
              decoration: Style.customDecoration.buildCustomNotch1(
                  borderColor: Style.colors.greyFade,
                  fill: true,
                  color: Style.colors.white,
                  radius: 8.sp),
              padding: EdgeInsets.symmetric(vertical: 5.sp),
              width: 100.w,
              child: Column(
                children: List.generate(
                  3,
                  (index) => CheckboxListTile(
                    activeColor: Style.colors.green,
                    value: isChecked.value[index],
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked.value[index] = value!;
                      });
                    },
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.pix_outlined,
                          color: Style.colors.grey,
                          size: 10.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 5.0.sp),
                          child: SizedBox(
                            width: 60.w,
                            child: Text(
                              'Clean Grass and measure the areas around my site',
                              overflow: TextOverflow.clip,
                              style: Style.textStyles.poppins(
                                color: Style.colors.black,
                                fontSize: 11.sp,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  'Order Details',
                  style: Style.textStyles.poppins(
                      color: Style.colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 0.5.h),
            const Divider(),
            SizedBox(height: 0.5.h),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Start:',
                      style: Style.textStyles.poppins(
                          color: Style.colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '26 Oct, 2024 3:50 pm',
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyles.poppins(
                          color: Style.colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'End (estimated):',
                      style: Style.textStyles.poppins(
                          color: Style.colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '27 Oct, 2024 3:50 pm',
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyles.poppins(
                          color: Style.colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                SizedBox(height: 1.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pay rate:',
                      style: Style.textStyles.poppins(
                          color: Style.colors.black,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '\$52.00',
                      overflow: TextOverflow.ellipsis,
                      style: Style.textStyles.poppins(
                          color: Style.colors.green,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 0.5.h),
            const Divider(),
            SizedBox(height: 0.5.h),
            Row(
              children: [
                Text(
                  'Staff Details',
                  style: Style.textStyles.poppins(
                      color: Style.colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 0.5.h),
            Card(
              child: ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(Variables.PROFILE_IAMGE1),
                  ),
                  title: Text(
                    'Martin',
                    style: Style.textStyles.poppins(),
                  ),
                  subtitle: Text('+91 8870X XXXXX'),
                  trailing: Icon(Icons.badge, color: Style.colors.green)),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.sp, vertical: 5.sp),
                  decoration: Style.customDecoration.buildCustomNotch1(
                      borderColor: Style.colors.primary,
                      color: Style.colors.primary.withOpacity(.1),
                      fill: true,
                      radius: 8.sp),
                  child: Center(
                    child: Text('Check in'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.sp, vertical: 5.sp),
                  decoration: Style.customDecoration.buildCustomNotch1(
                      borderColor: Style.colors.green,
                      color: Style.colors.green.withOpacity(.1),
                      fill: true,
                      radius: 8.sp),
                  child: Center(
                    child: Text('Worked Hr\'s'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.sp, vertical: 5.sp),
                  decoration: Style.customDecoration.buildCustomNotch1(
                      borderColor: Style.colors.error,
                      color: Style.colors.error.withOpacity(.1),
                      fill: true,
                      radius: 8.sp),
                  child: Center(
                    child: Text('Check out'),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.sp, vertical: 5.sp),
                  child: Center(
                    child: Text('07.13 AM'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.sp, vertical: 5.sp),
                  child: Center(
                    child: Text('2 hours'),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.sp, vertical: 5.sp),
                  child: Center(
                    child: Text('09.15 AM'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
