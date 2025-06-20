import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';
import 'package:logger/logger.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final Logger _logger = Logger();
  TextEditingController amountController = TextEditingController();
  String? error;
  PaymentConfig? paymentConfig;

  void onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          _logger.i('Payment successful');
          break;
        case PaymentStatus.failed:
          _logger.e('Payment failed');
          break;
        default:
          _logger.w('Unhandled status: ${result.status}');
      }
    } else {
      _logger.e('Unknown result type');
    }
  }

  void _preparePaymentConfig() {
    final amountText = amountController.text;

    if (amountText.isEmpty) {
      setState(() {
        error = 'Enter amount';
      });
      return;
    }

    setState(() {
      error = null;
      paymentConfig = PaymentConfig(
        publishableApiKey: 'pk_test_izoikq54kw7pHtSvZDmXcQmmDCEd2pyAEN52Si2P',
        amount: int.parse(amountText),
        description: 'order #1324',
        metadata: {'size': '250g'},
        creditCard: CreditCardConfig(saveCard: true, manual: true),
      );
    });
  }

  Future<void> onSubmitCcForm() async {
    if (paymentConfig == null) {
      _logger.e('Payment config is null');
      return;
    }

    final source = CardPaymentRequestSource(
      creditCardData: CardFormModel(
        name: 'John Doe',
        number: '4111111111111111',
        month: '05',
        year: '2025',
        cvc: '123',
      ),
      tokenizeCard: (paymentConfig!.creditCard as CreditCardConfig).saveCard,
      manualPayment: (paymentConfig!.creditCard as CreditCardConfig).manual,
    );

    final paymentRequest = PaymentRequest(paymentConfig!, source);

    final result = await Moyasar.pay(
      apiKey: paymentConfig!.publishableApiKey,
      paymentRequest: paymentRequest,
    );

    onPaymentResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Manual Payment")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter amount",
                errorText: error,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _preparePaymentConfig,
              child: const Text("Prepare Payment"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onSubmitCcForm,
              child: const Text("Pay with Manual Card"),
            ),
          ],
        ),
      ),
    );
  }
}
