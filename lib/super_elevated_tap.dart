import 'package:flutter/material.dart';

class SuperElevatedTap extends StatefulWidget {
  @override
  _SuperElevatedTapState createState() => _SuperElevatedTapState();
}

class _SuperElevatedTapState extends State<SuperElevatedTap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            ElevatorTap(
              margin: EdgeInsets.only(left: 40, bottom: 40),
            ),
            Align(
              alignment: Alignment.topRight,
              child: ElevatorTap(
                margin: EdgeInsets.only(right: 40, bottom: 40),
              ),
            ),
            // Positioned(
            //   left: 0,
            //   top: 0,
            //   child: ElevatorTap(),
            // ),
            // Positioned(
            //   right: 0,
            //   top: 0,
            //   child: ElevatorTap(),
            // ),
          ],
        ));
  }
}

class ElevatorTap extends StatefulWidget {
  final EdgeInsets margin;

  const ElevatorTap({Key key, this.margin}) : super(key: key);
  @override
  _ElevatorTapState createState() => _ElevatorTapState();
}

class _ElevatorTapState extends State<ElevatorTap> {
  bool _elevated = false;

  double _containerWidth;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _containerWidth = MediaQuery.of(context).size.width / 2;
    return GestureDetector(
      onTap: () {
        setState(() {
          _elevated = !_elevated;
        });
      },
      child: AnimatedContainer(
        height: _containerWidth,
        width: _containerWidth,
        decoration: BoxDecoration(
          color: _elevated? Colors.white:Colors.transparent,
          border: _elevated ? Border.all(width: 5) : null,
          borderRadius:
              _elevated ? BorderRadius.circular(20) : BorderRadius.zero,
        ),
        duration: Duration(milliseconds: 500),
        margin: _elevated ? widget.margin : EdgeInsets.zero,
        child: Center(
          child: Text('Container'),
        ),
      ),
      // child: Card(margin: EdgeInsets.all(20),
      //   elevation: _elevation,
      //   child: Center(
      //     child: Text('This is a elevated tile'),
      //   ),
      // ),
    );
  }
}
