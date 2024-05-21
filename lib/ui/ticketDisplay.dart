import 'package:flutter/material.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Departure Date: ${departureDate.toString()}',
              style: AppFonts.text2,
            ),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
