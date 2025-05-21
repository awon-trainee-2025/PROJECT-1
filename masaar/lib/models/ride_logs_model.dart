class RideLogsModel {
  final String destination;
  final String date;
  final String status;
  final String price;
  final String time;

  RideLogsModel({
    required this.destination,
    required this.date,
    required this.status,
    required this.price,
    required this.time,
  });

  String get month => date.split(" ").last.toLowerCase();
}
