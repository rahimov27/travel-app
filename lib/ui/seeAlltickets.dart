import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/blocs/see_all_tickets/see_all_tickets_bloc.dart';
import 'package:travel_app/resources/AppFonts.dart';
import 'package:travel_app/ui/ticketDisplay.dart';

class SeeAllTickets extends StatelessWidget {
  const SeeAllTickets({Key? key, required this.selectedDate}) : super(key: key);

  final DateTime selectedDate;
  Future<String> _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String city = prefs.getString("city") ?? "Куда - Турция";
    String fromCity = prefs.getString("from_city") ?? "Минск";
    return '$fromCity- $city';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: FutureBuilder<String>(
          future: _loadPreferences(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            } else if (snapshot.hasError) {
              return const Text("Error loading preferences");
            } else {
              return Container(
                color: const Color(0xff242529),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color(0xff2261BC),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data ?? "",
                          style: AppFonts.title3,
                        ),
                        Text(
                          "${selectedDate.toString().substring(8, 10)} , 1 пассажир",
                          style: AppFonts.title4,
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: BlocBuilder<SeeAllTicketsBloc, SeeAllTicketsState>(
        builder: (context, state) {
          if (state is SeeAllTicketsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SeeAllTicketsSuccess) {
            return ListView.builder(
              itemCount: state.all_tickets.length,
              itemBuilder: (context, index) {
                final ticket = state.all_tickets[index] ?? {};
                final badge = ticket["badge"] ?? "No Badge";
                final price = (ticket["price"]?["value"] ?? 0).toDouble();
                final providerName = ticket["provider_name"] ?? "Unknown";
                final company = ticket["company"] ?? "Unknown";
                final departure = ticket["departure"] ?? {};
                final arrival = ticket["arrival"] ?? {};
                final departureTown = departure["town"] ?? "Unknown";
                final departureDateStr = departure["date"] ?? "Unknown";
                final departureAirport = departure["airport"] ?? "Unknown";
                final arrivalTown = arrival["town"] ?? "Unknown";
                final arrivalDateStr = arrival["date"] ?? "Unknown";
                final arrivalAirport = arrival["airport"] ?? "Unknown";
                final hasTransfer = ticket["has_transfer"] ?? false;
                final hasVisaTransfer = ticket["has_visa_transfer"] ?? false;
                final luggage = ticket["luggage"] ?? {};
                final hasLuggage = luggage["has_luggage"] ?? false;
                final luggagePrice =
                    (luggage["price"]?["value"] ?? 0).toDouble();
                final handLuggage = ticket["hand_luggage"] ?? {};
                final hasHandLuggage = handLuggage["has_hand_luggage"] ?? false;
                final handLuggageSize = handLuggage["size"] ?? "Unknown";
                final isReturnable = ticket["is_returnable"] ?? false;
                final isExchangable = ticket["is_exchangable"] ?? false;

                print("Departure Date String: $departureDateStr");
                print("Arrival Date String: $arrivalDateStr");

                DateTime departureDate =
                    DateTime.tryParse(departureDateStr) ?? DateTime.now();
                DateTime arrivalDate =
                    DateTime.tryParse(arrivalDateStr) ?? DateTime.now();

                print("Parsed Departure Date: $departureDate");
                print("Parsed Arrival Date: $arrivalDate");

                Duration flightDuration = arrivalDate.difference(departureDate);
                String formattedDuration = formatDuration(flightDuration);

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TicketDisplay(
                          departureDate: departureDate,
                          isExchangable: isExchangable,
                          isReturnable: isReturnable,
                          handLuggageSize: handLuggageSize,
                          hasHandLuggage: hasHandLuggage,
                          luggagePrice: luggagePrice,
                          hasLuggage: hasLuggage,
                          luggage: luggage,
                          hasVisaTransfer: hasVisaTransfer,
                          hasTransfer: hasTransfer,
                          arrival: arrival,
                          arrivalAirport: arrivalAirport,
                          arrivalDate: arrivalDate,
                          arrivalTown: arrivalTown,
                          departureAirport: departureAirport,
                          departure: departure,
                          price: price,
                          providerName: providerName,
                          badge: badge,
                          company: company,
                          departureDateStr: departureDateStr,
                          departureTown: departureTown,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: const Color(0xff1D1E20),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 136,
                              height: 23,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color(0xff2261BC),
                              ),
                              child: Center(
                                child: Text(
                                  badge,
                                  style: AppFonts.title4,
                                ),
                              ),
                            ),
                            Text(
                              "Price: ${price.toStringAsFixed(0)}₽",
                              style: AppFonts.title1,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 12,
                                  backgroundColor: Color(0xffFF5E5E),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${DateFormat.Hm().format(departureDate)} -",
                                      style: AppFonts.title4,
                                    ),
                                    Text(
                                      departureAirport,
                                      style: AppFonts.text2,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "- ${DateFormat.Hm().format(arrivalDate)}",
                                      style: AppFonts.title4,
                                    ),
                                    Text(
                                      arrivalAirport,
                                      style: AppFonts.text2,
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "$formattedDurationч в пути/",
                                      style: AppFonts.text2,
                                    ),
                                    Text(
                                      hasVisaTransfer
                                          ? 'С пересадками'
                                          : 'Без пересадок',
                                      style: AppFonts.text2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is SeeAllTicketsError) {
            return Center(child: Text('Error: ${state.errorText}'));
          }
          return const Center(child: Text('No data available'));
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 203,
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(50), // Adjust the radius as needed
                color: const Color(0xff2261BC),
              ),
              child: FloatingActionButton(
                onPressed: () {},
                backgroundColor: Colors.transparent,
                elevation: 0, // Remove elevation to make it flat
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          "/Users/r27/StudioProjects/travel_app/assets/images/filter.svg"),
                      const Text(
                        "Фильтр",
                        style: AppFonts.title4,
                      ),
                      Spacer(),
                      SvgPicture.asset(
                          "/Users/r27/StudioProjects/travel_app/assets/images/graph.svg"),
                      const Text(
                        "График цен",
                        style: AppFonts.title4,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitHours = twoDigits(duration.inHours);
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return "$twoDigitHours:$twoDigitMinutes";
  }
}
