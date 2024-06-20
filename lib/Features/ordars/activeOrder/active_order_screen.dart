import 'package:flutter/material.dart';
import 'package:kamon/Features/ordars/activeOrder/active_order_card.dart';
import 'package:kamon/Features/ordars/order_clip.dart';
import 'package:kamon/core/shared_widget/Drawer/customDrawer.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';

class ActiceOrderScreen extends StatelessWidget {
  const ActiceOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      body: Column(children: [
        ActiveOrderCard(),
      ]),
    );
  }
}
