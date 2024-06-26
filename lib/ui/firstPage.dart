import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/blocs/first_enter/first_enter_bloc.dart';
import 'package:travel_app/blocs/selected_city/selected_city_bloc.dart';
import 'package:travel_app/common_widgets/bottomWidget.dart';
import 'package:travel_app/common_widgets/buttonWidget.dart';
import 'package:travel_app/common_widgets/cardWidget.dart';
import 'package:travel_app/common_widgets/cityWidget.dart';
import 'package:travel_app/common_widgets/modalSheetWidget.dart';
import 'package:travel_app/resources/AppFonts.dart';
import 'package:travel_app/ui/selectedCityPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  final TextEditingController turkeyController = TextEditingController();
  final TextEditingController minskController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
    context.read<FirstEnterBloc>().add(ShowMainCardEvent());
  }

  Future<void> _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    _loadPreferences();
  }

  void _loadPreferences() {
    setState(() {
      turkeyController.text = prefs.getString("city") ?? "Куда - Турция";
      minskController.text = prefs.getString("from_city") ?? "Минск";
    });
  }

  void _saveCity() {
    prefs.setString("city", turkeyController.text);
    prefs.setString("from_city", minskController.text);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Город успешно сохранен')),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    _loadPreferences();
    showBarModalBottomSheet(
      backgroundColor: const Color(0xff242529),
      context: context,
      builder: (context) => SizedBox(
        width: double.infinity,
        height: 700,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 45),
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
                                child: SvgPicture.asset(
                                    "assets/images/plane-2.svg"),
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
                                      builder: (context) =>
                                          const SelectedCityPage(),
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
                                  width: 290,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: TextField(
                                      controller: turkeyController,
                                      style: AppFonts.text1,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(
                                              r'[а-яА-Я\s]'), // Only allow Cyrillic characters and whitespace
                                        ),
                                      ],
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: prefs.getString("city") ??
                                            "Куда - Турция",
                                        hintStyle: AppFonts.turkish,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  turkeyController.clear();
                                },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const BottomCardWidget(
                      text: "Сложный маршрут",
                      icon: "assets/images/marshrut.svg",
                      color: Color(0xff3A633B),
                    ),
                  ),
                ),
                Expanded(
                  child: const BottomCardWidget(
                    color: Color(0xff2261BC),
                    icon: "assets/images/world.svg",
                    text: "Куда угодно",
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const BottomCardWidget(
                      color: Color(0xff00427D),
                      icon: "assets/images/calendar.svg",
                      text: "Выходные",
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const BottomCardWidget(
                      color: Color(0xffFF5E5E),
                      icon: "assets/images/fire.svg",
                      text: "Горячие билеты",
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 21.0, vertical: 30),
              child: Container(
                width: double.infinity,
                height: 216,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff2F3035),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const CityWidget(
                            title: "Стамбул",
                            image: "assets/images/turkey.png",
                            subtitle: "Популярное направление",
                          ),
                          InkWell(
                            onTap: () {
                              BlocProvider.of<SelectedCityBloc>(context)
                                  .add(LoadSelectedCity());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectedCityPage(),
                                ),
                              );
                            },
                            child: const CityWidget(
                              title: "Сочи",
                              image: "assets/images/sochi.png",
                              subtitle: "Популярное направление",
                            ),
                          ),
                          const CityWidget(
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
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // Responsive horizontal padding
              vertical: 28,
            ),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(
                          0xff2F3035), // Background color for container
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color(
                              0xff3E3F43), // Inner container background color
                        ),
                        child: Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: ModalBottomSheetSearch(),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 42,
                                      child: TextField(
                                        controller: minskController,
                                        style: AppFonts.text1,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                            RegExp(
                                                r'[а-яА-Я\s]'), // Only allow Cyrillic characters and whitespace
                                          ),
                                        ],
                                        decoration: const InputDecoration(
                                          hintText: "Минск",
                                          hintStyle: AppFonts.buttonText1,
                                        ),
                                        onSubmitted: (value) {
                                          _saveCity();
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 32,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: GestureDetector(
                                          onTap: () {
                                            _showModalBottomSheet(context);
                                          },
                                          child: AbsorbPointer(
                                            child: TextField(
                                              controller: turkeyController,
                                              style: AppFonts.turkish,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(
                                                  RegExp(
                                                      r'[а-яА-Я\s]'), // Only allow Cyrillic characters and whitespace
                                                ),
                                              ],
                                              decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "Куда - Турция",
                                                hintStyle: AppFonts.turkish,
                                              ),
                                              onSubmitted: (value) {
                                                _saveCity();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                const Text(
                  "Музыкально отлететь",
                  style: AppFonts.title1,
                ),
                SizedBox(
                  height: 270, // Adjust the height as needed
                  child: BlocBuilder<FirstEnterBloc, FirstEnterState>(
                    builder: (context, state) {
                      if (state is FirstEnterLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is FirstEnterSuccess) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.offers.length,
                          itemBuilder: (context, index) {
                            final offer = state.offers[index];
                            final id = offer['id'] ?? 0;
                            final title = offer['title'] ?? "Unknown Title";
                            final town = offer['town'] ?? "Unknown Town";
                            final price = offer['price'] != null
                                ? (offer['price']['value'] ?? 0).toDouble()
                                : 0.0;

                            String imagePath;
                            if (id == 1) {
                              imagePath = 'assets/images/girl.png';
                            } else if (id == 2) {
                              imagePath =
                                  'assets/images/socrat-i-lera-600x600.png';
                            } else {
                              imagePath = 'assets/images/samara.png';
                            }

                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: CardWidget(
                                title: title,
                                price: price,
                                town: town,
                                imagePath: imagePath,
                              ),
                            );
                          },
                        );
                      } else if (state is FirstEnterError) {
                        return Center(child: Text('Error: ${state.errorText}'));
                      }
                      return const Center(
                        child: Text('Press the button to load offers'),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 15.84),
                  child: ButtonWidget(
                    color: Color(0xff2F3035),
                    text: "Показать все места",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
