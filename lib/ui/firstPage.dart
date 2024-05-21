import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/blocs/first_enter/first_enter_bloc.dart';
import 'package:travel_app/common_widgets/buttonWidget.dart';
import 'package:travel_app/common_widgets/cardWidget.dart';
import 'package:travel_app/common_widgets/modalSheetWidget.dart';
import 'package:travel_app/resources/AppFonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Dispatch the event to fetch data when the widget is initialized
    context.read<FirstEnterBloc>().add(ShowMainCardEvent());
  }

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
                  color:
                      const Color(0xff2F3035), // Background color for container
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(
                          0xff3E3F43), // Inner container background color
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: modalBottomSheetSearch(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                  alignment: Alignment.centerLeft,
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

                        // Determine the image based on the id
                        String imagePath;
                        if (id == 1) {
                          imagePath =
                              '/Users/r27/StudioProjects/travel_app/assets/images/girl.png';
                        } else if (id == 2) {
                          imagePath =
                              '/Users/r27/StudioProjects/travel_app/assets/images/socrat-i-lera-600x600.png';
                        } else {
                          imagePath =
                              '/Users/r27/StudioProjects/travel_app/assets/images/samara.png';
                        }

                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CardWidget(
                            title: title,
                            price: price,
                            town: town,
                            imagePath:
                                imagePath, // Pass the image path to the CardWidget
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
    );
  }
}
