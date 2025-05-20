import 'package:flutter/material.dart';
import 'package:masaar/widgets/custom_car_option.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomCarOption(
          carOption: 'Saver',
          price: '35',
          arrivalTime: '9 min',
          carImg: 'masaar/images/saver-car.png',
          capacity: '4',
        ),
      ),
    );
  }
}
