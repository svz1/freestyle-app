import 'package:flutter/material.dart';

class Custominput extends StatelessWidget {
  final String hintText ;
  final Function(String) onChanged ;
  final Function(String) onSubmitted ; 
  final FocusNode focusNode ;  
  final bool ispassword ; 
  Custominput({this.hintText,this.onChanged,this.onSubmitted,this.focusNode,this.ispassword});
  @override
  Widget build(BuildContext context) {
    bool _ispassword=ispassword??false ;
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
        obscureText: _ispassword,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
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