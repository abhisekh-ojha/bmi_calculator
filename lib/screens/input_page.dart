import 'package:bmi_calculator/brain/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Components/icon_content.dart';
import '../Components/reusuable_card.dart';
import '../Components/constants.dart';
import 'results.dart';
import '../Components/round_icon_button.dart';
import '../Components/bottom_button.dart';

enum GenderType {
  male,
  female,
  other,
}

class BMIBody extends StatefulWidget {
  const BMIBody({super.key});

  @override
  State<BMIBody> createState() => _BMIBodyState();
}

class _BMIBodyState extends State<BMIBody> {
  GenderType selectedGender = GenderType.other;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BMI CALCULATOR'),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      // custom function created in reusable_card file
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.male;
                          });
                        },
                        boxColor: selectedGender == GenderType.male
                            ? kActiveContainerColor
                            : kInactiveContainerColor,
                        childCard: InnerCardContent(
                          cardIcon: FontAwesomeIcons.mars,
                          cardText: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = GenderType.female;
                          });
                        },
                        boxColor: selectedGender == GenderType.female
                            ? kActiveContainerColor
                            : kInactiveContainerColor,
                        childCard: InnerCardContent(
                          cardIcon: FontAwesomeIcons.venus,
                          cardText: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {},
                        boxColor: kActiveContainerColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'HEIGHT',
                              style: kIconTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  height.toString(),
                                  style: kNumTextStyle,
                                ),
                                const Text(
                                  'cm',
                                  style: kIconTextStyle,
                                )
                              ],
                            ),
                            SliderTheme(
                              // use of .of(context) and .copyWith
                              data: SliderTheme.of(context).copyWith(
                                  activeTrackColor: const Color(0xFFEB1555),
                                  inactiveTrackColor: const Color(0xFF8D8E98),
                                  thumbColor: const Color(0xFFEB1555),
                                  overlayColor: const Color(0x29EB1555),
                                  thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0,
                                  ),
                                  overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 30.0,
                                  )),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        onPress: () {},
                        boxColor: kActiveContainerColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'WEIGHT',
                              style: kIconTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    onPress: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                    buttonIcon: FontAwesomeIcons.minus),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  buttonIcon: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {},
                        boxColor: kActiveContainerColor,
                        childCard: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'AGE',
                              style: kIconTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    buttonIcon: FontAwesomeIcons.minus),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  onPress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  buttonIcon: FontAwesomeIcons.plus,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BottomButton(
                onPressed: () {
                  CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        weightResult: calc.getresult(),
                        bmiResult: calc.calculate(),
                        intrepretation: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
                buttonTitle: 'CALCULATE',
              ),
            ],
          ),
        ));
  }
}

