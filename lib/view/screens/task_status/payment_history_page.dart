import 'package:changin/utils/constant/variables.dart';
import 'package:changin/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../widgets/task/payment_history_card_widget.dart';

class PaymentHistoryPage extends StatelessWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.colors.white,
        elevation: 0,
      iconTheme: IconThemeData(color: Style.colors.black),
        title: Text(
          'Payment History',
          style: Style.textStyles.poppins(
              color: Style.colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: ListView.builder(
          itemCount: 13,
          itemBuilder: (context, index) {
            return PaymentHistoryCardWidget(
              amount: '500',
              refId: '23523SERWRQ3242',
              time: '12.37 PM',
              backgroundUrl: Variables.BANK_IMAGE,
            );
          }),
    );
  }
}
