part of 'see_all_tickets_bloc.dart';

@immutable
sealed class SeeAllTicketsState {}

final class SeeAllTicketsInitial extends SeeAllTicketsState {}

class SeeAllTicketsLoading extends SeeAllTicketsState {}

class SeeAllTicketsSuccess extends SeeAllTicketsState {
  final List<dynamic> all_tickets;
  SeeAllTicketsSuccess({required this.all_tickets});
}

class SeeAllTicketsError extends SeeAllTicketsState {
  final String errorText;
  SeeAllTicketsError({required this.errorText});
}
