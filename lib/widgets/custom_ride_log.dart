import 'package:flutter/material.dart';

class CustomRideLog extends StatelessWidget {
  final String destination;
  final String date;
  final String status;
  final String price;
  final String time;

  const CustomRideLog({
    super.key,
    required this.destination,
    required this.status,
    required this.date,
    required this.price,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            status == 'Cancelled'
                ? 'images/cancelled_car.png'
                : 'images/car.png',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        color: Color(0xFF919191),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Text(' - '),
                    Text(
                      status == 'Cancelled' ? status : time,
                      style: const TextStyle(
                        color: Color(0xFF919191),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  destination,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Image.asset('images/SAR.png', width: 16, height: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
