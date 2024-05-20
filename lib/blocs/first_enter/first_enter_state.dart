part of 'first_enter_bloc.dart';

@immutable
abstract class FirstEnterState {}

class FirstEnterInitial extends FirstEnterState {}

class FirstEnterLoading extends FirstEnterState {}

class FirstEnterSuccess extends FirstEnterState {
  final List<dynamic> offers;

  FirstEnterSuccess({required this.offers});
}

class FirstEnterError extends FirstEnterState {
  final String errorText;

  FirstEnterError({required this.errorText});
}
