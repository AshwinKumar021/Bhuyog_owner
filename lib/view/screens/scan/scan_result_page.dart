import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sizer/sizer.dart';

class ScanResultPage extends StatefulWidget {
  String code;
  Function cloaseFunc;
  ScanResultPage({required this.code, required this.cloaseFunc, super.key});

  @override
  State<ScanResultPage> createState() => _ScanResultPageState();
}

class _ScanResultPageState extends State<ScanResultPage> {
  String qrCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              widget.cloaseFunc();
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(color: Style.colors.black),
        backgroundColor: Style.colors.primaryfade,
        elevation: 0,
        title: Text(
          'Result',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Scan the QR Code',
                textAlign: TextAlign.center,
                style: Style.textStyles.poppins(
                    color: Style.colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          Expanded(child: QrImageView(data: qrCode)),
          SizedBox(height: 1.h),
          TextField(
            onSubmitted: (value) {
              setState(() {
                qrCode = value;
              });
            },
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Scan Automically',
                textAlign: TextAlign.center,
                style: Style.textStyles.poppins(
                    color: Style.colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5.h),
        ],
      ),
    );
  }
}
