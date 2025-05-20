import 'package:flutter/material.dart';
import 'package:masaar/widgets/custom_ride_log.dart';

class RideLogs extends StatelessWidget {
  const RideLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Rides',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 31.0),
                      child: Text(
                        'Past',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Divider(indent: 24, endIndent: 24),
                        Divider(
                          indent: 18.5,
                          endIndent: 360,
                          color: Color(0xFF6A42C2),
                        ),
                      ],
                    ),
                  ],
                ),
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
