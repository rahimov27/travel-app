import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class BottomCardWidget extends StatelessWidget {
  const BottomCardWidget({
    super.key,
    required this.color,
    required this.icon,
    required this.text,
  });

  final String text;
  final String icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            height: 50,
            width: 50,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                  height: 24, // Set the height of the SVG icon
                  width: 24,
                  icon),
            ),
          ),
        ),
        SizedBox(
          width: 100,
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: AppFonts.text2,
          ),
        )
      ],
    );
  }
}
