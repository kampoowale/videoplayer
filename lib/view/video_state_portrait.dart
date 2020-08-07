
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutterw/entity/video_details_entity.dart';
import 'package:flutterw/presentation/api_end_points.dart';
import 'package:flutterw/presentation/video.dart';
import 'package:flutterw/view/video_view.dart';
import 'package:flutterw/view_model/video_view_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:video_player/video_player.dart';

import 'package:chewie/chewie.dart';

class MyHomePage extends State<VideoView> {


  VideoViewModel model =
  VideoViewModel();

  Future<VideoDetails> fetchAlbum() async {
    setState(() {
      model.setBusy(true);
    });
    final response = await http.get(ApiEndPoints.url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      List<VideoDetails> videoDetails = json.map((i) =>
          VideoDetails.fromJson(i)).toList();
      setState(() {
        model.videoData = videoDetails;
      }
      );
      for (int response = 0; response <= 0; response ++) {
        videoDetails[response].url;
      }
      setState(() {
        model.setBusy(false);
      });
      print("data response${json.toString()}");
    } else {
      setState(() {
        model.setBusy(false);
      });
      print("Failed to load album");

      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return
      !model.busy ?
      MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Video Player'),
            ),
            body:

            ListView.builder(
              itemBuilder: (context, index) =>
                  GestureDetector(
                    onTap: () {},
                    child: videoContent(index, model),


                  ),
              itemCount: model.videoData.length,

            )

        ),
      ) : Container(

        color: Colors.white,
        child: Container(
          height:30,
          width: 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircularProgressIndicator(
              backgroundColor: Colors.pink,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),

            ),
          ),
        ),);
  }


  Widget videoContent(int index, VideoViewModel model) {
    return Container(

      child: Stack(
        children: <Widget>[
          ChewieListItem(
            videoPlayerController: VideoPlayerController.network(
              model.videoData[index].url,
            ),
          ),
          feeds(index,model)
        ],
      ),
    );
  }
  Widget feeds(int index,VideoViewModel model){
    return
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height:400,//double.infinity,
              width: 400,

              child: Align(
             alignment: FractionalOffset.bottomRight,
              child:

    Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[


                  addVideo(index),
                  getLikes(index),

                  getComment(index),
                  share(index),




              ],
            )
    ),
            ),


            Row(
              children: <Widget>[
                Text(model.videoData[index].user.name,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                  Center(
                    child: /*Container(
                      width: 18,
                      height: 18,
                      child: Center(child: Icon(Icons.check_circle, color:Colors.blue,)),
                      decoration: BoxDecoration(
                         // shape: BoxShape.circle,
                          color: Colors.white),
                    ),*/
                    Icon(Icons.check_circle, color:Colors.blue,)
                  )

//                  Container(
//                      //color:Colors.white,
//                      child: Icon(Icons.check_circle,color:Colors.blue)),
                )
              ],
            ),
    Text(model.videoData[index].title,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
            Row(
             // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.videoData[index].user.name,style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
    Container(
   // height:30,
    child: CircleAvatar(
    radius: 16,
    backgroundImage: NetworkImage(model.videoData[index].user.headshot),
    ),
    )
              ],
            ),
    ],
        ),
      );
  }

  Widget getLikes(int index){
    return Padding(
      padding:  EdgeInsets.only(top:8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
              child:GestureDetector(
//                onTap:(){
//                  setState((){model.like = model.like;});
//                },
                  child: Icon(Icons.favorite,color:model.like?Colors.red:Colors.white,size: 60,))
          ),
          Text(model.videoData[index].likeCount.toString(),style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
          )
        ],
      ),
    );

  }

  Widget getComment(int index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        Padding(
          padding:  EdgeInsets.only(top:18.0),
          child: Container(

              child:GestureDetector(
//                onTap:(){
//                  setState((){model.like = model.like;});
//                },
                  child: Icon(Icons.comment,color:Colors.white,size:60))
          ),
        ),
        Text(model.videoData[index].commentCount.toString(),style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)
        ),

      ],
    );

  }

  Widget share(int index){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[

        Padding(
          padding:  EdgeInsets.only(top:18.0),
          child: Container(

              child:GestureDetector(
//                onTap:(){
//                  setState((){model.like = model.like;});
//                },
                  child: Icon(Icons.screen_share,color:Colors.white,size:60))
          ),
        ),
        Text(model.videoData[index].commentCount.toString(),style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)
        ),

      ],
    );

  }
  Widget addVideo(int index){
     return Container(
     height:60,
     child: Stack(
       children: <Widget>[
         Container(
           child: CircleAvatar(
             radius: 26,
             backgroundImage: NetworkImage(model.videoData[index].user.headshot),
           ),
         ),
         Positioned(
             bottom: -16, right: 3,
   child: RawMaterialButton(
     constraints: BoxConstraints(minHeight: 0.0,maxHeight:15.0,minWidth:0.0,maxWidth:60.0),

     onPressed: () {},
    elevation: 2.0,
    fillColor: Colors.pink,
    child: Icon(
    Icons.add,
    size: 15.0,
   color: Colors.white
    ),
    //padding: EdgeInsets.all(5.0),
    shape: CircleBorder(),
    )
         )  // child: Icon(Icons.add,color:Colors.red))
       ],
     ),
   );
  }
}