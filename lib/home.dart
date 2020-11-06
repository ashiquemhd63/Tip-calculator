import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage=0;
  int  _personCounter=1;
  double _billAmount=0.0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total per Person"),

                    Text("\$123")
                  ],
                ),
              ),
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.purpleAccent.shade100,
                borderRadius: BorderRadius.circular(12),

              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(//Setting Border style
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,

                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.green),
                    decoration: InputDecoration(//Decoration inside TextField
                      prefixText: "Bill Amount",
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}


