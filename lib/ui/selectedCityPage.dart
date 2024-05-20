import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class SelectedCityPage extends StatelessWidget {
  const SelectedCityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff3E3F43),
                ),
                child: Row(
                  children: [
                    const Padding(padding: EdgeInsets.only(left: 8)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                            "/Users/r27/StudioProjects/travel_app/assets/images/arrow_back.svg"),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
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
                                  SvgPicture.asset(
                                      "/Users/r27/StudioProjects/travel_app/assets/images/filter.svg")
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 32,
                                    width: 290,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        style: AppFonts.minsk,
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
                                  SvgPicture.asset(
                                      "/Users/r27/StudioProjects/travel_app/assets/images/close.svg")
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 21),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 105,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff2F3035),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                "/Users/r27/StudioProjects/travel_app/assets/images/add.svg"),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "обратно",
                                style: AppFonts.title4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 105,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff2F3035),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "24 фев, сб",
                                style: AppFonts.title4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 105,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff2F3035),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                "/Users/r27/StudioProjects/travel_app/assets/images/user.svg"),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "1,эконом",
                                style: AppFonts.title4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Container(
                        width: 105,
                        height: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color(0xff2F3035),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                "/Users/r27/StudioProjects/travel_app/assets/images/add.svg"),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                "обратно",
                                style: AppFonts.title4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 238,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff1D1E20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Прямые рельсы",
                        style: AppFonts.title2,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        decoration: BoxDecoration(border: Border.symmetric()),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: Color(0xffFF5E5E),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Уральские авиалинии",
                                        style: AppFonts.title4,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 125),
                                        child: Text(
                                          "2 390 ₽",
                                          style: TextStyle(
                                              color: Color(0xff2261BC),
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "07:00  09:10   10:00  11:00  12:00  13:00...",
                                    style: AppFonts.text2,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
