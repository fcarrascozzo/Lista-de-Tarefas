import 'package:flutter/material.dart';

class Dificuldade extends StatelessWidget {
  final int dificuldadeInformada;

  const Dificuldade({super.key, required this.dificuldadeInformada});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldadeInformada >= 1)
              ? const Color(0xff1D2538)
              : const Color(0xff475B74),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldadeInformada >= 2)
              ? const Color(0xff1D2538)
              : const Color(0xff475B74),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldadeInformada >= 3)
              ? const Color(0xff1D2538)
              : const Color(0xff475B74),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldadeInformada >= 4)
              ? const Color(0xff1D2538)
              : const Color(0xff475B74),
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldadeInformada >= 5)
              ? const Color(0xff1D2538)
              : const Color(0xff475B74),
        ),
      ],
    );
  }
}