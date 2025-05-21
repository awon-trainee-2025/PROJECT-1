import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    required this.leadingIcon,
    required this.hintText,
    required this.trailing,
  });

  final Icon leadingIcon;
  final String hintText;
  final IconButton trailing;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final FocusNode focusNode = FocusNode();
  final List places = [
    'Masjid Al-Haram',
    'Umm al-Qura University',
    'King Abdullah Library',
    'Hommes Burger',
    'Namaq Cafe',
    'Fitness Time Gym',
    'Haramain Railway Station',
    'Broffee Cafe',
    'Makkah Mall',
    'Chirp Bakery',
  ];

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SizedBox(
          height: 50,
          width: 350,
          child: SearchBar(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
            overlayColor: WidgetStateProperty.resolveWith<Color?>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.focused)) {
                return Colors.blue.withValues(alpha: 0.2); // overlay on focus
              }
              return null;
            }),
            leading: widget.leadingIcon,
            hintText: widget.hintText,
            trailing: [SizedBox(width: 40, child: widget.trailing)],
            focusNode: focusNode,
            controller: controller,
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
          ),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        final query = controller.text.toLowerCase();

        final List filteredPlaces =
            places
                .where((place) => place.toLowerCase().contains(query))
                .toList();

        return filteredPlaces.map((place) {
          return ListTile(
            title: Text(place),
            onTap: () {
              setState(() {
                controller.closeView(place);
              });
            },
          );
        }).toList();
      },
    );
  }
}
