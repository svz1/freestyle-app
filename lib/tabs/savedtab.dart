
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/product.dart';
import 'package:flutter_app2/services/firebase_service.dart';
import 'package:flutter_app2/widgets/customactionbar.dart';

class savedtab extends StatelessWidget {
  final Firebaseservices _firebaseservices=Firebaseservices();

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Stack(
          children: [

            FutureBuilder<QuerySnapshot>(
              future: _firebaseservices.usersref.doc(_firebaseservices.getUserId())
                  .collection("Saved").get(),
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
                        top: 0,
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
                            child: FutureBuilder(
                              future: _firebaseservices.productsref.doc(document.id).get(),
                              builder: (context,productSnap) {
                                if(productSnap.hasError){
                                  return Container(
                                    child: Center(
                                      child: Text("${productSnap.error}"),
                                    ),
                                  );
                                }
                                if(productSnap.connectionState==ConnectionState.done) {
                                  Map _productMap=productSnap.data.data() ;
                                  return Padding(

                                    padding: const EdgeInsets.fromLTRB(
                                        0,80,0,0
                                    ),
                                    child: Row(

                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [

                                        Container(
                                          width: 90,
                                          height: 90,
                                          child: ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(8.0),
                                            child: Image.network(
                                              "${_productMap['images'][0]}",
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                            left: 16.0,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${_productMap['name']}",
                                                style: TextStyle(
                                                    fontSize: 18.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.w600),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(
                                                  vertical: 4.0,
                                                ),
                                                child: Text(
                                                  "\$${_productMap['price']}",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                              Text(
                                                "Size - ${document.data()['size']}",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    color: Colors.black,
                                                    fontWeight:
                                                    FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                                return Container(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );

                              },
                            )
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
      title: "Saved",
      hasbackarrow:false,
    ),
    ],

    ),
    );
  }
}