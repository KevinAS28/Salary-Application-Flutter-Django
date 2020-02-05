import 'dart:typed_data';

import 'package:flutter/material.dart';

Center profileLayout(String user_name, String user_others, double width, double height, Uint8List image){
  return new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: height/12,),
                
                new CircleAvatar(radius:width<height? width/4:height/4,backgroundImage: MemoryImage(image),),
                new SizedBox(height: height/25.0,),
                new Text(user_name, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: width/15, color: Colors.black),),
                new Padding(padding: new EdgeInsets.only(top: height/20, left: width/8, right: width/8),
                  child: new Text(user_others,
                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: width/20,color: Colors.black),textAlign: TextAlign.center)),
                // new Divider(height: height/30,color: Colors.white,),
                // new Row(
                //   children: <Widget>[
                //     rowCell(343, 'POSTS'),
                //     rowCell(673826, 'FOLLOWERS'),
                //     rowCell(275, 'FOLLOWING'),
                //   ],),
                // new Divider(height: height/30,color: Colors.white),
                // new Padding(padding: new EdgeInsets.only(left: width/8, right: width/8), child: new FlatButton(onPressed: (){},
                //   child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                //     new Icon(Icons.person),
                //     new SizedBox(width: width/30,),
                //     new Text('FOLLOW')
                //   ],)),color: Colors.blue[50],),),
              ],
            ),
          );
}