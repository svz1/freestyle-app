import 'package:flutter/material.dart';
import 'package:flutter_app2/widgets/customactionbar.dart';

class searchtab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
        Stack(
        
          children: [
            Center(
              child:
              Text("home tab"),
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