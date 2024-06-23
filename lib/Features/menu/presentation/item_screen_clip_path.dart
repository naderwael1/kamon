import 'package:flutter/material.dart';
import 'package:kamon/constant.dart';

class ItemScreenClipPath extends StatelessWidget {
  const ItemScreenClipPath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.grey[300],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.orange),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
          const Text(
            'Kabeer Food',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.orange),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
    );
  }
}
