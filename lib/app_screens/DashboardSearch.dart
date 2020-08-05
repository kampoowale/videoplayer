

import 'package:flutter/material.dart';
import 'package:flutterw/app_screens/Counter.dart';

class DashboardSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          title: Text('AppBar Back Button'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                title: new TextField(
                  style: new TextStyle(color: Colors.black),
                  decoration: new InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(10.0),

                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(10.7),
                    ),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.white),
                      borderRadius: new BorderRadius.circular(25.7),
                    ),

                  ),
                ),
              ),

              Stack(
                children: <Widget>[


                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                  ),
                  Container(
                    width: 90,
                    height: 90,
                    color: Colors.green,
                  ),
                  Container(
                    width: 80, color: Colors.blue,
                  ),
                ],
              ),

              Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/demo.png'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),

                ],
              ),
      GestureDetector(
        onTap: () {
          print('MyButton was tapped!');
        },
        child: Container(
          height: 36.0,
          padding: const EdgeInsets.all(8.0),
          margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.lightBlue[500],
          ),
          child: Center(
            child: Text('State ful widget'),
          ),
        ),
      ),

              Counter()


            ],
          ),
          color: Colors.deepPurple,
        ),
      ),
    );
  }
}
