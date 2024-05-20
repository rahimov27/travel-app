import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.title,
    required this.price,
    required this.town
  });

  final String title;
  final String town;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
            "/Users/r27/StudioProjects/travel_app/assets/images/girl.png"),
        Text(
          title,
          style: AppFonts.title3,
        ),
        Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            town,
            style: AppFonts.text2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  "/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/plane.svg"),
              Text(
                "от $price ₽",
                style: AppFonts.text2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
