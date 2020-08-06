import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';


import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Future<Album> fetchAlbum() async {
    print('call api');
    final response = await http.get('https://jsonplaceholder.typicode.com/albums/1');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final json = jsonDecode(response.body);
      print("data response${json.toString()}");

      return Album.fromJson(json.decode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  Future<Album> futureAlbum;

  @override
  Widget build(BuildContext context) {
    futureAlbum = fetchAlbum();

    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: ListView(
        children: <Widget>[
//          ChewieListItem(
//            videoPlayerController: VideoPlayerController.asset(
//              'videos/IntroVideo.mp4',
//            ),
//            looping: true,
//          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://www.pinkvilla.com/feed/video-test/1GzPt1E-wXaMF_rAmm_E18XdTqqwVocde.mp4',
            ),
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://www.pinkvilla.com/feed/video-test/1GzPt1E-wXaMF_rAmm_E18XdTqqwVocde.mp4',
            ),
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://www.pinkvilla.com/feed/video-test/1GzPt1E-wXaMF_rAmm_E18XdTqqwVocde.mp4',
            ),
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://www.pinkvilla.com/feed/video-test/1GzPt1E-wXaMF_rAmm_E18XdTqqwVocde.mp4',
            ),
          ),
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              'https://www.pinkvilla.com/feed/video-test/1GzPt1E-wXaMF_rAmm_E18XdTqqwVocde.mp4',
            ),
          ),
//          ChewieListItem(
//            // This URL doesn't exist - will display an error
//            videoPlayerController: VideoPlayerController.network(
//              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/error.mp4',
//            ),
//          ),
        ],
      ),
    );
  }
}



class ChewieListItem extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
  final VideoPlayerController videoPlayerController;
  final bool looping;

  ChewieListItem({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _ChewieListItemState createState() => _ChewieListItemState();
}

class _ChewieListItemState extends State<ChewieListItem> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
//     Wrapper on top of the videoPlayerController
//    _chewieController = ChewieController(
//      videoPlayerController: widget.videoPlayerController,
//      aspectRatio: 16 / 9,
//      // Prepare the video to be played and display the first frame
//      autoInitialize: true,
//      looping: widget.looping,
//      //fullScreenByDefault: true,
//      //autoPlay: true,
//      allowFullScreen: true,
//
//      showControls: true,
//      deviceOrientationsAfterFullScreen: [
//        //DeviceOrientation.landscapeRight,
//        //DeviceOrientation.landscapeLeft,
//        DeviceOrientation.portraitUp,
//        DeviceOrientation.portraitDown,
//      ],
//      // Errors can occur for example when trying to play a video
//      // from a non-existent URL
//      errorBuilder: (context, errorMessage) {
//        return Center(
//          child: Text(
//            errorMessage,
//            style: TextStyle(color: Colors.white),
//          ),
//        );
//      },
//    );





    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 9 / 16,
        autoPlay: true,
        fullScreenByDefault: false,
        looping: true,
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown
        ],
//        placeholder: new Center(
//        //  child: RVTApp.BuildActivityIndicator(context),
//        ),
        routePageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondAnimation, provider) {
          return AnimatedBuilder(
            animation: animation,
            builder: (BuildContext context, Widget child) {
              return VideoScaffold(
                child: Scaffold(
                  resizeToAvoidBottomPadding: false,
                  body: Container(
                    alignment: Alignment.center,
                    color: Colors.black,
                    child: provider,
                  ),
                ),
              );
            },
          );
        }
    );




    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Chewie(
        controller: _chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}
class VideoScaffold extends StatefulWidget {
  const VideoScaffold({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  State<StatefulWidget> createState() => _VideoScaffoldState();
}

class _VideoScaffoldState extends State<VideoScaffold> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
     // DeviceOrientation.portraitUp,
     // DeviceOrientation.portraitDown,
    ]);
   // AutoOrientation.portraitMode();
    super.initState();

  }

  @override
  dispose(){
    SystemChrome.setPreferredOrientations([
    //  DeviceOrientation.portraitUp,
     // DeviceOrientation.portraitDown,
    ]);
    //AutoOrientation.portraitMode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }



}
class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return null;
//  }
