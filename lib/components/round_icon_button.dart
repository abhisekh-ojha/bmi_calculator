import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final void Function() onPress;

  const RoundIconButton({super.key, required this.buttonIcon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(buttonIcon),
    );
  }
}