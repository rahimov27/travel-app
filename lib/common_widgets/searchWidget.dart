import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff3E3F43),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align children to the start
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SvgPicture.asset(
                              "/Users/r27/StudioProjects/travel_app/assets/images/plane-2.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width: 290,
                            height: 42,
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(
                                      r'[а-яА-Я\s]'), // Only allow Cyrillic characters and whitespace
                                ),
                              ],
                              decoration: const InputDecoration(
                                hintText: "Минск",
                                hintStyle: AppFonts.minsk,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                            color: Colors.white,
                            "/Users/r27/StudioProjects/travel_app/assets/images/search.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            height: 32,
                            width: 290,
                            child: Align(
                              alignment: Alignment
                                  .centerLeft, // Align the helper text to the left
                              child: TextField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(
                                        r'[а-яА-Я\s]'), // Only allow Cyrillic characters and whitespace
                                  ),
                                ],
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Куда - Турция",
                                  hintStyle: AppFonts.turkish,
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                              "/Users/r27/StudioProjects/travel_app/assets/images/close.svg"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
