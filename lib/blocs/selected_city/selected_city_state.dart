part of 'selected_city_bloc.dart';

@immutable
abstract class SelectedCityState {}

class SelectedCityInitial extends SelectedCityState {}

class SelectedCityLoading extends SelectedCityState {}

class SelectedCitySuccess extends SelectedCityState {
  final List<dynamic> ticket_offers;

  SelectedCitySuccess({required this.ticket_offers});
}

class SelectedCityError extends SelectedCityState {
  final String errorText;

  SelectedCityError({required this.errorText});
}
