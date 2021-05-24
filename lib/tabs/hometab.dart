import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/product.dart';
import 'package:flutter_app2/widgets/customactionbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart' ;

class hometab extends StatelessWidget {
final CollectionReference _productsref=FirebaseFirestore.instance.collection("products") ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        Stack(
        
          children: [
            FutureBuilder<QuerySnapshot>(
              future: _productsref.get(),
              builder: (context,snapshot) {
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(child: Text("error: ${snapshot.error}"),
                    ),
                  );
                }
                if(snapshot.connectionState==ConnectionState.done) {
                return ListView(
                  padding:EdgeInsets.only(
                    top: 30,
                    bottom: 0,

                  ),
                  children: snapshot.data.docs.map((document) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>productpage(productid: document.id,),
                        )
                        ) ;
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        height: 350,
                        margin:EdgeInsets.symmetric(
                          vertical:12,
                          horizontal:24,
                        ),
        child: Stack(
          children : [
            Container(
              height:350,
              child: ClipRRect(
                   borderRadius: BorderRadius.circular(12),
                   child: Image.network(
                                "${document.data()['images'][0]}",
                                    fit:BoxFit.cover,
                   ),
                 ),
            ),
          Positioned(

            bottom: 0,
            left:-10,
            right:0,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children:[
                  Text(document.data()['name']??"ProductName",style: TextStyle(fontWeight:FontWeight.bold),
                  ),

                  Text("                                     Rs : ""${document.data()['price']}"??"price",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          )
                      ],
        ),
                      ),
                    );


                  }).toList()
                )  ;
                }

                return Scaffold(
                  body: Center(child: CircularProgressIndicator(),
                  ),
                );

              },
            ),
            customactionbar(
              title: "Home",
              hastitle: true,
              hasbackarrow: false,
            ),
          ],
        )
        );
     
  }
}