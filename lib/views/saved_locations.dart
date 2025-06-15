import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:masaar/widgets/custom_button.dart';
import 'add_locations.dart';

class SavedLocationsPage extends StatefulWidget {
  @override
  _SavedLocationsPageState createState() => _SavedLocationsPageState();
}

class _SavedLocationsPageState extends State<SavedLocationsPage> {
  List<Map<String, String>> locations = [];

  final Color iconColor = const Color(0xFF563B9C);

  void _addLocation(Map<String, String> location) {
    setState(() {
      locations.add(location);
    });
  }

  void _editLocation(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddLocationPage(initialData: locations[index]),
      ),
    );
    if (result != null) {
      setState(() {
        locations[index] = result;
      });
    }
  }

  Widget _staticLocationTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Color? iconColor,
  }) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF563B9C).withOpacity(0.12),
              blurRadius: 16,
              offset: Offset(0, 8),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: this.iconColor, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dynamicLocationTile(Map<String, String> loc, int index) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 16,
              offset: Offset(0, 8),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: iconColor, size: 32),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loc['name'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    loc['address'] ?? '',
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.edit, color: iconColor),
              onPressed: () => _editLocation(index),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: const Size(0, 0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: SizedBox(
            height: 56,
            width: 56,
            child: Image.asset('images/back_button.png'),
          ),
        ),
        title: const Text(
          'Saved Locations',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 24.0, right: 8.0),
                child: Text(
                  'Your places',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 2,
            indent: 24,
            endIndent: 24,
          ),
          _staticLocationTile(
            icon: Icons.home,
            title: 'Home',
            subtitle: 'Add your home address',
            iconColor: iconColor,
          ),
          _staticLocationTile(
            icon: Icons.work,
            title: 'Work',
            subtitle: 'Add your work address',
            iconColor: iconColor,
          ),
          ...List.generate(
            locations.length,
            (index) => _dynamicLocationTile(locations[index], index),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: '+ Add a location',
          isActive: true,
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AddLocationPage()),
            );
            if (result != null) _addLocation(result);
          },
        ),
      ),
    );
  }
}
