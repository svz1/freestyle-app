
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/customactionbar.dart';

class productpage extends StatefulWidget {
  final String productid;
  productpage({this.productid}) ;
  @override
  _productpageState createState() => _productpageState();
}

class _productpageState extends State<productpage> {
  final CollectionReference _productsref=FirebaseFirestore.instance.collection("products") ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
         FutureBuilder(
             future: _productsref.doc(widget.productid).get(),
             builder: (context,snapshot) {
    if (snapshot.hasError) {
    return Scaffold(
    body: Center(
    child: Text("error: ${snapshot.error}"),
    ),
    );}

    if(snapshot.connectionState==ConnectionState.done) {
      Map<String,dynamic> documentData=snapshot.data.data();
      return ListView(
        children: [

          Container(
            height:300,
            child: Image.network("${documentData['images'][0]}"
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 24,
            ),
            child: Text("${documentData['name']}",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50),),
          ),


           Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 1,
                horizontal: 24,
              ),
              child: Text("Rs:${documentData['price']}",style: TextStyle(fontSize: 20,color: Colors.amber,
              ),

              ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 24,
            ),

            child: Text("${documentData['desc']}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 24,
            ),
            child: Text("Select Size ",style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      )
;    }

    return Scaffold(
      body: Center(child: CircularProgressIndicator(),
      ),
    );

             }
    ),
          customactionbar(
            hasbackarrow: true,
            hastitle: false,
          )
        ],
      )
    );
  }
}

