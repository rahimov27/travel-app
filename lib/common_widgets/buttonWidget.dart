import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/blocs/first_enter/first_enter_bloc.dart';
import 'package:travel_app/resources/AppFonts.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key, required this.color, required this.text});
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: color,
        ),
        onPressed: () {
          BlocProvider.of<FirstEnterBloc>(context).add(ShowMainCardEvent());
        },
        child: Text(
          text,
          style: AppFonts.buttonText1,
        ),
      ),
    );
  }
}
