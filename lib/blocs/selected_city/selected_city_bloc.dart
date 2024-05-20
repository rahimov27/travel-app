import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selected_city_event.dart';
part 'selected_city_state.dart';

class SelectedCityBloc extends Bloc<SelectedCityEvent, SelectedCityState> {
  SelectedCityBloc() : super(SelectedCityInitial()) {
    on<SelectedCityEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
