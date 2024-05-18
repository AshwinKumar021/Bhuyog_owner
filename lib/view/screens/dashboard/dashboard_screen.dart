import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/helper/extensions.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/task_status/task_status_screen.dart';
import 'package:changin/view/screens/chat/chat_list_screen.dart';
import 'package:changin/view/screens/home/home_screen.dart';
import 'package:changin/view/screens/profile/profile_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore_for_file: library_private_types_in_public_api

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    const TaskStatusScreen(),
    const ChatListScreen(),
    const ProfileScreen()
  ];

  int backButtonPressedCounter = 0;
  DateTime? backButtonPressTime;

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (backButtonPressTime == null ||
            DateTime.now().difference(backButtonPressTime!) >
                const Duration(seconds: 2)) {
          Variables.PLEASE_PRESS_BACK_TO_EXIT.showText();

          backButtonPressTime = DateTime.now();
        } else {
          SystemNavigator.pop();
        }
        return false;
      },
      child: Scaffold(
        body: pages[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: Style.textStyles.poppins(
              color: Style.colors.primary,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600),
          iconSize: 20.sp,
          selectedItemColor: Style.colors.black,
          showUnselectedLabels: true,
          unselectedLabelStyle: Style.textStyles
              .poppins(color: Style.colors.primary, fontSize: 11.sp),
          showSelectedLabels: true,
          unselectedItemColor: Style.colors.black,
          backgroundColor: Style.colors.primaryfade,
          currentIndex: pageIndex,
          onTap: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: pageIndex == 0
                  ? bottomIcon(Variables.HOME_ICON, null, true)
                  : bottomIcon(Variables.HOME_ICON, null, false),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: pageIndex == 1
                  ? bottomIcon(Variables.CALENDAR_ICON, null, true)
                  : bottomIcon(Variables.CALENDAR_ICON, null, false),
              label: 'Orders',
            ),
            BottomNavigationBarItem(
              icon: pageIndex == 2
                  ? bottomIcon(Variables.MESSAGE_ICON, null, true)
                  : bottomIcon(Variables.MESSAGE_ICON, null, false),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: pageIndex == 3
                  ? bottomIcon(Variables.USER_ICON, null, true)
                  : bottomIcon(Variables.USER_ICON, null, false),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

Widget bottomIcon(String? Imagepath, Color? clr, bool value) {
  return Padding(
    padding: EdgeInsets.all(3.0.sp),
    child: Container(
      padding: EdgeInsets.all(5.sp),
      decoration: Style.customDecoration.buildBoxDecoration(
          color:
              value ? Style.colors.white : Style.colors.black.withOpacity(.0),
          radius: 40.sp),
      child: Image.asset(
        '$Imagepath',
        height: value ? 3.h : 2.75.h,
        fit: BoxFit.contain,
        width: 7.w,
        color: clr,
      ),
    ),
  );
}
