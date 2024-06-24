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
      color: kPrimaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 30,
            width: 30,
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                // Handle shopping cart button press
              },
              child: const Center(
                child: Icon(
                  Icons.arrow_back,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          const Text(
            'Kabeer Food',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 30,
            width: 30,
            color: Colors.white,
            child: GestureDetector(
              onTap: () {
                // Handle shopping cart button press
              },
              child: const Center(
                child: Icon(
                  Icons.favorite_border,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
