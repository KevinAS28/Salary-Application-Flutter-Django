import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    
    
    return new Stack(children: <Widget>[
      // new Container(color: Colors.blue,),
      new Container(color: Colors.blue,),
      new Image.asset("images/walle.png", fit: BoxFit.fill),
      new BackdropFilter(
      filter: new ui.ImageFilter.blur(
      sigmaX: 6.0,
      sigmaY: 6.0,
      ),
      child: new Container(
      decoration: BoxDecoration(
      color:  Colors.blue.withOpacity(0.9),
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      ),)),
      new Scaffold(
          appBar: new AppBar(
            title: new Text(widget.title),
            centerTitle: false,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          drawer: new Drawer(child: new Container(),),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(height: _height/12,),
                new CircleAvatar(radius:_width<_height? _width/4:_height/4,backgroundImage: AssetImage("images/walle.png"),),
                new SizedBox(height: _height/25.0,),
                new Text('Eric Schmidt', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: _width/15, color: Colors.white),),
                new Padding(padding: new EdgeInsets.only(top: _height/20, left: _width/8, right: _width/8),
                  child:new Text('Laboris eiusmod velit in deserunt tempor consequat nulla ex. Exercitation sint Lorem laboris amet labore laborum velit enim ut Lorem duis nulla. Nulla proident incididunt dolor mollit ullamco minim exercitation excepteur consectetur. Deserunt labore veniam dolor voluptate qui laboris mollit. Voluptate irure nostrud enim elit voluptate aute aliquip exercitation. Commodo occaecat do magna fugiat ullamco excepteur magna. Velit laborum adipisicing laborum officia elit in aliqua minim qui ullamco non.',
                    style: new TextStyle(fontWeight: FontWeight.normal, fontSize: _width/25,color: Colors.white),textAlign: TextAlign.center,) ,),
                // new Divider(height: _height/30,color: Colors.white,),
                // new Row(
                //   children: <Widget>[
                //     rowCell(343, 'POSTS'),
                //     rowCell(673826, 'FOLLOWERS'),
                //     rowCell(275, 'FOLLOWING'),
                //   ],),
                // new Divider(height: _height/30,color: Colors.white),
                // new Padding(padding: new EdgeInsets.only(left: _width/8, right: _width/8), child: new FlatButton(onPressed: (){},
                //   child: new Container(child: new Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
                //     new Icon(Icons.person),
                //     new SizedBox(width: _width/30,),
                //     new Text('FOLLOW')
                //   ],)),color: Colors.blue[50],),),
              ],
            ),
          )
      )
    ],);
  }

  Widget rowCell(int count, String type) => new Expanded(child: new Column(children: <Widget>[
    new Text('$count',style: new TextStyle(color: Colors.white),),
    new Text(type,style: new TextStyle(color: Colors.white, fontWeight: FontWeight.normal))
  ],));
}
