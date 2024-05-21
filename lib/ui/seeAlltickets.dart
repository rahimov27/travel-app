import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/blocs/see_all_tickets/see_all_tickets_bloc.dart';

class SeeAllTickets extends StatelessWidget {
  const SeeAllTickets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Tickets"),
      ),
      body: BlocBuilder<SeeAllTicketsBloc, SeeAllTicketsState>(
        builder: (context, state) {
          if (state is SeeAllTicketsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is SeeAllTicketsSuccess) {
            return ListView.builder(
              itemCount: state.all_tickets.length,
              itemBuilder: (context, index) {
                final ticket = state.all_tickets[index] ?? {};
                final id = ticket["id"];
                final badge = ticket["badge"] ?? "No Badge";
                final price = ticket["price"]?["value"] ?? "N/A";
                final providerName = ticket["provider_name"] ?? "Unknown";
                final company = ticket["company"] ?? "Unknown";
                final departure = ticket["departure"] ?? {};
                final arrival = ticket["arrival"] ?? {};
                final departureTown = departure["town"] ?? "Unknown";
                final departureDate = departure["date"] ?? "Unknown";
                final departureAirport = departure["airport"] ?? "Unknown";
                final arrivalTown = arrival["town"] ?? "Unknown";
                final arrivalDate = arrival["date"] ?? "Unknown";
                final arrivalAirport = arrival["airport"] ?? "Unknown";
                final hasTransfer = ticket["has_transfer"] ?? false;
                final hasVisaTransfer = ticket["has_visa_transfer"] ?? false;
                final luggage = ticket["luggage"] ?? {};
                final hasLuggage = luggage["has_luggage"] ?? false;
                final luggagePrice = luggage["price"]?["value"] ?? "N/A";
                final handLuggage = ticket["hand_luggage"] ?? {};
                final hasHandLuggage = handLuggage["has_hand_luggage"] ?? false;
                final handLuggageSize = handLuggage["size"] ?? "Unknown";
                final isReturnable = ticket["is_returnable"] ?? false;
                final isExchangable = ticket["is_exchangable"] ?? false;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Company: $company",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Provider: $providerName"),
                          Text("Badge: $badge"),
                          Text("Price: ${price}₽"),
                          Text(
                              "Departure: $departureTown ($departureAirport) on $departureDate"),
                          Text(
                              "Arrival: $arrivalTown ($arrivalAirport) on $arrivalDate"),
                          Text("Transfer: ${hasTransfer ? 'Yes' : 'No'}"),
                          Text(
                              "Visa Transfer: ${hasVisaTransfer ? 'Yes' : 'No'}"),
                          Text(
                              "Luggage: ${hasLuggage ? 'Yes' : 'No'}, Price: ${hasLuggage ? '${luggagePrice}₽' : 'N/A'}"),
                          Text(
                              "Hand Luggage: ${hasHandLuggage ? 'Yes' : 'No'}, Size: $handLuggageSize"),
                          Text("Returnable: ${isReturnable ? 'Yes' : 'No'}"),
                          Text("Exchangable: ${isExchangable ? 'Yes' : 'No'}"),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is SeeAllTicketsError) {
            return Center(child: Text('Error: ${state.errorText}'));
          }
          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
