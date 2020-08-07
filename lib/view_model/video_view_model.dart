import 'package:flutterw/entity/video_details_entity.dart';

class VideoViewModel {
  bool _busy = false;

  void setBusy(bool value) {
    _busy = value;
  }

  bool get busy => _busy;
  List<VideoDetails> _videoData;

  List<VideoDetails> get videoData => _videoData;

  set videoData(List<VideoDetails> value) {
    _videoData = value;
  }

  bool _like=false;

  bool get like => _like;

    set like(bool value) {
    _like = value;
  }
}