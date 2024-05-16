import 'package:changin/view/widgets/chat/chat_appbar.dart';
import 'package:changin/view/widgets/chat/chat_message.dart';
import 'package:changin/view/widgets/chat/chat_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ChatPage extends HookWidget {
  String? userName;
  String? uId;
  String? userProfileImg;
  bool? isOnilne;

  ChatPage({
    this.userProfileImg,
    this.uId,
    this.userName,
    this.isOnilne,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(7.h),
          child: CustomChatAppBar(
            userID: '123',
            isOnilne: true,
            userName: 'Ashwin',
            userProfileImg:
                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
          ),
        ),
        body: Column(
          children: [
            const ChatMessages(),
            Container(
              height: 70,
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
            )
          ],
        ),
        floatingActionButton: const ChatTextFormField());
  }
}
