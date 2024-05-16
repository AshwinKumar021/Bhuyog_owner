import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/scan/scanner_page.dart';
import 'package:changin/view/widgets/home/notification_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Style.colors.black),
          backgroundColor: Style.colors.primaryfade,
          elevation: 0,
          title: Text(
            'Notification',
            style: Style.textStyles.poppins(
                color: Style.colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            // IconButton(
            //     onPressed: () {
            //       Get.to(() => const ScannerPage());
            //     },
            //     icon: Icon(Icons.arrow_outward_rounded))
          ],
        ),
        backgroundColor: Style.colors.primaryfade,
        body: Column(children: <Widget>[
          SizedBox(height: 1.h),
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
                      child: NotificationCardWidget(index: index));
                },
              ),
            ),
          ),
        ]));
  }
}
