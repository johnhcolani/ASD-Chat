import 'package:flutter/material.dart';

class ProfileBackground extends StatelessWidget {
  const ProfileBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.brightness == Brightness.light
        ? [Color(0xff111113), Color(0xff282a2e)]
        : [Color(0xff242426), Color(0xff97989D)];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
    );
  }
}