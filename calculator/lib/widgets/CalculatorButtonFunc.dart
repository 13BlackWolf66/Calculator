
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class CalculatorButtonFunc extends StatelessWidget {
  final String text;
  final Function callback;
  const CalculatorButtonFunc(
      {super.key, required this.text, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: 70,
        width: 70,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 200, 151, 3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(
              fontSize: 23,
            ),
          ),
          onPressed: () => callback(text),
        ),
      ),
    );
  }
}
