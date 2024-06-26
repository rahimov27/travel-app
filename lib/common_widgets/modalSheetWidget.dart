import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/blocs/selected_city/selected_city_bloc.dart';
import 'package:travel_app/common_widgets/bottomWidget.dart';
import 'package:travel_app/common_widgets/cityWidget.dart';
import 'package:travel_app/resources/AppFonts.dart';
import 'package:travel_app/ui/selectedCityPage.dart';

class ModalBottomSheetSearch extends StatelessWidget {
  const ModalBottomSheetSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBarModalBottomSheet(
          backgroundColor: const Color(0xff242529),
          context: context,
          builder: (context) => SizedBox(
            width: double.infinity,
            height: 700,
            child: Column(
              children: [
                const SearchBar(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: BottomCardWidget(
                        text: "Сложный маршрут",
                        icon: "assets/images/marshrut.svg",
                        color: Color(0xff3A633B),
                      ),
                    ),
                    Expanded(
                      child: BottomCardWidget(
                        color: Color(0xff2261BC),
                        icon: "assets/images/world.svg",
                        text: "Куда угодно",
                      ),
                    ),
                    Expanded(
                      child: BottomCardWidget(
                        color: Color(0xff00427D),
                        icon: "assets/images/calendar.svg",
                        text: "Выходные",
                      ),
                    ),
                    Expanded(
                      child: BottomCardWidget(
                        color: Color(0xffFF5E5E),
                        icon: "assets/images/fire.svg",
                        text: "Горячие билеты",
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 21.0, vertical: 30),
                  child: Container(
                    width: double.infinity,
                    height: 216,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xff2F3035),
                    ),
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              CityWidget(
                                title: "Стамбул",
                                image: "assets/images/turkey.png",
                                subtitle: "Популярное направление",
                              ),
                              CityWidget(
                                title: "Сочи",
                                image: "assets/images/sochi.png",
                                subtitle: "Популярное направление",
                              ),
                              CityWidget(
                                title: "Пхукет",
                                image: "assets/images/phuket.png",
                                subtitle: "Популярное направление",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: SvgPicture.asset(
        color: const Color(0xff0C0C0C),
        "assets/images/search.svg",
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late SharedPreferences prefs;
  String cityHintText = "Минск";
  String destinationHintText = "Куда - Турция";

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      cityHintText = prefs.getString("from_city") ?? "Минск";
      destinationHintText = prefs.getString("city") ?? "Куда - Турция";
    });
  }

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
              const Padding(padding: EdgeInsets.only(left: 8)),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: SvgPicture.asset("assets/images/plane-2.svg"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            width:
                                250, // Adjusted width to fit within the parent
                            height: 42,
                            child: TextField(
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                  RegExp(
                                      r'[а-яА-Я\s]'), // Only allow Cyrillic characters and whitespace
                                ),
                              ],
                              decoration: InputDecoration(
                                hintText: cityHintText,
                                hintStyle: AppFonts.text1,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            BlocProvider.of<SelectedCityBloc>(context)
                                .add(LoadSelectedCity());
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectedCityPage(),
                              ),
                            );
                          },
                          child: SvgPicture.asset(
                            color: Colors.white,
                            "assets/images/search.svg",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: SizedBox(
                            height: 32,
                            width: 150,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                style: AppFonts.text1,
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                    RegExp(
                                        r'[а-яА-Я\s]'), // Only allow Cyrillic characters and whitespace
                                  ),
                                ],
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: destinationHintText,
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
                            "assets/images/close.svg",
                          ),
                        ),
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
