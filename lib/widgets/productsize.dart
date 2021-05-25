   import 'package:flutter/material.dart';

class prosize extends StatefulWidget {
  final List productsizes ;
  final Function(String) onSelected ;
  prosize({this.productsizes,this.onSelected}) ;
  @override
  _prosizeState createState() => _prosizeState();
}

class _prosizeState extends State<prosize> {
  int _selected=0 ;
  @override
  Widget build(BuildContext context) {
    return
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Row(
            children: [
              for(var i=0;i<widget.productsizes.length ;i++)
                GestureDetector(
                  onTap: () {
                    widget.onSelected("${widget.productsizes[i]}") ;
                  setState(() {
                    _selected=i ;
                  }) ;
  },
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color:_selected==i? Colors.deepOrange:Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(
                      4

                    ),

                    child: Text("${widget.productsizes[i]}",style: TextStyle(
                      fontWeight:FontWeight.w600,color:_selected==i?Colors.white:Colors.black,fontSize: 10
                    ),
                    ),
                  ),
                )
            ],
          ),
        );

  }
}
