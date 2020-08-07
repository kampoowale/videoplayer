
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

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
    return Chewie(
      controller: _chewieController,
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
