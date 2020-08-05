//
//
//import 'dart:ui';
//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//
//import 'package:flutterw/base/BaseViewModel.dart';
//
/////This class is used to handle base view of Awarebox Application
//abstract class VideoPlayerBaseview<VM extends BaseViewModel>
//    extends BaseStatefulWidget<VM> {
//  VideoPlayerBaseview({Key key}):super(key:key);
//}
//
/////This class is used to handle base view state of Awarebox Application
//abstract class AwareboxBaseState<VM extends BaseViewModel,
//T extends VideoPlayerBaseview<VM>>
//    extends BaseStatefulScreen<VM, T, AwareboxErrorParser, BaseDto> {
//
//  /*
//  * Initialize the coupon details page state
//  * */
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//  }
//
//  @override
//  Widget getLayout() {
//    return AnnotatedRegion<SystemUiOverlayStyle>(
//      value: SystemUiOverlayStyle(
//        // statusBarColor: getStatusBarColor(),
//      ),
//      child: BaseWidget<VM>(
//        viewModel: getViewModel(),
//        onModelReady: onModelReady,
//        builder: (BuildContext context, VM model, Widget child) {
//          return getAwareboxBaseLayout();
//        },
//      ),
//    );
//  }
//
//  void onModelReady(VM model) {}
//
//  /*
//  * Return the AppBar widget
//  * */
//  Widget getAwareboxBaseLayout() {
//    return WillPopScope(
//      child: Scaffold(
////        resizeToAvoidBottomPadding: false,
////      resizeToAvoidBottomInset: false,
//        extendBodyBehindAppBar: true,
//
//        backgroundColor: scaffoldColor(),
//        key: scaffoldKey,
//        body: buildBody(),
//        appBar: buildAppbar(),
//      ),
//      onWillPop: willPopCallback,
//    );
//  }
//
//  Future<bool> willPopCallback() async {
//    // await showDialog or Show add banners or whatever
//    // then
//    return true; // return true if the route to be popped
//  }
//
//  @override
//  String onBoardingRoutePath() {
//    return '';
//  }
//
//  //to handle widget for error message
//  @override
//  String widgetErrorMessage() {
//    return 'There was an unexpected error. Please try again later';
//  }
//
//  @override
//  String errorLogo() {
//    return '';
//  }
//
//  //to set color to scaffold
//  @override
//  Color scaffoldColor() {
//    return Color(0xffD71717);
//  }
//
//  @override
//  Color statusBarColor() {
//    return Colors.black;
//  }
//}
//
/////This class is used to handle Error view of Awarebox Application
//class VideoPlayerError extends BaseError {
//  VideoPlayerError({message, type, error})
//      : super(message: message, type: type, error: error);
//}
//
/////This class is used to handle Error type of Awarebox Application
//class AwareboxErrorType extends BaseErrorType {
//  const AwareboxErrorType(value) : super(value);
//  static const AwareboxErrorType SERVER_ERROR_MESSAGE =
//  const AwareboxErrorType(6);
//}
//
/////This class is used to handle Error pasing of Awarebox Application
//class AwareboxErrorParser extends BaseErrorParser {
//  AwareboxErrorParser() : super();
//
//  @override
//  String parseError(BuildContext context, BaseError error) {
//    var errorMessage = super.parseError(context, error);
//    if (errorMessage != null) {
//      return errorMessage;
//    }
//
//    switch (error.type) {
//      case AwareboxErrorType.SERVER_ERROR_MESSAGE:
//        return error.message;
//      default:
//        return "There was an unexpected error. Please try again later";
//        break;
//    }
//  }
//}
//
/////This class is used to handle base Ui view of Awarebox Application
//abstract class AwareboxBaseModelWidget<VM>
//    extends BaseModelWidget<VM, AwareboxErrorParser> {}
