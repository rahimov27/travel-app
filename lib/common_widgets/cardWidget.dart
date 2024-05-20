import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.town,
  }) : super(key: key);

  final String title;
  final String town;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/girl.png', // Use relative path
            fit: BoxFit.cover,
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
    );
  }
}
