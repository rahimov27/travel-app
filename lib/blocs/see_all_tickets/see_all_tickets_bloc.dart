import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'see_all_tickets_event.dart';
part 'see_all_tickets_state.dart';

class SeeAllTicketsBloc extends Bloc<SeeAllTicketsEvent, SeeAllTicketsState> {
  SeeAllTicketsBloc() : super(SeeAllTicketsInitial()) {
    on<SeeAllTicketEvent>((event, emit) async {
      emit(SeeAllTicketsLoading());
      try {
        final dio = Dio();
        final response = await dio.get(
            "https://run.mocky.io/v3/670c3d56-7f03-4237-9e34-d437a9e56ebf");

        final allTickets = response.data["tickets"] ?? [];
        emit(SeeAllTicketsSuccess(all_tickets: allTickets));
      } catch (e) {
        emit(SeeAllTicketsError(errorText: e.toString()));
      }
    });
  }
}
