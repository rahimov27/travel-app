import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/blocs/first_enter/first_enter_bloc.dart';
import 'package:travel_app/blocs/selected_city/selected_city_bloc.dart';
import 'package:travel_app/common_widgets/cardWidget.dart';
import 'package:travel_app/common_widgets/modalSheetWidget.dart';
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
            const SizedBox(height: 25),
            BlocBuilder<FirstEnterBloc, FirstEnterState>(
              builder: (context, state) {
                if (state is FirstEnterLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FirstEnterSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final item = state.data[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 67.0),
                          child: CardWidget(
                            title: item['title'],
                            town: item['town'],
                            price: item['price'],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is FirstEnterError) {
                  return Center(child: Text(state.errorText));
                }
                return const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 67.0),
                        child: CardWidget(
                          title: "Die Antwoord",
                          town: "Будапешт",
                          price: 5000,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 67.0),
                        child: CardWidget(
                          title: "Die Antwoord",
                          town: "Будапешт",
                          price: 5000,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 67.0),
                        child: CardWidget(
                          title: "Die Antwoord",
                          town: "Будапешт",
                          price: 5000,
                        ),
                      ),
                    ],
                  ),
                );
              },
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
                  onPressed: () {
                    // BlocProvider.of<FirstEnterBloc>(context)
                    //     .add(ShowMainCardEvent());
                    BlocProvider.of<SelectedCityBloc>(context)
                        .add(LoadSelectedCity());
                  },
                  child: const Text(
                    "Показать все места",
                    style: AppFonts.buttonText1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
