import 'package:flutter/material.dart';



class NewAppBackground extends StatelessWidget {
  const NewAppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gradientColors = theme.brightness == Brightness.dark
        ? [Color(0xff02020e), Color(0xff05045c)]
        : [Color(0xff0A0A28), Color(0xff2A28A4)];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: gradientColors,
        ),
      ),
    );
  }
}
