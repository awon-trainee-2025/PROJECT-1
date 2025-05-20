import 'package:flutter/material.dart';
import 'package:masaar/widgets/custom_search_bar.dart';

class SearchBarView extends StatelessWidget {
  const SearchBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: 
          AppBar(
            actions: [
              CustomSearchBar(
                leadingIcon: Icon(Icons.search),
                hintText: 'Search here...',
                trailing: IconButton(onPressed: () {}, icon: Icon(Icons.clear)),
              ),
            ],
          ),
      ),
    );
  }
}
