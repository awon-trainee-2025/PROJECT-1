import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // flutter map
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(21.524574, 39.772682),
        initialZoom: 13,
        minZoom: 5,
        maxZoom: 18,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
      ),
      children: [
        TileLayer(
          // Bring your own tiles
          urlTemplate:
              'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // For demonstration only
          userAgentPackageName: 'com.example.app',

          // Add your app identifier
          // And many more recommended properties!
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(21.524574, 39.772682),
              child: Icon(Icons.location_pin, size: 50, color: Colors.red),
            ),
          ],
        ),
      ],
    );
  }
}
