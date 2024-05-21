import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:travel_app/blocs/first_enter/first_enter_bloc.dart';
import 'package:travel_app/blocs/see_all_tickets/see_all_tickets_bloc.dart';
import 'package:travel_app/blocs/selected_city/selected_city_bloc.dart';
import 'package:travel_app/ui/emptyScreen.dart';
import 'package:travel_app/ui/firstPage.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FirstEnterBloc>(
          create: (context) => FirstEnterBloc(),
        ),
        BlocProvider<SelectedCityBloc>(create: (context) => SelectedCityBloc()),
        BlocProvider<SeeAllTicketsBloc>(
            create: (context) => SeeAllTicketsBloc())
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: const PagesScreen(),
      ),
    ),
  );
}

class PagesScreen extends StatefulWidget {
  const PagesScreen({super.key});

  @override
  State<PagesScreen> createState() => _PagesScreenState();
}

class _PagesScreenState extends State<PagesScreen> {
  int currentIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    const EmptyScreen(),
    const EmptyScreen(),
    const EmptyScreen(),
    const EmptyScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: const Color(0xff5E5F61),
        selectedItemColor: const Color(0xff2261BC),
        backgroundColor: const Color(0xff0C0C0C),
        items: const [
          BottomNavigationBarItem(
            icon: SvgIcon(
              color: Color(0xff2261BC),
              icon: SvgIconData(
                  "/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/plane.svg"),
            ),
            label: "Авиабилеты",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              color: Color(0xff2261BC),
              icon: SvgIconData(
                  "/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/hotel.svg"),
            ),
            label: "Отели",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              color: Color(0xff2261BC),
              icon: SvgIconData(
                  "/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/location.svg"),
            ),
            label: "Короче",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              color: Color(0xff2261BC),
              icon: SvgIconData(
                  "/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/bell.svg"),
            ),
            label: "Подписки",
          ),
          BottomNavigationBarItem(
            icon: SvgIcon(
              color: Color(0xff2261BC),
              icon: SvgIconData(
                  "/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/profile.svg"),
            ),
            label: "Профиль",
          ),
        ],
      ),
    );
  }
}
