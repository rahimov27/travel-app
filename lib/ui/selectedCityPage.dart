import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/blocs/selected_city/selected_city_bloc.dart';
import 'package:travel_app/common_widgets/rowChipWidget.dart';
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
                        SvgPicture.asset("assets/images/arrow_back.svg"),
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
                                          RegExp(r'[а-яА-Я\s]'),
                                        ),
                                      ],
                                      decoration: const InputDecoration(
                                        hintText: "Минск",
                                        hintStyle: AppFonts.minsk,
                                      ),
                                    ),
                                  ),
                                  SvgPicture.asset("assets/images/filter.svg")
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
                                            RegExp(r'[а-яА-Я\s]'),
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
                                  SvgPicture.asset("assets/images/close.svg")
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
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RowChip(
                      text: "обратно",
                      icon:
                          "/Users/r27/StudioProjects/travel_app/assets/images/add.svg",
                    )
                  ],
                ),
              ),
              const SizedBox(height: 12),
              BlocBuilder<SelectedCityBloc, SelectedCityState>(
                builder: (context, state) {
                  if (state is SelectedCityLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is SelectedCitySuccess) {
                    return Container(
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
                              decoration: const BoxDecoration(
                                border: Border.symmetric(),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Color(0xffFF5E5E),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.title,
                                              style: AppFonts.title4,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 125),
                                              child: Text(
                                                state.price,
                                                style: const TextStyle(
                                                  color: Color(0xff2261BC),
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state.time,
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
                    );
                  } else if (state is SelectedCityError) {
                    return Text('Error: ${state.errorText}');
                  }
                  return Container(); // Placeholder return statement
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
