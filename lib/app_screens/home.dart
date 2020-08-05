import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepPurple,
            child: Column(
              children: <Widget>[
                Row(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Home",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                    )),
                    Expanded(
                      child: Text(
                        "Home",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "Home",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                    )),
                    Expanded(
                        child: Text(
                      "Home",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                    )),
                    Expanded(
                        child: Text(
                      "Home",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                    ))
                  ],
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                      child: Text(
                        "Home",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        ))
                  ],
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                      child: Text(
                        "Home",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        ))
                  ],
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                      child: Text(
                        "Home",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        ))
                  ],
                ),
                Row(
                  textDirection: TextDirection.ltr,
                  children: <Widget>[
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                      child: Text(
                        "Home",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                      ),
                    ),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        )),
                    Expanded(
                        child: Text(
                          "Home",
                          textDirection: TextDirection.ltr,
                          style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                        ))
                  ],
                ),
                FlightImageAsset(),

            new Directionality(
              textDirection: TextDirection.rtl,
                child:

                FlightBookingButton())
              ],
            )));
  }
}
class FlightImageAsset extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage=AssetImage('images/demo.png');
    Image image=Image(image: assetImage);
    return Container(child: image);
  }

}

class FlightBookingButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.only(top:30.0),
      width: 250.0,
        height: 50.0,

      child: RaisedButton(
          color: Colors.orange,
          child: Text(
              "Book yur flight",
              style: TextStyle(color: Colors.white),

              textDirection: TextDirection.ltr),
          elevation:6.0 ,
          onPressed: (){
            _showDialog(context);
          }),
    );
  }

  void bookFlight(BuildContext context) {
    var alertDialog=AlertDialog(
      title: Text("Flight booked successfully"),
      content: Text("Have a good day"),
    );
    showDialog(
        context: context,
    builder: (BuildContext context){
      return alertDialog;

    }
    );
  }
  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
