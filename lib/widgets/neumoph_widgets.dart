import 'package:flutter/material.dart';

class MyNumoph extends StatelessWidget {
  const MyNumoph({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.0,
      height: 500.0,
      color: Color(0xffed4c67),
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      child: Container(
        color: Color(0xffed4c67),
        child: Container(
          width: 184,
          height: 184,
          child: Icon(
            Icons.star,
            size: 61,
            color: Colors.amber,
          ),
          decoration: BoxDecoration(
            color: Color(0xffed4c67),
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xffcf2e49),
                Color(0xffff6a85),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0xffff6a85),
                offset: Offset(-20.0, -20.0),
                blurRadius: 37,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Color(0xffcf2e49),
                offset: Offset(20.0, 20.0),
                blurRadius: 37,
                spreadRadius: 0.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
