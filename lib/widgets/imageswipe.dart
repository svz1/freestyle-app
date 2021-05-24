   import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class imageswipe extends StatefulWidget {
  final List imagelist;
  imageswipe({this.imagelist}) ;
  @override
  _imageswipeState createState() => _imageswipeState();
}

class _imageswipeState extends State<imageswipe> {
  int _selectedpage=0 ;
  @override
  Widget build(BuildContext context) {
    return Container(
    height:300,
    child: Stack(
      children:[
        PageView(
          onPageChanged: (num) {
            setState(() {
              _selectedpage=num ;
            });
          },
      children: [
      for(var i=0; i<widget.imagelist.length ;i++)
      Container(
      child: Image.network("${widget.imagelist[i]}",fit:BoxFit.cover,
      ),


      )
      ],
      ),
        Positioned(

          bottom: 2,
          left: 0,
          right:0,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(var i=0; i<widget.imagelist.length ;i++)
                AnimatedContainer(
                  duration: Duration(
                   microseconds: 300
    ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  width: _selectedpage==i?25 :12,
                  height: 5,
                  decoration: BoxDecoration(
                   color:Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),

                  ),

                )

            ],
          ),
        )
      ],
    ),
    );
  }
}
