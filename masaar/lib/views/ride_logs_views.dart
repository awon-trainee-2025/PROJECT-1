import 'package:flutter/material.dart';
import 'package:masaar/widgets/custom_ride_log.dart';

class RideLogs extends StatelessWidget {
  const RideLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              children: [
                CustomRideLog(
                  destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
                  status: 'Cancelled',
                  date: '11 may',
                  price: '15',
                  time: '',
                ),
                Divider(indent: 24, endIndent: 24),
                CustomRideLog(
                  destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
                  status: 'Cancelled',
                  date: '11 may',
                  price: '15',
                  time: '',
                ),
                Divider(indent: 24, endIndent: 24),
                CustomRideLog(
                  destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
                  status: '',
                  date: '11 may',
                  price: '15',
                  time: '10 pm',
                ),
                Divider(indent: 24, endIndent: 24),
                CustomRideLog(
                  destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
                  status: '',
                  date: '11 may',
                  price: '15',
                  time: '6 am',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
