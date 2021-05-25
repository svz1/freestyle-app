import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/services/firebase_service.dart';
import 'package:flutter_app2/widgets/customactionbar.dart';
import 'package:flutter_app2/widgets/custominput.dart';
import 'package:flutter_app2/widgets/productcard.dart';

class searchtab extends StatefulWidget {
  @override
  _searchtabState createState() => _searchtabState();
}

class _searchtabState extends State<searchtab> {
  Firebaseservices _firebaseservices=Firebaseservices() ;

  String _searchstring="" ;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Stack(
        children: [
          if(_searchstring.isEmpty)
            Text("search results")
          else

           FutureBuilder<QuerySnapshot>(
            future: _firebaseservices.productsref.orderBy("name").startAt([_searchstring]).endAt(["$_searchstring\uf8ff"]).get(),
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
                      return productcard(
                        title: document.data()['name'],
                        imageUrl: document.data()['images'][0],
                        price: "\$${document.data()['price']}",
                        productId: document.id,

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
          Padding(
            padding: const EdgeInsets.only(top:45 ),
            child: Custominput(
              hintText: "Search here...",
              onSubmitted: (value) {

                 setState(() {
                   _searchstring=value ;
                 });

                }

            ),
          ),
          SizedBox(height: 20,),
          Text("Search results",style: TextStyle(fontWeight: FontWeight.bold),),

        ],
      )




        );
  }
}