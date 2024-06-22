import 'package:flutter/material.dart';
import 'package:kamon/Features/home/data/seach_view_model.dart';
import 'package:provider/provider.dart';
import 'package:kamon/constant.dart';

class HomeClip extends StatelessWidget {
  const HomeClip({super.key});

  String _getGreetingMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else {
      return 'Good Evening';
    }
  }

  String _getGreetingSubMessage() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Rise And Shine! It\'s Breakfast Time';
    } else {
      return 'Hope You Had a Great Day!';
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchViewModel>(context);
    return Container(
      height: 300, // Adjusted height to fit content
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: viewModel.searchEmployees,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.tune),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      filled: true,
                      fillColor: kfillColor,
                    ),
                  ),
                ),
                const SizedBox(width: 14.0),
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
                          Icons.shopping_cart_outlined,
                          color: kPrimaryColor,
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
                        // Handle notifications button press
                      },
                      child: const Center(
                        child: Icon(
                          Icons.notifications_outlined,
                          color: kPrimaryColor,
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
                        // Handle profile button press
                      },
                      child: const Center(
                        child: Icon(
                          Icons.person_2_outlined,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              _getGreetingMessage(),
              style: kPrimaryFont(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              _getGreetingSubMessage(),
              style: kPrimaryFont(
                fontSize: 18,
                color: kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
