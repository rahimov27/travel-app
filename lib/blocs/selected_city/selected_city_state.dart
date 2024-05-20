part of 'selected_city_bloc.dart';

@immutable
abstract class SelectedCityState {}

class SelectedCityInitial extends SelectedCityState {}

class SelectedCityLoading extends SelectedCityState {}

class SelectedCitySuccess extends SelectedCityState {
  final String title;
  final String price;
  final String time;

  SelectedCitySuccess({
    required this.title,
    required this.price,
    required this.time,
  });
}

class SelectedCityError extends SelectedCityState {
  final String errorText;

  SelectedCityError({required this.errorText});
}
