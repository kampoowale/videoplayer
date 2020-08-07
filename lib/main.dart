import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:flutterw/view/video_view.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(VideoView());

//
//class VideoView extends StatefulWidget{
//  MyHomePage createState()=>MyHomePage();
//
//}

//
//class MyHomePage extends State<VideoView> {
//
//
//
//  VideoViewModel model =
//  VideoViewModel();
//
////
////  @override
////  MyHomePage createState() {
////    return MyHomePage();
////  }
//  Future<VideoDetails> fetchAlbum() async {
//
//    setState((){
//    model.setBusy(true);});
//    print('call api');
//    final response = await http.get('https://www.pinkvilla.com/feed/video-test/video-feed.json');
//
//    if (response.statusCode == 200) {
//
//      final json = jsonDecode(response.body)as List;
//      List<VideoDetails> videoDetails = json.map((i)=>VideoDetails.fromJson(i)).toList();
//      setState(() {
//        model.videoData = videoDetails;
//      }
//      );
//      for  (int response =0;response<=0;response ++){
//        videoDetails[response].url;
//      }
//      setState((){
//        model.setBusy(false);});
//      print("data response${json.toString()}");
//    } else {
//      setState((){
//        model.setBusy(false);});
//      print("Failed to load album");
//
//      // If the server did not return a 200 OK response,
//      // then throw an exception.
//      throw Exception('Failed to load album');
//    }
//  }
//  @override
//  void initState(){
//    super.initState();
//    fetchAlbum();
//    // Additional initialization of the State
//  }
//  Future<VideoDetails> futureAlbum;
//
//  @override
//  Widget build(BuildContext context) {
//
//    return
//      !model.busy?
//      MaterialApp(
//        home:  Scaffold(
//        appBar: AppBar(
//          title: Text('Video Player'),
//        ),
//        body:
//
//       ListView.builder(
//          itemBuilder:(context,index)=>GestureDetector(
//            onTap:(){},
//          child:videoContent(index,model),
//
//
//            ),
//itemCount: model.videoData.length,
//
//     )
//
//    ),
//      ):Container(
//        width:40,
//        height :40,
//        child: CircularProgressIndicator(),);
//  }
//
//}
//Widget videoContent(int index,VideoViewModel model){
//  return  ChewieListItem(
//    videoPlayerController: VideoPlayerController.network(
//      model.videoData[index].url,
//    ),
//  );
//}
//
//
//class ChewieListItem extends StatefulWidget {
//  // This will contain the URL/asset path which we want to play
//  final VideoPlayerController videoPlayerController;
//  final bool looping;
//
//  ChewieListItem({
//    @required this.videoPlayerController,
//    this.looping,
//    Key key,
//  }) : super(key: key);
//
//  @override
//  _ChewieListItemState createState() => _ChewieListItemState();
//}
//
//class _ChewieListItemState extends State<ChewieListItem> {
//  ChewieController _chewieController;
//
//  @override
//  void initState() {
//    super.initState();
////     Wrapper on top of the videoPlayerController
////    _chewieController = ChewieController(
////      videoPlayerController: widget.videoPlayerController,
////      aspectRatio: 16 / 9,
////      // Prepare the video to be played and display the first frame
////      autoInitialize: true,
////      looping: widget.looping,
////      //fullScreenByDefault: true,
////      //autoPlay: true,
////      allowFullScreen: true,
////
////      showControls: true,
////      deviceOrientationsAfterFullScreen: [
////        //DeviceOrientation.landscapeRight,
////        //DeviceOrientation.landscapeLeft,
////        DeviceOrientation.portraitUp,
////        DeviceOrientation.portraitDown,
////      ],
////      // Errors can occur for example when trying to play a video
////      // from a non-existent URL
////      errorBuilder: (context, errorMessage) {
////        return Center(
////          child: Text(
////            errorMessage,
////            style: TextStyle(color: Colors.white),
////          ),
////        );
////      },
////    );
//
//
//
//
//
//    _chewieController = ChewieController(
//        videoPlayerController: widget.videoPlayerController,
//        aspectRatio: 9 / 16,
//        autoPlay: true,
//        fullScreenByDefault: false,
//        looping: true,
//        deviceOrientationsAfterFullScreen: [
//          DeviceOrientation.portraitUp,
//          DeviceOrientation.portraitDown
//        ],
////        placeholder: new Center(
////        //  child: RVTApp.BuildActivityIndicator(context),
////        ),
//        routePageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, provider) {
//          return AnimatedBuilder(
//            animation: animation,
//            builder: (BuildContext context, Widget child) {
//              return VideoScaffold(
//                child: Scaffold(
//                  resizeToAvoidBottomPadding: false,
//                  body: Container(
//                    alignment: Alignment.center,
//                    color: Colors.black,
//                    child: provider,
//                  ),
//                ),
//              );
//            },
//          );
//        }
//    );
//
//
//
//
//    _chewieController.addListener(() {
//      if (_chewieController.isFullScreen) {
//        SystemChrome.setPreferredOrientations([
//          DeviceOrientation.portraitUp,
//          DeviceOrientation.portraitDown,
//        ]);
//      } else {
//        SystemChrome.setPreferredOrientations([
//          DeviceOrientation.portraitUp,
//          DeviceOrientation.portraitDown,
//        ]);
//      }
//    }
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(30.0),
//      child: Chewie(
//        controller: _chewieController,
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    // IMPORTANT to dispose of all the used resources
//    widget.videoPlayerController.dispose();
//    _chewieController.dispose();
//  }
//}
//class VideoScaffold extends StatefulWidget {
//  const VideoScaffold({Key key, this.child}) : super(key: key);
//
//  final Widget child;
//
//  @override
//  State<StatefulWidget> createState() => _VideoScaffoldState();
//}
//
//class _VideoScaffoldState extends State<VideoScaffold> {
//  @override
//  void initState() {
//    SystemChrome.setPreferredOrientations([
//     // DeviceOrientation.portraitUp,
//     // DeviceOrientation.portraitDown,
//    ]);
//   // AutoOrientation.portraitMode();
//    super.initState();
//
//  }
//
//  @override
//  dispose(){
//    SystemChrome.setPreferredOrientations([
//    //  DeviceOrientation.portraitUp,
//     // DeviceOrientation.portraitDown,
//    ]);
//    //AutoOrientation.portraitMode();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return widget.child;
//  }
//
//
//
//}
//
//class VideoDetails {
//  String url;
//  int commentCount;
//  int likeCount;
//  int shareCount;
//  String title;
//  User user;
//
//  VideoDetails(
//      {this.url,
//        this.commentCount,
//        this.likeCount,
//        this.shareCount,
//        this.title,
//        this.user});
//
//  VideoDetails.fromJson(Map<String, dynamic> json) {
//    url = json['url'];
//    commentCount = json['comment-count'];
//    likeCount = json['like-count'];
//    shareCount = json['share-count'];
//    title = json['title'];
//    user = json['user'] != null ? new User.fromJson(json['user']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['url'] = this.url;
//    data['comment-count'] = this.commentCount;
//    data['like-count'] = this.likeCount;
//    data['share-count'] = this.shareCount;
//    data['title'] = this.title;
//    if (this.user != null) {
//      data['user'] = this.user.toJson();
//    }
//    return data;
//  }
//}
//
//class User {
//  String name;
//  String headshot;
//
//  User({this.name, this.headshot});
//
//  User.fromJson(Map<String, dynamic> json) {
//    name = json['name'];
//    headshot = json['headshot'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['name'] = this.name;
//    data['headshot'] = this.headshot;
//    return data;
//  }
//
//}
//class VideoViewModel
//{
//  bool _busy = false;
//  void setBusy(bool value) {
//    _busy = value;
//
//  }
//  bool get busy =>_busy;
//  List<VideoDetails>  _videoData;
//
// List<VideoDetails> get videoData => _videoData;
//
// set videoData(List<VideoDetails> value) {
//   _videoData = value;
//
// }
//
//}
//class MyHomePage extends State<VideoView> {
//
//
//
//  VideoViewModel model =
//  VideoViewModel();
//
////
////  @override
////  MyHomePage createState() {
////    return MyHomePage();
////  }
//  Future<VideoDetails> fetchAlbum() async {
//
//    setState((){
//    model.setBusy(true);});
//    print('call api');
//    final response = await http.get('https://www.pinkvilla.com/feed/video-test/video-feed.json');
//
//    if (response.statusCode == 200) {
//
//      final json = jsonDecode(response.body)as List;
//      List<VideoDetails> videoDetails = json.map((i)=>VideoDetails.fromJson(i)).toList();
//      setState(() {
//        model.videoData = videoDetails;
//      }
//      );
//      for  (int response =0;response<=0;response ++){
//        videoDetails[response].url;
//      }
//      setState((){
//        model.setBusy(false);});
//      print("data response${json.toString()}");
//    } else {
//      setState((){
//        model.setBusy(false);});
//      print("Failed to load album");
//
//      // If the server did not return a 200 OK response,
//      // then throw an exception.
//      throw Exception('Failed to load album');
//    }
//  }
//  @override
//  void initState(){
//    super.initState();
//    fetchAlbum();
//    // Additional initialization of the State
//  }
//  Future<VideoDetails> futureAlbum;
//
//  @override
//  Widget build(BuildContext context) {
//
//    return
//      !model.busy?
//      MaterialApp(
//        home:  Scaffold(
//        appBar: AppBar(
//          title: Text('Video Player'),
//        ),
//        body:
//
//       ListView.builder(
//          itemBuilder:(context,index)=>GestureDetector(
//            onTap:(){},
//          child:videoContent(index,model),
//
//
//            ),
//itemCount: model.videoData.length,
//
//     )
//
//    ),
//      ):Container(
//        width:40,
//        height :40,
//        child: CircularProgressIndicator(),);
//  }
//
//}
//Widget videoContent(int index,VideoViewModel model){
//  return  ChewieListItem(
//    videoPlayerController: VideoPlayerController.network(
//      model.videoData[index].url,
//    ),
//  );
//}
//
//
//class ChewieListItem extends StatefulWidget {
//  // This will contain the URL/asset path which we want to play
//  final VideoPlayerController videoPlayerController;
//  final bool looping;
//
//  ChewieListItem({
//    @required this.videoPlayerController,
//    this.looping,
//    Key key,
//  }) : super(key: key);
//
//  @override
//  _ChewieListItemState createState() => _ChewieListItemState();
//}
//
//class _ChewieListItemState extends State<ChewieListItem> {
//  ChewieController _chewieController;
//
//  @override
//  void initState() {
//    super.initState();
////     Wrapper on top of the videoPlayerController
////    _chewieController = ChewieController(
////      videoPlayerController: widget.videoPlayerController,
////      aspectRatio: 16 / 9,
////      // Prepare the video to be played and display the first frame
////      autoInitialize: true,
////      looping: widget.looping,
////      //fullScreenByDefault: true,
////      //autoPlay: true,
////      allowFullScreen: true,
////
////      showControls: true,
////      deviceOrientationsAfterFullScreen: [
////        //DeviceOrientation.landscapeRight,
////        //DeviceOrientation.landscapeLeft,
////        DeviceOrientation.portraitUp,
////        DeviceOrientation.portraitDown,
////      ],
////      // Errors can occur for example when trying to play a video
////      // from a non-existent URL
////      errorBuilder: (context, errorMessage) {
////        return Center(
////          child: Text(
////            errorMessage,
////            style: TextStyle(color: Colors.white),
////          ),
////        );
////      },
////    );
//
//
//
//
//
//    _chewieController = ChewieController(
//        videoPlayerController: widget.videoPlayerController,
//        aspectRatio: 9 / 16,
//        autoPlay: true,
//        fullScreenByDefault: false,
//        looping: true,
//        deviceOrientationsAfterFullScreen: [
//          DeviceOrientation.portraitUp,
//          DeviceOrientation.portraitDown
//        ],
////        placeholder: new Center(
////        //  child: RVTApp.BuildActivityIndicator(context),
////        ),
//        routePageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, provider) {
//          return AnimatedBuilder(
//            animation: animation,
//            builder: (BuildContext context, Widget child) {
//              return VideoScaffold(
//                child: Scaffold(
//                  resizeToAvoidBottomPadding: false,
//                  body: Container(
//                    alignment: Alignment.center,
//                    color: Colors.black,
//                    child: provider,
//                  ),
//                ),
//              );
//            },
//          );
//        }
//    );
//
//
//
//
//    _chewieController.addListener(() {
//      if (_chewieController.isFullScreen) {
//        SystemChrome.setPreferredOrientations([
//          DeviceOrientation.portraitUp,
//          DeviceOrientation.portraitDown,
//        ]);
//      } else {
//        SystemChrome.setPreferredOrientations([
//          DeviceOrientation.portraitUp,
//          DeviceOrientation.portraitDown,
//        ]);
//      }
//    }
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(30.0),
//      child: Chewie(
//        controller: _chewieController,
//      ),
//    );
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//    // IMPORTANT to dispose of all the used resources
//    widget.videoPlayerController.dispose();
//    _chewieController.dispose();
//  }
//}
//class VideoScaffold extends StatefulWidget {
//  const VideoScaffold({Key key, this.child}) : super(key: key);
//
//  final Widget child;
//
//  @override
//  State<StatefulWidget> createState() => _VideoScaffoldState();
//}
//
//class _VideoScaffoldState extends State<VideoScaffold> {
//  @override
//  void initState() {
//    SystemChrome.setPreferredOrientations([
//     // DeviceOrientation.portraitUp,
//     // DeviceOrientation.portraitDown,
//    ]);
//   // AutoOrientation.portraitMode();
//    super.initState();
//
//  }
//
//  @override
//  dispose(){
//    SystemChrome.setPreferredOrientations([
//    //  DeviceOrientation.portraitUp,
//     // DeviceOrientation.portraitDown,
//    ]);
//    //AutoOrientation.portraitMode();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return widget.child;
//  }
//
//
//
//}
//
//class VideoDetails {
//  String url;
//  int commentCount;
//  int likeCount;
//  int shareCount;
//  String title;
//  User user;
//
//  VideoDetails(
//      {this.url,
//        this.commentCount,
//        this.likeCount,
//        this.shareCount,
//        this.title,
//        this.user});
//
//  VideoDetails.fromJson(Map<String, dynamic> json) {
//    url = json['url'];
//    commentCount = json['comment-count'];
//    likeCount = json['like-count'];
//    shareCount = json['share-count'];
//    title = json['title'];
//    user = json['user'] != null ? new User.fromJson(json['user']) : null;
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['url'] = this.url;
//    data['comment-count'] = this.commentCount;
//    data['like-count'] = this.likeCount;
//    data['share-count'] = this.shareCount;
//    data['title'] = this.title;
//    if (this.user != null) {
//      data['user'] = this.user.toJson();
//    }
//    return data;
//  }
//}
//
//class User {
//  String name;
//  String headshot;
//
//  User({this.name, this.headshot});
//
//  User.fromJson(Map<String, dynamic> json) {
//    name = json['name'];
//    headshot = json['headshot'];
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['name'] = this.name;
//    data['headshot'] = this.headshot;
//    return data;
//  }
//
//}
//class VideoViewModel
//{
//  bool _busy = false;
//  void setBusy(bool value) {
//    _busy = value;
//
//  }
//  bool get busy =>_busy;
//  List<VideoDetails>  _videoData;
//
// List<VideoDetails> get videoData => _videoData;
//
// set videoData(List<VideoDetails> value) {
//   _videoData = value;
//
// }
//
//}