import 'package:flutter/material.dart';
import 'package:travel_app/resources/AppFonts.dart';

class CityWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const CityWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xff3E3F43), // Choose the color of the border
              width: 1.0, // Choose the width of the border
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.title3,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Color(0xff5E5F61)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
