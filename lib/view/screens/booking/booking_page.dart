import 'package:cached_network_image/cached_network_image.dart';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/helper/logger.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/booking/add_service_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class BookingPage extends StatefulHookWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<int>> selectServiceIndices = useState([]);
    return Scaffold(
        bottomNavigationBar: selectServiceIndices.value.isNotEmpty
            ? BottomAppBar(
                color: Colors.white,
                child: Container(
                  width: 100.w,
                  height: 10.h,
                  color: Style.colors.white,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.black),
                              fixedSize:
                                  MaterialStatePropertyAll(Size(100.w, 6.h))),
                          onPressed: () {
                            Get.to(() => const AddServicePage());
                          },
                          child: Text(
                            'Next',
                            style: Style.textStyles.poppins(
                                color: Style.colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Style.colors.black),
          backgroundColor: Style.colors.white,
          elevation: 0,
          title: Text(
            'Book Your Services',
            style: Style.textStyles.poppins(
                color: Style.colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            selectServiceIndices.value.isNotEmpty
                ? IconButton(
                    onPressed: () => setState(() {
                          selectServiceIndices.value.clear();
                        }),
                    icon: Icon(
                      Icons.cancel_presentation_sharp,
                      size: 18.sp,
                    ))
                : const SizedBox.shrink()
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 10.h,
                  mainAxisSpacing: 10.sp,
                  crossAxisSpacing: 5.sp),
              physics: const BouncingScrollPhysics(),
              itemCount: Variables.ALL_SERVICES_LIST.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 2.sp, horizontal: 2.sp),
                  child: InkWell(
                    onTap: () {
                      bool val = selectServiceIndices.value
                          .any((element) => (element == index));
                      if (!val) {
                        selectServiceIndices.value.add(index);
                      } else {
                        selectServiceIndices.value.remove(index);
                      }
                      setState(() {});
                      logger.w(selectServiceIndices.value.toList());
                    },
                    child: Container(
                      height: 4.h,
                      width: 30.w,
                      decoration: Style.customDecoration.buildCustomNotch1(
                          color: Style.colors.primaryfade.withOpacity(.3),
                          borderColor: selectServiceIndices.value
                                  .any((element) => (element == index))
                              ? Style.colors.green.withOpacity(.5)
                              : Style.colors.grey.withOpacity(0.2),
                          fill: true,
                          radius: 5.sp),
                      child: Row(children: [
                        Container(
                            height: 10.h,
                            width: 17.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4.sp)),
                                color: Style.colors.error,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: CachedNetworkImageProvider(
                                    Variables.ALL_SERVICES_LIST[index],
                                  ),
                                ))),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(Variables.All_SERVICES_TITLE_LIST[index],
                            style: Style.textStyles.poppins(
                                color: Style.colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500))
                      ]),
                    ),
                  ),
                );
              }),
        ));
  }
}
