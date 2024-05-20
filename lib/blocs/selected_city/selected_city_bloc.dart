import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'selected_city_event.dart';
part 'selected_city_state.dart';

class SelectedCityBloc extends Bloc<SelectedCityEvent, SelectedCityState> {
  SelectedCityBloc() : super(SelectedCityInitial()) {
    on<LoadSelectedCity>(_selectedCityData);
  }

  Future<void> _selectedCityData(
      LoadSelectedCity event, Emitter<SelectedCityState> emit) async {
    emit(SelectedCityLoading());
    try {
      final dio = Dio();
      final response = await dio
          .get('https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017');
      final ticket_offers = response.data["tickets_offers"] ?? [];
      print(ticket_offers);
      // final title = data["tickets_offers"][0]["title"];
      // final time = data["tickets_offers"][0]["time_range"].join(' ');
      // final price = data["tickets_offers"][0]["price"]["value"].toString();
      emit(SelectedCitySuccess(ticket_offers: ticket_offers));
      // print('Data loaded: $title, $price, $time');
    } catch (e) {
      emit(SelectedCityError(errorText: e.toString()));
      print('Error loading data: ${e.toString()}');
    }
  }
}
