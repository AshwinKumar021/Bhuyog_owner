import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class PaymentHistoryCardWidget extends HookWidget {
  final String amount;
  final String time;
  final String refId;
  final String backgroundUrl;

  PaymentHistoryCardWidget({
    Key? key,
    required this.amount,
    required this.time,
    required this.refId,
    required this.backgroundUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage(Variables.BANK_IMAGE),
          ),
          title: Text(
            'Shifting , Site Cleaning..',
            style: Style.textStyles
                .poppins(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          subtitle: Text('Rs. 2,300/-', style: Style.textStyles.poppins()),
          trailing: Icon(Icons.check_circle, color: Style.colors.green)),
    );
  }
}
