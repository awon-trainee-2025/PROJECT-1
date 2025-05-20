import 'package:flutter/material.dart';

class CustomCarOption extends StatelessWidget {
  const CustomCarOption({
    super.key,
    required this.carOption,
    required this.price,
    required this.arrivalTime,
    required this.carImg,
    required this.capacity,
  });

  final String carOption;
  final String price;
  final String arrivalTime;
  final String carImg;
  final String capacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(carImg, width: 10, height: 10, fit: BoxFit.contain),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carOption,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Text(arrivalTime, style: TextStyle(color: Colors.grey)),
                        SizedBox(width: 12),
                        Icon(
                          Icons.person_outline,
                          size: 16,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 4),
                        Text(capacity, style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                price,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Image.asset(
                'masaar/images/saudiriyalsymbol.png',
                height: 1,
                width: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
