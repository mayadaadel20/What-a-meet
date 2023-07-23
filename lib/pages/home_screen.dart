import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Home Menu'),
        backgroundColor: Colors.lightBlue[700],
      ),
      backgroundColor: Colors.lightBlue[100],

      body: Container(
        padding: EdgeInsets.all(30.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            MyMenu(
              title: "Chatting", 
              icon: Icons.chat, 
              warna: Colors.green,
              tapOpt: 1),
            MyMenu(
                title: "Online Meeting",
                icon: Icons.group,
                warna: Colors.lightBlue,
                tapOpt: 2),
          ],
        ),
      ),
    );
  }
}

class MyMenu extends StatelessWidget {
  MyMenu({required this.title,required this.icon,required this.warna,required this.tapOpt});

  final String title;
  final IconData icon;
  final MaterialColor warna;
  final int tapOpt;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          if(tapOpt == 1){
            Navigator.of(context).pushReplacementNamed('home');
          }
          else if(tapOpt == 2){
            
          }
        },   
        splashColor: Colors.lightBlue,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icon,
                size: 70.0,
                color: warna,
              ),
              Text(
                title,
                style: new TextStyle(fontSize: 17.0),
              )
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
