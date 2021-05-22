import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  final String text; 
  final Function onPressed ; 
  final bool outlineBtn ; 
  custombutton({this.text, this.onPressed, this.outlineBtn}) ; 
  @override
  Widget build(BuildContext context) {
    bool _outlineBtn=outlineBtn?? false;
    return GestureDetector(
      onTap: onPressed,
          child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:_outlineBtn?Colors.transparent:Colors.white ,
          border: Border.all(color:Colors.white,width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(horizontal:24,vertical:8,),
        child: Text(text??"Text",style: TextStyle(color: _outlineBtn?Colors.white :Colors.black),),
        
      ),
    );
  }
}