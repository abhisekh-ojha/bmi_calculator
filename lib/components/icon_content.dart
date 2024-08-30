import 'package:flutter/material.dart';
import '../components/constants.dart';


class InnerCardContent extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  const InnerCardContent({super.key, required this.cardIcon, required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          cardIcon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          cardText,
          style: kIconTextStyle,
        )
      ],
    );
  }
}