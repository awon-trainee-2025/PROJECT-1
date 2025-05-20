import 'package:flutter/material.dart';

class CustomRideLog extends StatelessWidget {
  final String destination;
  final String date;
  final String status;
  final String price;
  const CustomRideLog({
    super.key,
    required this.destination,
    required this.status,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Row(
        spacing: 15,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('images/car.png'),

          Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    date,
                    style: TextStyle(
                      color: Color(0xFF919191),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(' - '),
                  Text(
                    status,
                    style: TextStyle(
                      color: Color(0xFF919191),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Text(
                destination,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Row(
                children: [
                  Text(
                    price,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 4),
                  Image.asset('images/SAR.png'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
