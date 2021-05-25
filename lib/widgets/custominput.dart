import 'package:flutter/material.dart';

class Custominput extends StatelessWidget {
  final String hintText ;
  final Function(String) onChanged ;
  final Function(String) onSubmitted ; 
  final FocusNode focusNode ;  
  final bool ispassword ; 
  final TextInputAction textInputAction ;
  Custominput({this.hintText,this.onChanged,this.onSubmitted,this.focusNode,this.ispassword,this.textInputAction});
  @override
  Widget build(BuildContext context) {
    bool _ispassword=ispassword??false ;
    return Container(
      margin: EdgeInsets.symmetric(
         vertical:12,
         horizontal:24,
      ),
      decoration: BoxDecoration(
       color:Colors.grey[300],
       borderRadius: BorderRadius.circular(12)

        ),
      
      child: TextField(
        obscureText: _ispassword,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
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