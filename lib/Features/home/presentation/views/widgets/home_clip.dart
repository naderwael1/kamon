import 'package:flutter/material.dart';
import 'package:kamon/constant.dart';

class HomeClip extends StatelessWidget {
  const HomeClip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190, // Adjusted height to fit content
      color: KPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.tune),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      filled: true,
                      fillColor: KfillColor,
                    ),
                  ),
                ),
                const SizedBox(width: 14.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors
                        .white, // Set the background color of the container
                    child: GestureDetector(
                      onTap: () {
                        // Handle shopping cart button press
                      },
                      child: const Center(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: KPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        // Handle shopping cart button press
                      },
                      child: const Center(
                        child: Icon(
                          Icons.notifications_outlined,
                          color: KPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                  child: Container(
                    height: 30, // Adjusted height to better fit the icon
                    width: 30, // Adjusted width to better fit the icon
                    color: Colors
                        .white, // Set the background color of the container
                    child: GestureDetector(
                      onTap: () {
                        // Handle shopping cart button press
                      },
                      child: const Center(
                        child: Icon(
                          Icons.person_2_outlined,
                          color: KPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              'Good Morning',
              style: KPrimaryFont(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Rise And Shine! It\'s Breakfast Time',
              style: KPrimaryFont(
                fontSize: 18,
                color: KSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
