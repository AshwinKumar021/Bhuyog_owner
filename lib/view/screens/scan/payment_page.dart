import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends HookWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    Razorpay? razorpay;
    void errorHandler(PaymentFailureResponse response) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.message!),
        backgroundColor: Colors.red,
      ));
    }

    void successHandler(PaymentSuccessResponse response) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.paymentId!),
        backgroundColor: Colors.green,
      ));
    }

    void externalWalletHandler(ExternalWalletResponse response) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response.walletName!),
        backgroundColor: Colors.green,
      ));
    }

    useEffect(() {
      razorpay = Razorpay();
      razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, errorHandler);
      razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, successHandler);
      razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, externalWalletHandler);
    });

    TextEditingController amountController = useTextEditingController();

    void openCheckout() {
      var options = {
        "key": "rzp_test_nlxpDeD0wYl9p4",
        "amount": num.parse(amountController.text) * 100,
        "name": "test",
        "description": " this is the test payment",
        "timeout": "180",
        "currency": "INR",
        "prefill": {
          "contact": "11111111111",
          "email": "test@abc.com",
        }
      };
      razorpay!.open(options);
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Razor pay")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: amountController,
              decoration: const InputDecoration(
                hintText: "Amount",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            onPressed: () {
              openCheckout();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: Text("Pay now"),
            ),
          ),
        ],
      )),
    );
  }
}
