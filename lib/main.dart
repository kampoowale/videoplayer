import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

    @override
   Widget build(BuildContext context) {
    return MultiProvider( //                              <--- MultiProvider
      providers: [
        ChangeNotifierProvider<
            MyModel>( //               <--- ChangeNotifierProvider
          create: (context) => MyModel(),
        ),
        ProxyProvider<MyModel, AnotherModel>( //          <--- ProxyProvider
          update: (context, myModel, anotherModel) {
            return AnotherModel(myModel);
          },
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<
                          MyModel>( //          <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: () {
                              myModel.doSomething('Goodbye');
                            },
                          );
                        },
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<
                        MyModel>( //            <--- MyModel Consumer
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),

                ],
              ),

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.red[200],
                  child: Consumer<
                      AnotherModel>( //          <--- AnotherModel Consumer
                    builder: (context, anotherModel, child) {
                      return RaisedButton(
                        child: Text('Do something else'),
                        onPressed: () {
                          anotherModel.doSomethingElse();
                        },
                      );
                    },
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class MyModel with ChangeNotifier {
  //                       <--- MyModel
  String someValue = 'Hello';

  void doSomething(String value) {
    someValue = value;
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel {
  //                                      <--- AnotherModel
  MyModel _myModel;

  AnotherModel(this._myModel);

  void doSomethingElse() {
    _myModel.doSomething('See you later');
    print('doing something else');
  }
}

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider( //                                     <--- MultiProvider
      providers: [
        ChangeNotifierProvider<MyModel>(create: (context) => MyModel()),
        ChangeNotifierProvider<AnotherModel>(create: (context) => AnotherModel()),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.green[200],
                      child: Consumer<MyModel>( //            <--- MyModel Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: (){
                              // We have access to the model.
                              myModel.doSomething();
                            },
                          );
                        },
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.blue[200],
                    child: Consumer<MyModel>( //              <--- MyModel Consumer
                      builder: (context, myModel, child) {
                        return Text(myModel.someValue);
                      },
                    ),
                  ),

                ],
              ),

              // SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Container(
                      padding: const EdgeInsets.all(20),
                      color: Colors.red[200],
                      child: Consumer<AnotherModel>( //      <--- AnotherModel Consumer
                        builder: (context, myModel, child) {
                          return RaisedButton(
                            child: Text('Do something'),
                            onPressed: (){
                              myModel.doSomething();
                            },
                          );
                        },
                      )
                  ),

                  Container(
                    padding: const EdgeInsets.all(35),
                    color: Colors.yellow[200],
                    child: Consumer<AnotherModel>( //        <--- AnotherModel Consumer
                      builder: (context, anotherModel, child) {
                        return Text('${anotherModel.someValue}');
                      },
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}

class MyModel with ChangeNotifier { //                        <--- MyModel
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
    notifyListeners();
  }
}

class AnotherModel with ChangeNotifier { //                   <--- AnotherModel
  int someValue = 0;
  void doSomething() {
    someValue = 5;
    print(someValue);
    notifyListeners();
  }
}*/

//VALUELISTENABLEPROVIDER
/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<MyModel>(//                              <--- Provider
      create: (context) => MyModel(),
      child: Consumer<MyModel>( //                           <--- MyModel Consumer
          builder: (context, myModel, child) {
            return ValueListenableProvider<String>.value( // <--- ValueListenableProvider
              value: myModel.someValue,
              child: MaterialApp(
                home: Scaffold(
                  appBar: AppBar(title: Text('My App')),
                  body: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Container(
                          padding: const EdgeInsets.all(20),
                          color: Colors.green[200],
                          child: Consumer<MyModel>( //       <--- Consumer
                            builder: (context, myModel, child) {
                              return RaisedButton(
                                child: Text('Do something'),
                                onPressed: (){
                                  myModel.doSomething();
                                },
                              );
                            },
                          )
                      ),

                      Container(
                        padding: const EdgeInsets.all(35),
                        color: Colors.blue[200],
                        child: Consumer<String>(//           <--- String Consumer
                          builder: (context, myValue, child) {
                            return Text(myValue);
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class MyModel { //                                             <--- MyModel
  ValueNotifier<String> someValue = ValueNotifier('Hello'); // <--- ValueNotifier
  void doSomething() {
    someValue.value = 'Goodbye';
    print(someValue.value);
  }
}*/


//STREAM PROVIDER
/*
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyModel>( //                       <--- StreamProvider
      initialData: MyModel(someValue: 'default value'),
      create: (context) => getStreamOfMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //                    <--- Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: (){
                          myModel.doSomething();
                        },
                      );
                    },
                  )
              ),

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}

Stream<MyModel> getStreamOfMyModel() { //                        <--- Stream
  return Stream<MyModel>.periodic(Duration(seconds: 1),
          (x) => MyModel(someValue: '$x'))
      .take(10);
}

class MyModel { //                                               <--- MyModel
  MyModel({this.someValue});
  String someValue = 'Hello';
  void doSomething() {
    someValue = 'Goodbye';
    print(someValue);
  }
}*/


//FUTURE PROVIDER

/*import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_screens/my_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<MyModel>( //                      <--- FutureProvider
      initialData: MyModel(someValue: 'default value'),
      create: (context) => someAsyncFunctionToGetMyModel(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('My App')),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Consumer<MyModel>( //                    <--- Consumer
                    builder: (context, myModel, child) {
                      return RaisedButton(
                        child: Text('Do something'),
                        onPressed: (){
                          myModel.doSomething();
                        },
                      );
                    },
                  )
              ),

              Container(
                padding: const EdgeInsets.all(35),
                color: Colors.blue[200],
                child: Consumer<MyModel>( //                    <--- Consumer
                  builder: (context, myModel, child) {
                    return Text(myModel.someValue);
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );

  }
}

Future<MyModel> someAsyncFunctionToGetMyModel() async { //  <--- async function
  await Future.delayed(Duration(seconds: 3));
  return MyModel(someValue: 'new data');
}

class MyModel { //                                               <--- MyModel
  MyModel({this.someValue});
  String someValue = 'Hello';
  Future<void> doSomething() async {
    await Future.delayed(Duration(seconds: 2));
    someValue = 'Goodbye';
    print(someValue);
  }
}*/

//CHANGENOTIFIERPROVIDER

//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//void main() => runApp(MyApp());
//
//
//
//class MyApp extends StatelessWidget {
//
//
//  @override
//  Widget build(BuildContext context) {
//    return ChangeNotifierProvider<MyModel>( //      <--- ChangeNotifierProvider
//      create: (context) => MyModel(),
//      child: MaterialApp(
//        home: Scaffold(
//          appBar: AppBar(title: Text('My App')),
//          body: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//
//              Container(
//                  padding: const EdgeInsets.all(20),
//                  color: Colors.green[200],
//                  child: Consumer<MyModel>( //                  <--- Consumer
//                    builder: (context, myModel, child) {
//                      return RaisedButton(
//                        child: Text('Do something'),
//                        onPressed: (){
//                          myModel.doSomething();
//                        },
//                      );
//                    },
//                  )
//              ),
//
//              Container(
//                padding: const EdgeInsets.all(35),
//                color: Colors.blue[200],
//                child: Consumer<MyModel>( //                    <--- Consumer
//                  builder: (context, myModel, child) {
//                    return Text(myModel.someValue);
//                  },
//                ),
//              ),
//
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class MyModel with ChangeNotifier { //                          <--- MyModel
//  String someValue = 'Hello';
//
//  void doSomething() {
//    someValue = 'Goodbye';
//    print(someValue);
//    notifyListeners();
//  }
//}


//DATABASE

//import 'package:flutter/material.dart';
//// change `flutter_database` to whatever your project name is
//import 'package:flutterw/database/database_helper.dart';
//import 'package:provider/provider.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'SQFlite Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//
//  // reference to our single class that manages the database
//  final dbHelper = DatabaseHelper.instance;
//
//
//  // homepage layout
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('sqflite'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            RaisedButton(
//              child: Text('insert', style: TextStyle(fontSize: 20),),
//              onPressed: () {_insert();},
//            ),
//            RaisedButton(
//              child: Text('query', style: TextStyle(fontSize: 20),),
//              onPressed: () {_query();},
//            ),
//            RaisedButton(
//              child: Text('update', style: TextStyle(fontSize: 20),),
//              onPressed: () {_update();},
//            ),
//            RaisedButton(
//              child: Text('delete', style: TextStyle(fontSize: 20),),
//              onPressed: () {_delete();},
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  // Button onPressed methods
//
//  void _insert() async {
//    // row to insert
//    Map<String, dynamic> row = {
//      DatabaseHelper.columnName : 'Bob',
//      DatabaseHelper.columnAge  : 23
//    };
//    final id = await dbHelper.insert(row);
//    print('inserted row id: $id');
//  }
//
//  void _query() async {
//    final allRows = await dbHelper.queryAllRows();
//    print('query all rows:');
//    allRows.forEach((row) => print(row));
//  }
//
//  void _update() async {
//    // row to update
//    Map<String, dynamic> row = {
//      DatabaseHelper.columnId   : 1,
//      DatabaseHelper.columnName : 'Mary',
//      DatabaseHelper.columnAge  : 32
//    };
//    final rowsAffected = await dbHelper.update(row);
//    print('updated $rowsAffected row(s)');
//  }
//
//  void _delete() async {
//    // Assuming that the number of rows is the id for the last row.
//    final id = await dbHelper.queryRowCount();
//    final rowsDeleted = await dbHelper.delete(id);
//    print('deleted $rowsDeleted row(s): row $id');
//  }
//}


//GET POST API CALL


//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//
//class Post {
//  final String userId;
//  final int id;
//  final String title;
//  final String body;
//
//  Post({this.userId, this.id, this.title, this.body});
//
//  factory Post.fromJson(Map<String, dynamic> json) {
//
//    return Post(
//      userId: json['userId'],
//      id: json['id'],
//      title: json['title'],
//      body: json['body'],
//    );
//  }
//
//  Map toMap() {
//    var map = new Map<String, dynamic>();
//    map["userId"] = userId;
//    map["title"] = title;
//    map["body"] = body;
//
//    return map;
//  }
//}
//
//Future<List<User>> fetchUsersFromGitHub() async {
//  final response = await http.get('https://api.github.com/users');
//  print(response.body);
//  List responseJson = json.decode(response.body.toString());
// // print('RESPONSE $responseJson');
//  //List<User> userList = createUserList(responseJson);
//  //return userList;
//}
//List<User> createUserList(List data){
//  List<User> list = new List();
//  for (int i = 0; i < data.length; i++) {
//    String title = data[i]["login"];
//    int id = data[i]["id"];
//    User movie = new User(name: title,id: id);
//    list.add(movie);
//  }
//  return list;
//}
//class User {
//  String name;
//  int id;
//  User({this.name,this.id});
//}
//Future<Post> createPost(String url, {Map body}) async {
//  return http.post(url, body: body).then((http.Response response) {
//    final int statusCode = response.statusCode;
//
//    if (statusCode < 200 || statusCode > 400 || json == null) {
//      throw new Exception("Error while fetching data");
//    }
//    return Post.fromJson(json.decode(response.body));
//  });
//}
//
//class MyApp extends StatelessWidget {
//  final Future<Post> post;
//
//  MyApp({Key key, this.post}) : super(key: key);
//  static final CREATE_POST_URL = 'https://jsonplaceholder.typicode.com/posts';
//  TextEditingController titleControler = new TextEditingController();
//  TextEditingController bodyControler = new TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: "WEB SERVICE",
//      theme: ThemeData(
//        primaryColor: Colors.deepOrange,
//      ),
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Create Post'),
//          ),
//          body: new Container(
//            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
//            child: new Column(
//              children: <Widget>[
//                new TextField(
//                  controller: titleControler,
//                  decoration: InputDecoration(
//                      hintText: "title....", labelText: 'Post Title'),
//                ),
//                new TextField(
//                  controller: bodyControler,
//                  decoration: InputDecoration(
//                      hintText: "body....", labelText: 'Post Body'),
//                ),
//                new RaisedButton(
//                  onPressed: () async {
//                    Post newPost = new Post(
//                        userId: "123", id: 0, title: titleControler.text, body: bodyControler.text);
//                    print(newPost.toMap());
//
//                    Post p = await createPost(CREATE_POST_URL,
//                        body: newPost.toMap());
//                    await fetchUsersFromGitHub();
//                    print(p.title);
//                  },
//                  child: const Text("Create"),
//                )
//              ],
//            ),
//          )),
//    );
//  }
//}
//
//void main() => runApp(MyApp());


//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//
//import 'app_screens/Note.dart';
//import 'app_screens/ParentWidget.dart';
//import 'app_screens/Post.dart';
//
//void main() => runApp(App());
//
//class App extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: HomePage(),
//    );
//  }
//}
//
//class HomePage extends StatefulWidget {
//
//  @override
//  _HomePageState createState() => _HomePageState();
//}
//
//class _HomePageState extends State<HomePage> {
//
//  List<Note> _notes = List<Note>();
//
//  Future<List<Note>> fetchNotes() async {
//    var url = 'https://raw.githubusercontent.com/boriszv/json/master/random_example.json';
//
//    var response = await http.get(url);
//
//    var notes = List<Note>();
//
//    if (response.statusCode == 200) {
//      var notesJson = json.decode(response.body);
//      for (var noteJson in notesJson) {
//        notes.add(Note.fromJson(noteJson));
//      }
//    }
//    return notes;
//  }
//
//  @override
//  void initState() {
//    fetchNotes().then((value) {
//      setState(() {
//        _notes.addAll(value);
//      });
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//          title: Text('Flutter listview with json'),
//        ),
//        body: ListView.builder(
//          itemBuilder: (context, index) {
//            return Card(
//              child: Padding(
//                padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, left: 16.0, right: 16.0),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    Text(
//                      _notes[index].title,
//                      style: TextStyle(
//                          fontSize: 22,
//                          fontWeight: FontWeight.bold
//                      ),
//                    ),
//                    Text(
//                      _notes[index].text,
//                      style: TextStyle(
//                          color: Colors.grey.shade600
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            );
//          },
//          itemCount: _notes.length,
//        )
//    );
//  }
//
//
//
//
//
//  Future<Post> createPost(String url, {Map body}) async {
//    return http.post(url, body: body).then((http.Response response) {
//      final int statusCode = response.statusCode;
//
//      if (statusCode < 200 || statusCode > 400 || json == null) {
//        throw new Exception("Error while fetching data");
//      }
//      return Post.fromJson(json.decode(response.body));
//    });
//  }
//
//// Call Web services
//
//  void callPost() async {
//  Post newPost = new Post(
//      userId: "123", id: 0, title: "tital", body: 'body');
//  Post p = await createPost(CREATE_POST_URL,
//  body: newPost.toMap());
//  print(p.title);
//},
//
//
//
//
//}
//
//
//
//
//
//
//
//
//
//
//
//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//
//import 'app_screens/User.dart';
//import 'dart:async';
//import 'package:http/http.dart' as http;
//void main() {
//  var jsonData = '{"city": "Mumbai","streets": ["address1","address2"]}';
//  var parsedJson = json.decode(jsonData);
//  var user = User.fromJson(parsedJson);
//
//  var jsonComplexData='{ "destination_addresses": [ "Philadelphia, PA, USA" ], "origin_addresses": [ "New York, NY, USA" ], "rows": [ { "elements": [ { "distance": { "text": "94.6 mi", "value": 152193 }, "duration": { "text": "1 hour 44 mins", "value": 6227 }, "status": "OK" } ] } ], "status": "OK" }';
//  var parsedComplexJson = json.decode(jsonComplexData);
//
//
//
//  runApp(MaterialApp(
//    title: 'Returning Data',
//    home: Padding(
//      padding: const EdgeInsets.all(8.0),
//      child: Container(color: Colors.deepPurple,
//
//     /*child: // The GestureDetector wraps the button.
//     GestureDetector(
//       // When the child is tapped, show a snackbar.
//       onTap: () {
//         final snackBar = SnackBar(content: Text("Tap"));
//
//        // Scaffold.of(context).showSnackBar(snackBar);
//       },
//       // The custom button
//       child: Container(
//         padding: EdgeInsets.all(12.0),
//         decoration: BoxDecoration(
//           color: Theme.of(context).buttonColor,
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Text('My Button'),
//       ),
//     );*/
//
//     child: GestureDetector(onTap: (){
//       print("gesture");
//     },
//     child:
//     Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: <Widget>[
//
//
//         GestureDetector(
//           child: new Text("Gesture"),
//           onTap: () {
//            print('gesture');
//           },
//         ),
//         GestureDetector(
//           child: new Text("Gesture"),
//           onTap: () {
//             print('gesture');
//           },
//         ),
//       Image(image: NetworkImage("https://www.google.com/search?q=Automated+serialization+using+code+generation+flutter&sxsrf=ALeKk02U13Unu8R4t7_uY0TYEcxIGl37Gg:1583476527087&source=lnms&tbm=isch&sa=X&ved=2ahUKEwiyzKDfnYXoAhUD4zgGHeNZAwAQ_AUoA3oECA8QBQ&biw=1366&bih=657#imgrc=GKWdjsUkAyVCKM"))
//
//
//
//
//       /*  InkWell(
//           child: Container(
//             child: Text("InkWell"),
//           ),
//           onTap: (){},
//         )*/
//       ],
//     ),
//
//     ),
//     ),
//
//     ),
//
//
//      ));
//
//
//
//
//}
//
//
//class Element {
//
//  void getResponse ()async
//  {
//
//
//
//
//
//    try {
//      final parsed = json.decode("json");
//    } on FormatException catch (e) {
//      print("That string didn't look like Json.");
//    } on NoSuchMethodError catch (e) {
//      print('That string was null!');
//    }
//
//
//    final response = await http.get("");
//    if (response.statusCode == 200) {
//      // use the data in response.body
//    } else {
//      // handle a failed request
//    }
//  }
//
//
//
//  Expanded element() {
//    /* return
//
//      GestureDetector(onTap: (){
//        print("q");
//      },
//      child: */ return Expanded(child: Icon(Icons.phone));
//    /* );}*/
//
//  }
//
//}


///*
//import 'dart:convert';
//
//import 'package:flutter/material.dart';
//
//import 'app_screens/Note.dart';
//import 'app_screens/ParentWidget.dart';
//import 'app_screens/User.dart';
//
//void main() {
//  //HomeScreen().jsons();
//  runApp(MaterialApp(
//    title: 'Returning Data',
//    home: ParentWidget(),
//  ));
//}
//
//class HomeScreen extends StatelessWidget {
//
//  bool tapped=true;
//  void _handleTap() {
//
//   // widget.onChanged(!widget.active);
//    if(tapped){
//      tapped=false;
//
//    }
//    else{
//      tapped=true;
//    }
//  }
//
//
//  @override
//  Widget build(BuildContext context) {
//    // This example adds a green border on tap down.
//    // On tap up, the square changes to the opposite state.
//
//    return  GestureDetector(onTap: _handleTap, */
///*GestureDetector(*//*
//
//      //onTapDown: _handleTapDown, // Handle the tap events in the order that
//      //onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
//      //  onTap: _handleTap,
//      //  onTapCancel: _handleTapCancel,
//      child: Container(
//        child: Center(
//          child: Text(tapped ? 'Active' : 'Inactive',
//              style: TextStyle(fontSize: 32.0, color: Colors.white)),
//        ),
//        width: 200.0,
//        height: 200.0,
//    */
///*    decoration: BoxDecoration(
//          color:
//          widget.active ? Colors.lightGreen[700] : Colors.grey[600],
//          border: _highlight
//              ? Border.all(
//            color: Colors.teal[700],
//            width: 10.0,
//          )
//              : null,
//        )*//*
////,
//      ),
//    );
//  }
//
//
//
// */
///* Widget build(BuildContext context) {
//    *//*
//*/
///*return Scaffold(
//      appBar: AppBar(
//        title: Text('Returning Data Demo'),
//      ),
//      body: Center(child: SelectionButton()),
//    );*//*
//*/
///*
//
//    return
//      GestureDetector(onDoubleTap: (){print('printzomato');},
//        child:  Container(
//
//          color: *//*
//*/
///*(tapped?Colors.blue: *//*
//*/
///*Colors.amber*//*
//*/
///*)*//*
//*/
///*,
//
//
//
//
//        ) ,
//      );
//
//
//  }*//*
//
//
//
//  }
//
//
//
//  void jsons(){
//
//    var jsonData = '{ "name" : "Dane", "alias" : "FilledStacks"  }';
//    var parsedJson = json.decode(jsonData);
//    var user = User.fromJson(parsedJson);
//    //print('${user.name} is ${user.alias}');
//  }
////}
//
//class SelectionButton extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return RaisedButton(
//      onPressed: () {
//        _navigateAndDisplaySelection(context);
//      },
//      child: Text('Pick an option, any option!'),
//    );
//  }
//
//  // A method that launches the SelectionScreen and awaits the result from
//  // Navigator.pop.
//  _navigateAndDisplaySelection(BuildContext context) async {
//    // Navigator.push returns a Future that completes after calling
//    // Navigator.pop on the Selection Screen.
//    final result = await Navigator.push(
//      context,
//      MaterialPageRoute(builder: (context) => SelectionScreen()),
//    );
//
//    // After the Selection Screen returns a result, hide any previous snackbars
//    // and show the new result.
//    Scaffold.of(context)
//      ..removeCurrentSnackBar()
//      ..showSnackBar(SnackBar(content: Text("$result")));
//  }
//}
//
//class SelectionScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Pick an option'),
//      ),
//      body: Center(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: RaisedButton(
//                onPressed: () {
//                  // Close the screen and return "Yep!" as the result.
//                  Navigator.pop(context, 'Yep!');
//                },
//                child: Text('Yep!'),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: RaisedButton(
//                onPressed: () {
//                  // Close the screen and return "Nope!" as the result.
//                  Navigator.pop(context, 'Nope.');
//                },
//                child: Text('Nope.'),
//              ),
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
//*/
