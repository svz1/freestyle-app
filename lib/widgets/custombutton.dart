import 'package:flutter/material.dart';

class custombutton extends StatelessWidget {
  final String text; 
  final Function onPressed ; 
  final bool outlineBtn ; 
  final bool isloading;
  custombutton({this.text, this.onPressed, this.outlineBtn,this.isloading,}) ; 
  @override
  Widget build(BuildContext context) {
    bool _outlineBtn=outlineBtn?? false;
    bool _isloading=isloading??false;
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
        child: Stack(
          children: [
            Visibility(visible:_isloading? false:true,
                          child: Center(
                child: Text(text??"Text",
                style:
                 TextStyle(
                   color: _outlineBtn?Colors.white :Colors.black),
                   ),
              ),
            ),
               
               Visibility(visible: _isloading,
                                child: Center(
                   child: SizedBox(
                     height: 30, 
                     width: 30,
                     child: CircularProgressIndicator()),
                 ),
               ), 
          ],
        ),
        
      ),
    );
  }
}