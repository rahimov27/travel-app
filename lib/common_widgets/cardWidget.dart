import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
            "/Users/r27/StudioProjects/travel_app/assets/images/girl.png"),
        const Text(
          "Die Antwoord",
          style: AppFonts.title3,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "Будапешт",
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
              const Text(
                "от 22 264 ₽",
                style: AppFonts.text2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
