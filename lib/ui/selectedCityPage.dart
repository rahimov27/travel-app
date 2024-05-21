import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/blocs/see_all_tickets/see_all_tickets_bloc.dart';
import 'package:travel_app/blocs/selected_city/selected_city_bloc.dart';
import 'package:travel_app/common_widgets/rowChipWidget.dart';
import 'package:travel_app/resources/AppFonts.dart';
import 'package:travel_app/ui/seeAlltickets.dart';

class SelectedCityPage extends StatefulWidget {
  const SelectedCityPage({Key? key}) : super(key: key);

  @override
  _SelectedCityPageState createState() => _SelectedCityPageState();
}

class _SelectedCityPageState extends State<SelectedCityPage> {
  final TextEditingController turkeyController = TextEditingController();
  final TextEditingController minskController = TextEditingController();
  late SharedPreferences prefs;

  DateTime selectedDate =
      DateTime.now(); // Добавляем переменную для хранения выбранной даты

  @override
  void initState() {
    super.initState();
    _initSharedPreferences();
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

  void _swapTextFields() {
    setState(() {
      String temp = turkeyController.text;
      turkeyController.text = minskController.text;
      minskController.text = temp;
    });
  }

  String getCurrentDateTime() {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatter.format(now);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked; // Обновляем выбранную дату
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 240, // Adjusted width
                                    height: 42,
                                    child: TextField(
                                      controller: minskController,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                          RegExp(r'[а-яА-Я\s]'),
                                        ),
                                      ],
                                      decoration: const InputDecoration(
                                        hintText: "Минск",
                                        hintStyle: AppFonts.text1,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _swapTextFields,
                                    icon: SvgPicture.asset(
                                        "assets/images/filter.svg"),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: 32,
                                    width: 240, // Adjusted width
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        controller: turkeyController,
                                        style: AppFonts.text1,
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
                                  SvgPicture.asset("assets/images/close.svg"),
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
                    RowChip(
                      text: "обратно",
                      icon: "assets/images/add.svg",
                      onPressed: () => _selectDate(context),
                    ),
                    RowChip(
                      text: getCurrentDateTime().substring(5, 10),
                      icon: "assets/images/add.svg",
                      onPressed: () {},
                    ),
                    RowChip(
                      text: "1,Эконом",
                      icon:
                          "/Users/r27/StudioProjects/travel_app/assets/images/svgBottom/profile.svg",
                      onPressed: () {},
                    ),
                    RowChip(
                      text: "обратно",
                      icon: "assets/images/add.svg",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Container(
                height: 358,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff1D1E20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Прямые рельсы",
                        style: AppFonts.title2,
                      ),
                    ),
                    Expanded(
                      child: BlocBuilder<SelectedCityBloc, SelectedCityState>(
                        builder: (context, state) {
                          if (state is SelectedCityLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (state is SelectedCitySuccess) {
                            return ListView.builder(
                              itemCount: state.ticket_offers.length,
                              itemBuilder: (context, index) {
                                final ticket_offer = state.ticket_offers[index];
                                final id = ticket_offer["id"];
                                final title = ticket_offer["title"];
                                final time_range = ticket_offer["time_range"]
                                    .toString()
                                    .substring(
                                      1,
                                      ticket_offer["time_range"]
                                              .toString()
                                              .length -
                                          1,
                                    );
                                final price = ticket_offer["price"]["value"];
                                // Determine the color of CircleAvatar based on the id
                                Color avatarColor;
                                if (id == 1) {
                                  avatarColor = const Color(0xffFF5E5E);
                                } else if (id == 2) {
                                  avatarColor = Colors.blue;
                                } else {
                                  avatarColor = const Color(0xffFF5E5E);
                                }
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xff3E3F43),
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundColor: avatarColor,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                title,
                                                style: AppFonts.title4,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              'от ${price.toStringAsFixed(0)} ₽',
                                              style: AppFonts.text2.copyWith(
                                                color: const Color(0xff2261BC),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          subString(time_range.toString()),
                                          style: AppFonts.text2,
                                        ),
                                        const SizedBox(height: 4.0),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (state is SelectedCityError) {
                            return Center(
                                child: Text('Error: ${state.errorText}'));
                          }
                          return Container();
                        },
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          // Add your onPressed code here
                        },
                        child: const Text(
                          "Показать все",
                          style: TextStyle(color: Color(0xff2261BC)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 23),
              SizedBox(
                height: 42,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: const Color(0xff2261BC),
                  ),
                  onPressed: () {
                    // Dispatch the event to load all tickets
                    BlocProvider.of<SeeAllTicketsBloc>(context)
                        .add(SeeAllTicketEvent());

                    // Navigate to the SeeAllTickets page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SeeAllTickets(selectedDate: selectedDate),
                      ),
                    );
                  },
                  child: const Text(
                    "Посмотреть все билеты",
                    style: AppFonts.buttonText1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String subString(String text) {
    if (text.length > 20) {
      return "${text.substring(1, 40)}...";
    } else {
      return text;
    }
  }
}
