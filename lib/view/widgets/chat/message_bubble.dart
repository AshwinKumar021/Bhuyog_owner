import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../utils/style/style.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.isMe,
    required this.isImage,
  });

  final bool isMe;
  final bool isImage;

  @override
  Widget build(BuildContext context) => Align(
        alignment: isMe ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            color: isMe ? Style.colors.primaryfade : Style.colors.primary,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(10))
                : const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(10),
                    topLeft: Radius.circular(15),
                  ),
          ),
          margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              isImage
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Text(
                      'Hello Boss',
                      style: Style.textStyles.raleWay(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                          color: isMe
                              ? Style.colors.black.withOpacity(0.7)
                              : Style.colors.white),
                    ),
              const SizedBox(height: 5),
              Text(
                timeago.format(DateTime.now()),
                style: Style.textStyles.raleWay(
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.w300,
                    color: isMe
                        ? Style.colors.black.withOpacity(0.7)
                        : Style.colors.white),
              ),
            ],
          ),
        ),
      );
}
