import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masaar/controllers/auth_controller.dart';
import 'package:masaar/widgets/custom%20widgets/custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: SizedBox(
            height: 50,
            width: 50,
            child: Image.asset('images/back_button.png'),
          ),
        ),
        title: const Text(
          'Wallet',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(width: 8),
                  Text(
                    "Cards",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Card Number Field
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: cardNumberController,
                  decoration: InputDecoration(
                    labelText: 'Card number',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(height: 16),

              // Expiry and CVV
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: expiryController,
                        decoration: InputDecoration(
                          labelText: 'Expiry date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        controller: cvvController,
                        decoration: InputDecoration(
                          labelText: 'CVV code',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Pay Button
              CustomButton(
                text: 'Add card',
                isActive: true,
                onPressed: () async {
                  final cardNumber = cardNumberController.text.trim();
                  final expiry = expiryController.text.trim();
                  final cvv = cvvController.text.trim();

                  final customerId = Get.find<AuthController>().user?.id;
                  if (cardNumber.isEmpty ||
                      expiry.isEmpty ||
                      cvv.isEmpty ||
                      customerId == null) {
                    Get.snackbar(
                      'Error',
                      'Please fill all fields',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  try {
                    final supabase = Supabase.instance.client;
                    await supabase.from('wallets').insert({
                      'card_number': cardNumber,
                      'expire_date': expiry,
                      'CVV': int.parse(cvv),
                      'customer_id': customerId,
                    });
                    Get.back();
                    Get.snackbar(
                      'Success',
                      'Card added successfully',
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } catch (e) {
                    print('Add card error: $e');
                    Get.snackbar(
                      'Error',
                      'Failed to add card',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
