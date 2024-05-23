import 'package:cached_network_image/cached_network_image.dart';
import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/service/add_properties_page.dart';
import 'package:changin/view/screens/booking/add_service_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class PropertyPage extends HookWidget {
  String titleText;
  PropertyPage({required this.titleText, super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isExpaned = useState(true);
    return SafeArea(
      child: Scaffold(
          body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: titleText,
            child: Material(
              child: SizedBox(
                height: 30.h,
                width: 100.w,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: Variables.LAND,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                        top: 8.sp, // Adjust for status bar
                        left: 8.0,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back),
                            color: Colors.white)),
                    Positioned(
                      top: 5.sp,
                      right: 3.sp,
                      child: PopupMenuButton<String>(
                        onSelected: (String result) {
                          switch (result) {
                            case 'Edit':
                              // Handle edit action
                              
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                  'Edit selected',
                                  style: Style.textStyles.poppins(),
                                )),
                              );
                              Get.to(()=> AddPropertiesPage(isClass: 2,));
                              break;
                            case 'Delete':
                              // Handle delete action
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                  'Delete selected',
                                  style: Style.textStyles.poppins(),
                                )),
                              );
                              break;
                          }
                        },
                        iconColor: Style.colors.white,
                        iconSize: 20.sp,
                        padding: const EdgeInsets.all(0),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'Edit',
                            child: Text(
                              'Edit',
                              style: Style.textStyles.poppins(),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Delete',
                            child: Text(
                              'Delete',
                              style: Style.textStyles.poppins(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 1.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20.w,
                height: 0.75.h,
                decoration: Style.customDecoration.buildBoxDecoration(
                    color: Style.colors.grey.withOpacity(0.3.sp),
                    radius: 25.sp),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2.h),
                Text(
                  'R.s.puram, light house road,coimbatore...',
                  overflow: TextOverflow.ellipsis,
                  style: Style.textStyles
                      .poppins(fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 1.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Style.colors.grey,
                      size: 10.sp,
                    ),
                    SizedBox(width: 1.w),
                    Text(
                      'India',
                      style: Style.textStyles
                          .poppins(color: Style.colors.grey, fontSize: 13.sp),
                    )
                  ],
                ),
                !isExpaned.value
                    ? const Divider()
                    : SizedBox(
                        height: 1.h,
                      ),
                ExpansionTile(
                  onExpansionChanged: (value) {
                    isExpaned.value = value;
                  },
                  maintainState: true,
                  initiallyExpanded: true,
                  tilePadding: EdgeInsets.symmetric(),
                  childrenPadding: EdgeInsets.symmetric(),
                  title: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Colors.grey,
                        size: 13.sp,
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        'Service Timeline',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  children: [
                    Card(
                      child: ListTile(
                          leading: const CircleAvatar(
                            backgroundImage:
                                NetworkImage(Variables.PROFILE_IAMGE1),
                          ),
                          title: Text(
                            'Martin',
                            style: Style.textStyles.poppins(),
                          ),
                          subtitle: Text('+91 8870X XXXXX'),
                          trailing:
                              Icon(Icons.badge, color: Style.colors.green)),
                    ),
                    Card(
                      child: ListTile(
                          leading: const CircleAvatar(
                            backgroundImage:
                                NetworkImage(Variables.PROFILE_IAMGE1),
                          ),
                          title: Text(
                            'Martin',
                            style: Style.textStyles.poppins(),
                          ),
                          subtitle: Text('+91 8870X XXXXX'),
                          trailing:
                              Icon(Icons.badge, color: Style.colors.green)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Style.colors.green),
                    fixedSize: MaterialStatePropertyAll(Size(90.w, 5.h))),
                onPressed: () {
                  Get.to(() => AddServicePage());
                },
                child: Builder(builder: (context) {
                  return Text(
                    'Book Serivce',
                    style: Style.textStyles.poppins(
                        color: Style.colors.white,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600),
                  );
                }),
              ),
            ],
          )
        ],
      )),
    );
  }
}
