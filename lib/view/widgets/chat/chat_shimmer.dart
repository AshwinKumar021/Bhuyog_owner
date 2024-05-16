import 'package:changin/utils/style/style.dart';
import 'package:changin/view/screens/chat/chat_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class UserCard extends HookWidget {
  int index;
  UserCard({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.sp),
      child: ListTile(
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Style.colors.primary,
              radius: 20.sp,
              backgroundImage: const CachedNetworkImageProvider(
                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              ),
            ),
            Positioned(
              bottom: 2.sp,
              left: 29.sp,
              child: Container(
                decoration: Style.customDecoration.buildBoxDecoration(
                    color: index % 2 == 0
                        ? Style.colors.green
                        : Style.colors.error,
                    radius: 25.sp),
                width: 3.w,
                height: 1.3.h,
              ),
            )
          ],
        ),
        title: Text(
          'John Walker',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
        ),
        subtitle: SizedBox(
          width: 22.w,
          child: Text(
            'Hello whats app guys can you do one flavour',
            overflow: TextOverflow.ellipsis,
            style: Style.textStyles.poppins(
                color: Style.colors.grey,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatPage(
              isOnilne: false,
              uId: '',
              userName: 'Sam curran',
              userProfileImg:
                  'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            );
          }));
        },
      ),
    );
  }
}
