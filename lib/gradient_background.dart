import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground(this.color1, this.color2, {super.key});

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [color1, color2],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight),
      ),
      child: const Center(child: StyledText("Hello Welcome")),
    );
  }
}
