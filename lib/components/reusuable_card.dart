import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color boxColor;
  final Widget? childCard;
  final void Function() onPress;

  const ReusableCard({super.key, required this.boxColor, this.childCard, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(15),
        child: childCard,
      ),
    );
  }
}