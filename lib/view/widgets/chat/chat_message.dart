import 'package:changin/view/widgets/chat/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/style/style.dart';

class ChatMessages extends HookWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) => Expanded(
        child: RawScrollbar(
          thumbColor: Style.colors.primary.withOpacity(0.5),
          interactive: true,
          scrollbarOrientation: ScrollbarOrientation.right,
          trackVisibility: true,
          thickness: 3,
          radius: Radius.circular(10.sp),
          child: ListView.builder(
            itemCount: 50,
            padding: EdgeInsets.only(bottom: 10.sp),
            itemBuilder: (context, index) {
              return const MessageBubble(
                isMe: true,
                isImage: false,
              );
            },
          ),
        ),
      );
}
