


import 'package:flutter/material.dart';
import 'package:flutter_app2/screens/product.dart';
  class productcard extends StatelessWidget {
    final String productId;
    final Function onPressed;
    final String imageUrl;
    final String title;
    final String price;
    productcard({this.onPressed, this.imageUrl, this.title, this.price, this.productId});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () {
        Navigator.push(context,MaterialPageRoute(
          builder: (context)=>productpage(productid: productId,),
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
                  "$imageUrl",
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
                    Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:17),),
                    SizedBox(width:150,),


                    Text(price,style: TextStyle(fontWeight: FontWeight.bold,fontSize:17,color: Colors.deepOrange),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

  }
}
