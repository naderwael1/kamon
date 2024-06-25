import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kamon/constant.dart';
import 'package:kamon/core/utils/app_router.dart';

class ItemScreenClipPath extends StatelessWidget {
  const ItemScreenClipPath({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      color: kPrimaryColor,
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40), // Space from the top
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      // Handle back button press
                    },
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // Add some spacing between icons
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  height: 30,
                  width: 30,
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: () {
                      // Handle favorite button press
                    },
                    child: const Center(
                      child: Icon(
                        Icons.favorite_border,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // Add some spacing between icons
              GestureDetector(
                onTap: () {
                  print('Cart icon tapped');
                  GoRouter.of(context).push(AppRouter.KCartScreen);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 30,
                    width: 30,
                    color: Colors.white,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Center(
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 16), // Space between the icons row and the image
          Center(
            child: Image.asset('assets/images/kamonText.png'),
          ),
        ],
      ),
    );
  }
}
