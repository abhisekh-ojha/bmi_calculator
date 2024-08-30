import 'package:flutter/material.dart';
import '../Components/constants.dart';

class BottomButton extends StatelessWidget {

  const BottomButton({super.key, required this.buttonTitle, required this.onPressed});

  final String buttonTitle;
  final void Function() onPressed;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.only(
          top: 15.0,
        ),
        color: kBottomButtonColor,
        width: double.infinity,
        height: kBottomButtonHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomButtomTextStyle,
          ),
        ),
      ),
    );
  }
}