import 'package:flutter/material.dart';
import 'package:flutterw/app_screens/FavouriteWidget.dart';
import 'package:flutterw/app_screens/Gestures.dart';

import 'ParentWidget.dart';

class Tutorial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButtonColumn(color, Icons.call, 'CALL'),
          _buildButtonColumn(color, Icons.near_me, 'ROUTE'),

      /* GestureDetector(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              'https://picsum.photos/250?image=9',
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              //return DetailScreen();
            }));
          },
        ),*/



          _buildButtonColumn(color, Icons.share, 'SHARE'),
        ],
      ),
    );



    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: Column(
          children: [
          topImage,
            titleSection,
           // buttonSection,
           // textSection,
            //option
          ],
        ),
      ),
    );
  }
  static bool value=true;
static void ontap(){
  if(value)
    value=false;
  else
    value=true;
}
  Widget option=

  GestureDetector(onTap: ontap,
 child: Container(
    padding: const EdgeInsets.all(32),
    child: Row(

      children: <Widget>[

        Expanded(child:

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: <Widget>[
            Icon(Icons.call,color: Colors.blue,),
            Text(value?'Call':'endcall',style: TextStyle(color: Colors.blue))
          ],

        )),
        Column(
          children: <Widget>[
            Icon(Icons.arrow_upward),
            Text('Route',style: TextStyle(color: Colors.blue))
          ],
        ),
        Column(
          children: <Widget>[
            Icon(Icons.call),
            Text('Call',style: TextStyle(color: Colors.blue))
          ],
        )

      ],
    ),
  ));



  Widget topImage=Container(
    child: Image.asset('images/demo.png'),

  );


  Widget textSection = Container(
    padding: const EdgeInsets.all(32),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
          'Alps. Situated 1,578 meters above sea level, it is one of the '
          'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
          'half-hour walk through pastures and pine forest, leads you to the '
          'lake, which warms to 20 degrees Celsius in the summer. Activities '
          'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true,
    ),
  );
  Widget titleSection = Container(
    padding: const EdgeInsets.all(32),
    child: Row(
      children: [
        Expanded(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
        /*3*/
       // FavoriteWidget(),
      ParentWidget(),
        Gestures(),

      /*  Icon(

          Icons.star,
          color: Colors.red[500],
        ),*/
        //Text('41'),
      ],
    ),
  );


  static Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }


}



class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open route'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            }
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

