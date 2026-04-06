import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomRelatedBooksHeader extends StatelessWidget {
  const BottomRelatedBooksHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        top: 51,
      ),
      child: Row(
        children: [
          Text(
            "You Can Also Like",
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
