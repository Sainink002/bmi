import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator_brain.dart';
import 'reuseable_card.dart';
import 'icon_containt.dart';
import 'constant.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_botton.dart';


enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender SelectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kactivecardcolour,
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 740,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            SelectedGender = Gender.male;
                          });
                        },
                        colour: SelectedGender == Gender.male
                            ? kactivecardcolour
                            : kinactivecolour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        onPress: () {
                          setState(() {
                            SelectedGender = Gender.female;
                          });
                        },
                        colour: SelectedGender == Gender.female
                            ? kactivecardcolour
                            : kinactivecolour,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  child: ReusableCard(
                    colour: kactivecardcolour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextstyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFE8D8E98),
                            thumbColor: Color(0xFFEB1555),
                            overlayColor: Color(0x15EB1555),
                            thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 24.0),
                          ),
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
                Expanded(
                    child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ReusableCard(
                        colour: kactivecardcolour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              weight.toString(),
                              style: kNumberTextstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: ReusableCard(
                        colour: kactivecardcolour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Age',
                              style: kLabelTextStyle,
                            ),
                            Text(
                              age.toString(),
                              style: kNumberTextstyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    }),
                                SizedBox(
                                  width: 10.0,
                                ),
                                RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
                // Expanded(child: child),
                // Expanded(child: child),
                BottomButton(
                  buttonTitle: 'CALCULATE',
                  onTap: () {

                    CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);



                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretation: calc.getInterpretation(),


                        )
                        )
                    );
                  },
                ) // Expanded(child: child),
              ],
            ),
          ),
        ));
  }
}
