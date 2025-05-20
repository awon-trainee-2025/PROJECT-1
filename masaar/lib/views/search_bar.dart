import 'package:flutter/material.dart';
import 'package:masaar/widgets/custom_default_search_bar.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          CustomSearchBar(icon: Icon(Icons.search), hintText: 'Search here...'),
        ],
      ),
    );
  }
}
