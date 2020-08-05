//---------------------------- ParentWidget ----------------------------

import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  _TapboxCState createState() => _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
    if(tapped){
      tapped=false;

    }
    else{
      tapped=true;
    }
  }

  Widget build(BuildContext context) {

    print("calledBUild");
    // This example adds a green border on tap down.
    // On tap up, the square changes to the opposite state.

    return
      Column(

        children: <Widget>[
          Text('hello'),



      GestureDetector(onTap: _handleTap, /*GestureDetector(*/
      //onTapDown: _handleTapDown, // Handle the tap events in the order that
      //onTapUp: _handleTapUp, // they occur: down, up, tap, cancel
    //  onTap: _handleTap,
    //  onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(tapped ? 'Active' : 'Inactive',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color:
          widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? Border.all(
            color: Colors.teal[700],
            width: 10.0,
          )
              : null,
        ),
      ),
    )],);
  }
  bool tapped=true;
  void _doubleTap() {

    setState(() {
      ;
      (tapped ? false : true);
    });
  }
}