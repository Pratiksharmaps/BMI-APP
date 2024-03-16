import 'package:flutter/material.dart';

const textStyle1 = TextStyle(
  color: Color(0xFFffffff),
  fontSize: 20.0,
);
// -------------------------container text font------------------------------------------
const textStyle2 = TextStyle(
    color: Color(0xFFffffff), fontSize: 55.0, fontWeight: FontWeight.w700);
// ---------------------resltstyle---------------------------------------------------
const textStyle4 = TextStyle(
    color: Color(0xFFffffff), fontSize: 50.0, fontWeight: FontWeight.w900);
// --------------------calcbutton--------------------------------------------------------------
const textStyle3 = TextStyle(
    color: Color(0xFFffffff), fontSize: 28.0, fontWeight: FontWeight.w600);
// --------------------------------iconstyle-------------------------------------------------
class DataContainer extends StatelessWidget {
  DataContainer({required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 70.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(title, style: textStyle1),
      ],
    );
  }
}
