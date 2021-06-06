import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class custom_btn extends StatelessWidget {
  final String text;
  final Function onpressed;
  final bool outline;
  custom_btn({this.text,this.onpressed,this.outline});


  @override
  Widget build(BuildContext context) {

    bool _outlinebtn = outline ?? false;
    return GestureDetector(
      onTap: onpressed,
      child: Container(
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: _outlinebtn ? Colors.transparent : Colors.blue,
            border: Border.all(
              color: Colors.blue,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: Text(
            text ?? "???",
            style: TextStyle(
                fontSize: 16.0,
                color: _outlinebtn ? Colors.black : Colors.white,
                fontWeight: FontWeight.w600
            ),
          )
      ),
    );
  }
}
