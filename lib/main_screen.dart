import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'container_box.dart';
import 'data_container.dart';
late Color activeColor = Color(0xff0073dd);
const inActiveColor = Color(0xFF212121);
const primary = 1;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

// --------------------tapcolor------------------------------------
tapcolor(int acolor) {
  if (acolor == 1) {
    activeColor = Color(0xff0073dd);
  }
  if (acolor == 2) {
    activeColor = Color.fromARGB(255, 221, 59, 197);
  } else {
    activeColor = Color(0xff0073dd);
  }
  return activeColor;
}

// ------------------------------------------Default-values------------------------------------
class _MainScreenState extends State<MainScreen> {
  Color maleBoxColor = tapcolor(1);
  Color femaleBoxColor = inActiveColor;
  int height = 180;
  int weight = 40;
  int age = 25;
  String result = " ";
  String resultDetail = "Result here";
  double bmi = 0;
  // ---------------------------------------Gender-Updatebox------------------------------------------
  void updateBoxColor(int gender) {
    if (gender == 1) {
      if (maleBoxColor == inActiveColor) {
        maleBoxColor = tapcolor(1);
        ;
        femaleBoxColor = inActiveColor;
      } else {
        maleBoxColor = inActiveColor;
        femaleBoxColor = tapcolor(1);
        ;
      }
    } else {
      if (femaleBoxColor == inActiveColor) {
        femaleBoxColor = tapcolor(2);
        maleBoxColor = inActiveColor;
      } else {
        femaleBoxColor = inActiveColor;
        maleBoxColor = activeColor;
      }
    }
  }

// -------------------------------calculate-bmi-------bmi formula-----------------------------------------------------
  double calculateBmi(int weight, int height) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }

// ---------------------------------get-interpretation--------------message-----------------------------------------------
  String getInterpretation(double bmi) {
    if (bmi >= 30.0) {
      return 'Obesity' +
          '\n' +
          'You have higher than normal body weight. Try to excersie more.';
    } else if (bmi >= 25.0 && bmi < 30.0) {
      return 'OverWeight' +
          '\n' +
          'You have higher than normal body weight. Try to excersie more.';
    } else if (bmi > 18.5 && bmi < 25.0) {
      return 'Normal' + '\n' + 'You have a normal body weight. Good Job!';
    } else {
      return 'Underweight' +
          '\n'
              'You have lower than normal body weight. You can eat a bit more.';
    }
  }

// ------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: activeColor,
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              // ----------------------------------malecontainer------------------------------------------------
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(1);
                    });
                  },
                  child: ContainerBox(
                    boxColor: maleBoxColor,
                    childwidget: DataContainer(
                        icon: FontAwesomeIcons.male, title: 'MALE'),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      updateBoxColor(2);
                    });
                  },
                  // ---------------------------------------------femalecontainer----------------------------------------------------
                  child: ContainerBox(
                    boxColor: femaleBoxColor,
                    childwidget: DataContainer(
                        icon: FontAwesomeIcons.female, title: 'FEMALE'),
                  ),
                  //----------------------------------------------------------------------------------
                ),
              ),
            ],
          )),
          //-----------------------------------------------------hieght---------------------------------------------------
          Expanded(
            child: ContainerBox(
              boxColor: inActiveColor,
              childwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: textStyle1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: textStyle2,
                      ),
                      Text(
                        'cm',
                        style: textStyle1,
                      ),
                    ],
                  ),
                  // --------------------=-----------------slider--------------------------------------------------
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    activeColor: activeColor,
                    inactiveColor: inActiveColor,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          //-----------------------------------------weight-------------------------------------------------
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ContainerBox(
                  boxColor: inActiveColor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: textStyle1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text(
                            weight.toString(),
                            style: textStyle2,
                          ),
                          Text(
                            'kg',
                            style: textStyle1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (weight > 0) {
                                  weight--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //-----------------------------------------------------------age-------------------------------------------------
              Expanded(
                child: ContainerBox(
                  boxColor: inActiveColor,
                  childwidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: textStyle1,
                      ),
                      Text(
                        age.toString(),
                        style: textStyle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age > 0) {
                                  age--;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.minus,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (age < 100) {
                                  age++;
                                }
                              });
                            },
                            backgroundColor: activeColor,
                            child: Icon(FontAwesomeIcons.plus,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),

          //-------------------------------------------------calculate----------------------------------------------
          GestureDetector(
              onTap: () {
                setState(() {
                  double bmi = calculateBmi(weight, height);
                  result = bmi.toStringAsFixed(1);
                  resultDetail = getInterpretation(bmi);
                  // ----------------------------------------final-dialog----------------------------------------------------------------
                  showDialog(
                      context: context,
                      builder: (BuildContext contest) {
                        return Dialog(
                            backgroundColor: inActiveColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              color: inActiveColor,
                              height: 160.0,
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Your BMI',
                                    style: textStyle1,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    result.toString(),
                                    style: textStyle4,
                                  ),
                                  Text(
                                    resultDetail,
                                    style: textStyle1,
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ));
                      });
                });
              },
              //--------------------------------------------------------calculate button------------------------------------------
              child: Container(
                child: Center(
                  child: Text(
                    'Calculate',
                    style: textStyle3,
                  ),
                ),
                width: 190,
                height: 60.0,
                margin: EdgeInsets.only(top: 8.0, bottom: 18.0),
                decoration: BoxDecoration(
                    color: activeColor,
                    borderRadius: BorderRadius.all(Radius.circular(45))),
              ))
        ],
      ),
    );
  }
}
