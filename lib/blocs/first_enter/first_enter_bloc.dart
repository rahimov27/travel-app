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
          .get('https://run.mocky.io/v3/7e55bf02-89ff-4847-9eb7-7d83ef884017');
      final data = response
          .data; // Adjust this based on your actual API response structure
      emit(FirstEnterSuccess(data: data));
    } catch (e) {
      emit(FirstEnterError(errorText: e.toString()));
    }
  }
}
