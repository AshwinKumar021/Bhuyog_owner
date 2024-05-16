import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/scan/scan_result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/helper/logger.dart';

class ScannerPage extends HookWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isScannedCompleted = useState(false);
    void closeScanner() {
      isScannedCompleted.value = false;
    }

    void launchAppOrPlayStore(String playStoreLink) async {
      if (await canLaunch(playStoreLink)) {
        // App is installed, launch it directly
        await launch(playStoreLink);
      } else {
        // App is not installed, launch Play Store with the link
        try {
          await launch(playStoreLink);
        } catch (error) {
          // Handle any errors that may occur during launch
          print("Error launching Play Store: $error");
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Style.colors.black),
        backgroundColor: Style.colors.primaryfade,
        elevation: 0,
        title: Text(
          'Scanner',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => ScanResultPage(code: 'code', cloaseFunc: () {}));
              },
              icon: Icon(Icons.arrow_forward_outlined))
        ],
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
          SizedBox(height: 2.h),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.sp, horizontal: 30.sp),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
              child: MobileScanner(
                controller: MobileScannerController(
                    returnImage: true,
                    detectionSpeed: DetectionSpeed.noDuplicates),
                onDetect: (capture) {
                  List<Barcode> barcodes = capture.barcodes;
                  Uint8List? image = capture.image;

                  for (var barcode in barcodes) {
                    logger.w(barcode.rawValue);
                  }
                  if (image != null) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: InkWell(
                                onTap: () async {
                                  launchAppOrPlayStore(
                                      barcodes.first.rawValue!);
                                },
                                child: Text('${barcodes.first.rawValue}')),
                            content: Image(image: MemoryImage(image)),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Get.to(() => ScanResultPage(
                                        code: barcodes.first.rawValue!,
                                        cloaseFunc: () {}));
                                  },
                                  child: Text('Print'))
                            ],
                          );
                        });
                  }
                  isScannedCompleted.value = true;
                },
              ),
            ),
          )),
          SizedBox(height: 5.h),
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
