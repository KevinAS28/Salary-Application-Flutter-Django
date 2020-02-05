//import 'dart:html';

import 'package:mysalary/home/fab_with_icons.dart';
import 'package:mysalary/home/fab_bottom_app_bar.dart';
import 'package:mysalary/home/layout.dart';
import 'package:flutter/material.dart';
import 'package:mysalary/Library.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'package:mysalary/login.dart';
import 'package:mysalary/SalaryHistoryLayout.dart';
import 'package:mysalary/ProfileLayout.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, })  : super(key: key){

  }

  final String title;
  

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Center _body;
  List<Map> _notes;
  String _user_name;
  String _user_others;
  String _lastSelected;

  void _logoutDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Confirmation"),
          content: new Text("Are you sure you want to logout?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Logout"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => LoginScreen(),
          
        ));
              },
            ),
            
          ],
        );
      },
    );
  }
  void detailGaji(Map<String, dynamic> data){
    
    setState(() {
        _body =     Center(child: ListView.builder(
      itemCount: 1,
      itemBuilder: (context, pos) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
              child: new GestureDetector( child: Text(data["tahun"] + " " + data["bulan"] + " - Rp." + data["bersih"] + "\n" + "Gaji kotor: Rp." + data["kotor"] + "\n" + "Jam Lembur: " + data["lembur"] + " jam\n" + "Tunjangan: Rp." + data["tunjangan"], style: TextStyle(fontSize: 18.0,height: 1.6,),), onTap: ()=>{  }),
            ),
          )
        );

      },
    )) ;         
    });
  }

  void _selectedTab(int index) async{

    Map<String, String> dataSend = {};
    var dataRecv = (await hitApi(dataSend, "get_data"));
    var body = dataRecv.body;
    print("BODY: "+ body);
    var bodyJson = jsonDecode(body);
    
    _notes  = List<Map>.from(bodyJson["gaji"]);
    print("NOTES[0]: " + _notes[0]["tahun"]);
    setState(() {
      // _lastSelected = 'TAB: $index';
      if (index==0){
        Map<String, String> user = Map<String, String>.from(bodyJson["user"]);
        this._user_name = user["name"];
        this._user_others = user["others"];
        final _width = MediaQuery.of(context).size.width;
        final _height = MediaQuery.of(context).size.height;           
        Uint8List image = base64.decode(user["image"]);

        _body = profileLayout(this._user_name, this._user_others, _width, _height, image);
      }
      
      if (index==1){
        _body = salaryHistoryLayout(_notes, detailGaji);
      }
      
    });

    if (index==3){
      _logoutDialog();
    }
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _body,
      
      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Add',
        color: Colors.grey,
        selectedColor: Colors.red,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: _selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.menu, text: 'Profile'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'History'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Misc'),
          FABBottomAppBarItem(iconData: Icons.info, text: 'Logout'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildFab(BuildContext context) {
    final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return AnchoredOverlay(
      showOverlay: true,
      overlayBuilder: (context, offset) {
        return CenterAbout(
          position: Offset(offset.dx, offset.dy - icons.length * 35.0),
          child: FabWithIcons(
            icons: icons,
            onIconTapped: _selectedFab,
          ),
        );
      },
      child: FloatingActionButton(
        onPressed: () { },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
    );
  }
}
