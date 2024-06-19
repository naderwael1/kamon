import 'package:flutter/material.dart';
import 'package:kamon/constant.dart';

class OrderClip extends StatelessWidget {
  const OrderClip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      color: KPrimaryColor,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 17.0),
          child: Text(
            'My Orders',
            style: KPrimaryFont(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: KSecondaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
