import 'package:flutter/material.dart';
void main()=>runApp(MaterialApp(
  home:Sampleapp()
));
class Sampleapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("ID CARD"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
      ),
    );
  }
}

    