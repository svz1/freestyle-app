
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/customactionbar.dart';
import 'package:flutter_app2/widgets/imageswipe.dart';
import 'package:flutter_app2/widgets/productsize.dart';

class productpage extends StatefulWidget {
  final String productid;
  productpage({this.productid}) ;
  @override
  _productpageState createState() => _productpageState();
}

class _productpageState extends State<productpage> {
  final CollectionReference _productsref=FirebaseFirestore.instance.collection("products") ;

  final CollectionReference _usersref=FirebaseFirestore.instance.collection("users") ;
  User _user=FirebaseAuth.instance.currentUser ;
  String _selectedproductsize="0" ;
  Future _addtocart() {
    return _usersref
        .doc(_user.uid)
        .collection("cart")
        .doc(widget.productid)
         .set({"size":_selectedproductsize } );  }

         final SnackBar _snackbar=SnackBar(content: Text("Product added to the cart"),) ;

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
      List imageList=documentData['images'] ;
      List productsizes=documentData['size'] ;
      _selectedproductsize=productsizes[0];

      return ListView(
        padding: EdgeInsets.all(0),
        children: [

          imageswipe(imagelist:imageList,),

          Padding(
            padding: const EdgeInsets.only(
              top:24,
              left: 24,
              right: 24,
              bottom: 4,
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
            child: Text("Select Size ",style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          prosize(
            productsizes: productsizes,
            onSelected: (size) {
              _selectedproductsize=size;
            }
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment:MainAxisAlignment.start,
              mainAxisSize:MainAxisSize.max,
              children: [
                Container(
                  width :42,
                  height:42,
                  decoration:BoxDecoration(
                 color:Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                 ),
                  alignment:Alignment.center,
                  child: Image(
                    image:AssetImage("assets/images/tab_saved.png",),
                        width:13,
                    height: 21,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      _addtocart();
                      Scaffold.of(context).showSnackBar(_snackbar);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      margin: EdgeInsets.only(
                        left: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      alignment: Alignment.center,
                      child: Text("Add To Cart",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w600),),
                    ),
                  ),
                )
              ],
            ),
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
            hasbackground: false,
            hasbackarrow: true,
            hastitle: false,
          )
        ],
      )
    );
  }
}

