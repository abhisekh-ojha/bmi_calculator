import 'package:flutter/material.dart';
import '../Components/constants.dart';
import '../Components/reusuable_card.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  final String weightResult;
  final String bmiResult;
  final String intrepretation;

  const ResultPage({super.key, required this.weightResult, required this.bmiResult, required this.intrepretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: const Text('Your Result', style: kTitleTextStyle,),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              boxColor: kActiveContainerColor,
              onPress: () {},
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    weightResult,
                    style: kResultTitleTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      intrepretation,
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE', onPressed: (){
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}
