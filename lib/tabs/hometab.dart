import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/product.dart';
import 'package:flutter_app2/services/firebase_service.dart';
import 'package:flutter_app2/widgets/customactionbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart' ;
import 'package:flutter_app2/widgets/productcard.dart';

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