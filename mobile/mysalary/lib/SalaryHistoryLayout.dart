 
 import 'package:flutter/material.dart';

 

 Center salaryHistoryLayout(List<Map> salaryHistoryData, Function detailGaji){   
  return new Center(child: ListView.builder(
      itemCount: salaryHistoryData.length,
      itemBuilder: (context, pos) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: new GestureDetector( child: Text(salaryHistoryData[pos]["tahun"] + " " + salaryHistoryData[pos]["bulan"] + " - Rp." + salaryHistoryData[pos]["bersih"], style: TextStyle(fontSize: 18.0,height: 1.6,),), onTap: ()=>{detailGaji(salaryHistoryData[pos])}),
            ),
          )
        );

      },
    )) ;
 }