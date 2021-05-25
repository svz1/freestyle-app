import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class customactionbar extends StatelessWidget {
  @override
  final String title ;
  final bool hasbackarrow ;
  final bool hastitle ;
  final bool hasbackground;

  customactionbar({this.title,this.hasbackarrow,this.hastitle,this.hasbackground}) ;
  @override
  Widget build(BuildContext context) {
    bool _hasbackarrow=hasbackarrow??false ;
    bool _hastitle=hastitle??true ;
    bool _hasbackground=hasbackground?? true ;

    final CollectionReference _usersref=FirebaseFirestore.
    instance.
    collection("users") ;
    User _user=FirebaseAuth.instance.currentUser;
    return Container(
      decoration: BoxDecoration(
        gradient: _hasbackground? LinearGradient(
          colors: [
            Colors.white,
            Colors.white.withOpacity(0),
          ],
          begin: Alignment(0,0),
          end: Alignment(0,1) ,
        ) :null
      ),
      padding:EdgeInsets.only(
      top:56,
      left:24,
      right:24,
      bottom:24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if(_hasbackarrow) 
          GestureDetector(
            onTap: () {
              Navigator.pop(context) ;
            },
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.black,borderRadius: BorderRadius.circular(8),
              ),
              alignment:Alignment.center,
              child:Image(
                image: AssetImage("assets/images/back_arrow.png"
                ),
                width: 16,
                height: 16,
                ),

                 ),
          ),
               if(_hastitle)
          Text(title??"Action Bar",style: TextStyle(fontWeight:FontWeight.bold),),
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.black,borderRadius: BorderRadius.circular(8),
            ),
            alignment:Alignment.center,
            child: StreamBuilder(
              stream: _usersref.doc(_user.uid).collection("cart").snapshots(),
              builder: (context,snapshot) {
                int _totalitems=0;
                if(snapshot.connectionState==ConnectionState.active) {
                  List _documents=snapshot.data.docs;
                  _totalitems=_documents.length;
                }
                return Text("$_totalitems"??"0",style: TextStyle(fontSize: 18,fontWeight:FontWeight.w600,color:Colors.white,
                ),
                );
              },
            ),
          )
        ],
      ),
      
    );
  }
}