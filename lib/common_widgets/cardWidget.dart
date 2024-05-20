import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.town,
    required this.imagePath,  // Add imagePath parameter
  }) : super(key: key);

  final String title;
  final String town;
  final double price;
  final String imagePath; // Define imagePath variable

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                width: 132,
                height: 133,
                imagePath, // Use imagePath
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              title.isNotEmpty ? title : "Unknown Title", // Default value
              style: AppFonts.title3,
            ),
            const SizedBox(height: 8.0),
            Text(
              town.isNotEmpty ? town : "Unknown Town", // Default value
              style: AppFonts.text2,
            ),
            const SizedBox(height: 4.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  '/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/plane.svg', // Use relative path
                  height: 24.0,
                  width: 24.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  "от ${price.toStringAsFixed(0)} ₽", // Format price as int
                  style: AppFonts.text2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
