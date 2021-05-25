import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class bottomtabs extends StatefulWidget {

final int selectedtab ; 
final Function(int) tabpressed ; 
bottomtabs({this.selectedtab,this.tabpressed}) ; 
  @override
  _bottomtabsState createState() => _bottomtabsState();
}

class _bottomtabsState extends State<bottomtabs> {
  int _selectedtab=0 ;


  @override
  Widget build(BuildContext context) {
    _selectedtab=widget.selectedtab??0 ;
    return Container(
       decoration: BoxDecoration(
         color: Colors.white,
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(12),
           topRight: Radius.circular(12)
         ) ,
         boxShadow:[
           BoxShadow(
           color : Colors.black.withOpacity(0.2),
           spreadRadius:1,
           blurRadius: 30 )
         ] ,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:[
          bottomtabsbtn(imagePath:"assets/images/tab_home.png",
          selected:_selectedtab==0?true:false,onPressed: () {
          widget.tabpressed(0);
          
          },),
          bottomtabsbtn(imagePath:"assets/images/tab_search.png",
          selected:_selectedtab==1?true:false,onPressed: () {
            widget.tabpressed(1); 
          },),
          bottomtabsbtn(imagePath:"assets/images/tab_saved.png",
          selected:_selectedtab==2?true:false,onPressed: () {
            widget.tabpressed(2);
          
          },),
          bottomtabsbtn(imagePath:"assets/images/tab_logout.png",
          selected:_selectedtab==3?true:false,onPressed: () {
           FirebaseAuth.instance.signOut() ;

          },)

        ],
      ),
         
      
    );
  }
}
 
 class bottomtabsbtn extends StatelessWidget {
     final String imagePath ;
     final bool selected ; 
     final Function onPressed ; 
  bottomtabsbtn({this.imagePath,this.selected,this.onPressed}) ;
   @override
   Widget build(BuildContext context) {
     bool _selected=selected??false ; 
     
     return GestureDetector(
       onTap: onPressed,
            child: Container(
        
         padding: EdgeInsets.symmetric(
           
           vertical:28,
           horizontal:24,
         ),
         decoration: BoxDecoration(
           border: Border(
             top: BorderSide(
               color: _selected ?Theme.of(context).accentColor:Colors.transparent,width: 2))
          ),
         child: Image(
           image: AssetImage(imagePath??"assets/images/tab_home.png"
           ),
           width: 22,
           height: 22,
           color: _selected?Theme.of(context).accentColor:Colors.black,
         ),
         
       ),
     );
   }
 }