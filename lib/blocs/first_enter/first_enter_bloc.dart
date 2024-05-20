import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'first_enter_event.dart';
part 'first_enter_state.dart';

class FirstEnterBloc extends Bloc<FirstEnterEvent, FirstEnterState> {
  FirstEnterBloc() : super(FirstEnterInitial()) {
    on<ShowMainCardEvent>(_onShowMainCardEvent);
  }

  Future<void> _onShowMainCardEvent(
      ShowMainCardEvent event, Emitter<FirstEnterState> emit) async {
    emit(FirstEnterLoading());
    try {
      final dio = Dio();
      final response = await dio
          .get('https://run.mocky.io/v3/214a1713-bac0-4853-907c-a1dfc3cd05fd');
      final offers = response.data['offers'] ?? [];

      // Debug print to check the data
      print("Offers fetched: $offers");

      emit(FirstEnterSuccess(offers: offers));
    } catch (e) {
      emit(FirstEnterError(errorText: e.toString()));
    }
  }
}
