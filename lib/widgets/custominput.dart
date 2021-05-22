import 'package:flutter/material.dart';

class Custominput extends StatelessWidget {
  final String hintText ;
  Custominput({this.hintText});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
         vertical:12,
         horizontal:24,
      ),
      decoration: BoxDecoration(
       color:Colors.grey[700],
       borderRadius: BorderRadius.circular(12)

        ),
      
      child: TextField(
        decoration: InputDecoration(border: InputBorder.none,
        hintText:hintText?? "hint Text...",
        contentPadding:EdgeInsets.symmetric(
          horizontal:18,
          vertical:18,
        )
        ),
        
      ),
      
    );
  }
}