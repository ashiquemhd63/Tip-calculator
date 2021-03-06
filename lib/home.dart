//import 'dart:html';

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
                    Text("Total per Person",style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      color: Colors.purple,
                    ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$ ${calculateTotalPerPerson(_billAmount, _personCounter, _tipPercentage)}",style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 34.9
                      ),),
                    )
                  ],
                ),
              ),
              width: 150,
              height: 150,

              decoration: BoxDecoration(
                color: Colors.purpleAccent.withOpacity(0.3),
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
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value){
                      try{
                        _billAmount=double.parse(value);
                      }catch(exception){
                        _billAmount=0.0;

                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Split",style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                if(_personCounter>1){
                                  _personCounter--;
                                }
                                else{

                                }
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration:  BoxDecoration(
                                borderRadius: BorderRadius.circular(7.0),
                                color: Colors.purple.shade100,

                              ),
                              child: Center(
                                child: Text(
                                  "-",style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Text("$_personCounter",style: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.purple.shade100,
                                borderRadius: BorderRadius.circular(7.0)
                              ),
                              child: Center(
                                child: Text("+",style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                              ),
                            ),
                          ),
                          //Tip

                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Tip",style: TextStyle(
                      color: Colors.grey.shade700,
                      ),
                      ),
                      Text("\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",style:TextStyle(
                        color: Colors.purple ,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,

                      ),
                      ),
                    ],
                  ),
                  //code for slider comes here
                  Column(
                    children: [
                      Text("$_tipPercentage%",style: TextStyle(
                        color: Colors.purple,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          value: _tipPercentage.toDouble(),
                          activeColor: Colors.purple,//When slider is active
                          inactiveColor: Colors.grey,
                          onChanged: (double value){
                            setState(() {
                              _tipPercentage=value.round();
                        });
                      }),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  calculateTotalPerPerson(double billAmount,int splitBy,int tipPercentage){
    var totalPerPerson=(calculateTotalTip(billAmount, splitBy, tipPercentage)+billAmount)/splitBy;
    return totalPerPerson.toStringAsFixed(2);

  }
  calculateTotalTip(double billAmount,int splitBy,int tipPercentage){
    double totalTip = 0.0;
    if(billAmount<0 || billAmount.toString().isEmpty || billAmount==null){
      //no go!
    }
    else{
      totalTip=(billAmount*tipPercentage)/100;
    }
    return totalTip;
  }

}


