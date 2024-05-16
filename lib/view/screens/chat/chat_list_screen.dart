import 'package:changin/utils/style/style.dart';
import 'package:changin/view/widgets/chat/chat_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Style.colors.black),
        backgroundColor: Style.colors.primaryfade,
        elevation: 0,
        leading: Icon(null),
        leadingWidth: 0.w,
        title: Text(
          'Chats',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return UserCard(
              index: index,
            );
          }),
    );
  }
}
