part of 'first_enter_bloc.dart';

@immutable
sealed class FirstEnterState {}

final class FirstEnterInitial extends FirstEnterState {}

final class SelectedCityInitial extends FirstEnterState {}

class FirstEnterLoading extends FirstEnterState {}

class FirstEnterSuccess extends FirstEnterState {
  final List<dynamic> data; // Adjust type based on your actual data structure
  FirstEnterSuccess({required this.data});
}

class FirstEnterError extends FirstEnterState {
  final String errorText;
  FirstEnterError({required this.errorText});
}
