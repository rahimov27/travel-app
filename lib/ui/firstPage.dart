import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:travel_app/common_widgets/bottomWidget.dart';
import 'package:travel_app/common_widgets/cardWidget.dart';
import 'package:travel_app/resources/AppFonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: SizedBox(
                width: 272,
                child: Text(
                  textAlign: TextAlign.center,
                  "Поиск дешевых авиабилетов",
                  style: AppFonts.title1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: Container(
                height: 122,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff2F3035),
                ),
                width: double.infinity,
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
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {
                              showBarModalBottomSheet(
                                backgroundColor: const Color(0xff242529),
                                context: context,
                                builder: (context) => Container(
                                  width: double.infinity,
                                  height: 700,
                                  child: Column(
                                    children: [
                                      const SearchBar(),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BottomCardWidget(
                                            text: "Сложный маршрут",
                                            icon:
                                                "/Users/r27/StudioProjects/travel_app/assets/images/marshrut.svg",
                                            color: Color(0xff3A633B),
                                          ),
                                          BottomCardWidget(
                                              color: Color(0xff2261BC),
                                              icon:
                                                  "/Users/r27/StudioProjects/travel_app/assets/images/world.svg",
                                              text: "Куда угодно"),
                                          BottomCardWidget(
                                              color: Color(0xff00427D),
                                              icon:
                                                  "/Users/r27/StudioProjects/travel_app/assets/images/calendar.svg",
                                              text: "Выходные"),
                                          BottomCardWidget(
                                              color: Color(0xffFF5E5E),
                                              icon:
                                                  "/Users/r27/StudioProjects/travel_app/assets/images/fire.svg",
                                              text: "Горячие билеты")
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 21.0, vertical: 30),
                                        child: Container(
                                          width: double.infinity,
                                          height: 216,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color: const Color(0xff2F3035),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      border: Border(
                                                        bottom: BorderSide(
                                                          color: Color(
                                                              0xff3E3F43), // Choose the color of the border
                                                          width:
                                                              1.0, // Choose the width of the border
                                                        ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          child: Image.asset(
                                                            "/Users/r27/StudioProjects/travel_app/assets/images/Ortakoy-Mosque-and-the-Bosphorus-Bridge-at-sunrise.Photographer_-Givaga_iStockphoto-.png",
                                                            width: 40,
                                                            height: 40,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 8),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                "Стамбул",
                                                                style: AppFonts
                                                                    .title3,
                                                              ),
                                                              Text(
                                                                  "Популярное направление"),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                                color: const Color(0xff0C0C0C),
                                "/Users/r27/StudioProjects/travel_app/assets/images/search.svg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align children to the start
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
                              SizedBox(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Text(
              "Музыкально отлететь",
              style: AppFonts.title1,
            ),
            const SizedBox(
              height: 25,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 67.0),
                    child: CardWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 67.0),
                    child: CardWidget(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 67.0),
                    child: CardWidget(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.84),
              child: SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: const Color(0xff2F3035),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Показать все места",
                    style: AppFonts.buttonText1,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
                              width: 20,
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
