import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_app/resources/AppFonts.dart';

class TicketDisplay extends StatelessWidget {
  const TicketDisplay({
    super.key,
    required this.departureDate,
    required this.isExchangable,
    required this.isReturnable,
    required this.handLuggageSize,
    required this.hasHandLuggage,
    required this.luggagePrice,
    required this.hasLuggage,
    required this.arrival,
    required this.arrivalAirport,
    required this.arrivalDate,
    required this.arrivalTown,
    required this.badge,
    required this.company,
    required this.departure,
    required this.departureAirport,
    required this.departureTown,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.price,
    required this.providerName,
    required luggage,
    required departureDateStr,
  });

  final DateTime departureDate;
  final bool isExchangable;
  final bool isReturnable;
  final String handLuggageSize;
  final bool hasHandLuggage;
  final double luggagePrice;
  final bool hasLuggage;
  final bool hasVisaTransfer;
  final bool hasTransfer;
  final String arrivalAirport;
  final DateTime arrivalDate;
  final String arrivalTown;
  final String departureAirport;
  final String departureTown;
  final Map<String, dynamic> arrival;
  final Map<String, dynamic> departure;
  final String company;
  final String providerName;
  final double price;
  final String badge;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 293,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xff1D1E20),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        badge,
                        style: AppFonts.title3,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          SvgPicture.asset(hasHandLuggage
                              ? "/Users/r27/StudioProjects/travel_app/assets/images/checked.svg"
                              : "/Users/r27/StudioProjects/travel_app/assets/images/close.svg"),
                          Text(
                            "Ручная кладь ${hasHandLuggage ? "" : ""}",
                            style: AppFonts.text2,
                          ),
                          const Spacer(),
                          Text(
                            handLuggageSize,
                            style: AppFonts.text2
                                .copyWith(color: const Color(0xff5E5F61)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(hasLuggage
                              ? "/Users/r27/StudioProjects/travel_app/assets/images/checked.svg"
                              : "/Users/r27/StudioProjects/travel_app/assets/images/close.svg"),
                          Text(
                            hasLuggage ? "С багажом" : "Без багажа",
                            style: AppFonts.text2,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(isExchangable
                              ? "/Users/r27/StudioProjects/travel_app/assets/images/checked.svg"
                              : "/Users/r27/StudioProjects/travel_app/assets/images/close.svg"),
                          Text(
                            isExchangable
                                ? "Обмен платный"
                                : "Обмен бесплатный",
                            style: AppFonts.text2,
                          ),
                          SvgPicture.asset(
                              "/Users/r27/StudioProjects/travel_app/assets/images/question.svg"),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(isReturnable
                              ? "/Users/r27/StudioProjects/travel_app/assets/images/checked.svg"
                              : "/Users/r27/StudioProjects/travel_app/assets/images/close.svg"),
                          Text(
                            isReturnable ? "С возвратом" : "Без возврата",
                            style: AppFonts.text2,
                          ),
                          SvgPicture.asset(
                              "/Users/r27/StudioProjects/travel_app/assets/images/question.svg"),
                        ],
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
