import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kamon/Features/home/presentation/views/widgets/best_saller_list_view';
import 'package:kamon/Features/home/presentation/views/widgets/home_clip.dart';
import 'package:kamon/core/shared_widget/base_clip_path.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: BaseClipper(),
              child: const HomeClip(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Categories',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 120, // Fixed height for the horizontal ListView
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildCategoryItem(
                            'Beverages', 'https://example.com/beverages.jpg'),
                        _buildCategoryItem(
                            'Snack', 'https://example.com/snack.jpg'),
                        _buildCategoryItem(
                            'Seafood', 'https://example.com/seafood.jpg'),
                        _buildCategoryItem(
                            'Dessert', 'https://example.com/dessert.jpg'),
                        _buildCategoryItem(
                            'Seafood', 'https://example.com/seafood.jpg'),
                        _buildCategoryItem(
                            'Dessert', 'https://example.com/dessert.jpg'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Seller',
                        style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'View All',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  SizedBox(
                    height: 200, // Fixed height for the horizontal ListView
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        BestSellerCard(
                            imageUrl: 'https://example.com/sushi.jpg',
                            price: '103.0'),
                        BestSellerCard(
                            imageUrl: 'https://example.com/chicken.jpg',
                            price: '50.0'),
                        BestSellerCard(
                            imageUrl: 'https://example.com/lasagna.jpg',
                            price: '12.99'),
                        BestSellerCard(
                            imageUrl: 'https://example.com/cupcake.jpg',
                            price: '8.20'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String title, String imageUrl) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: GoogleFonts.lato(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
