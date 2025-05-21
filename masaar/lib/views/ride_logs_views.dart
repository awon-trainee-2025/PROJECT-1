import 'package:flutter/material.dart';
import 'package:masaar/models/ride_logs_model.dart';
import 'package:masaar/widgets/custom_ride_log.dart';

class RideLogsView extends StatelessWidget {
  RideLogsView({super.key});

  final List<RideLogsModel> allRides = [
    RideLogsModel(
      destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
      status: 'Cancelled',
      date: '12 may',
      price: '15',
      time: '',
    ),
    RideLogsModel(
      destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
      status: 'Cancelled',
      date: '11 may',
      price: '15',
      time: '',
    ),
    RideLogsModel(
      destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
      status: '',
      date: '05 october',
      price: '15',
      time: '10 pm',
    ),
    RideLogsModel(
      destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
      status: '',
      date: '05 march',
      price: '15',
      time: '10 pm',
    ),
    RideLogsModel(
      destination: 'CRR4+4X9، حسان بن ثابت، البيبان، مكة 24231',
      status: '',
      date: '05 april',
      price: '15',
      time: '10 pm',
    ),
  ];

  Map<String, List<RideLogsModel>> groupRidesByMonth(
    List<RideLogsModel> rides,
  ) {
    final Map<String, List<RideLogsModel>> grouped = {};
    for (var ride in rides) {
      final month = ride.month;
      if (!grouped.containsKey(month)) {
        grouped[month] = [];
      }
      grouped[month]!.add(ride);
    }
    return grouped;
  }

  final List<String> monthOrder = [
    'january',
    'february',
    'march',
    'april',
    'may',
    'june',
    'july',
    'august',
    'september',
    'october',
    'november',
    'december',
  ];

  @override
  Widget build(BuildContext context) {
    final groupedRides = groupRidesByMonth(allRides);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Past Rides',
            style: TextStyle(
              color: Colors.black,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(left: 18.0, bottom: 6)),
                const Divider(thickness: 1, indent: 18, endIndent: 18),

                ...monthOrder
                    .where((month) => groupedRides.containsKey(month))
                    .map((month) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 10,
                            ),
                            child: Text(
                              month[0].toUpperCase() + month.substring(1),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          ...groupedRides[month]!.map(
                            (ride) => Column(
                              children: [
                                CustomRideLog(
                                  destination: ride.destination,
                                  status: ride.status,
                                  date: ride.date,
                                  price: ride.price,
                                  time: ride.time,
                                ),
                                const Divider(indent: 24, endIndent: 24),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
