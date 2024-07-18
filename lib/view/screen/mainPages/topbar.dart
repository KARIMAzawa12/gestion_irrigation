import 'package:flutter/material.dart';
import 'searchbar.dart' as custom;

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 6, child: custom.SearchBar()), // Use custom.SearchBar here
        SizedBox(
          width: 10,
        ),

      ],
    );
  }
}
