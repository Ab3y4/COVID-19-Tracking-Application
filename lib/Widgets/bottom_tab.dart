import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_app/Tabs/qrTab.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPress;
  BottomTabs({this.selectedTab, this.tabPress});
  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    _selectedTab = widget.selectedTab ?? 0;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 1.0,
              blurRadius: 30.0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomTabBtn(
            ImagePath: "Assets/home.png",
            Selected: _selectedTab == 0 ? true : false,
            onPressed: () {
              widget.tabPress(0);
            },
          ),
          BottomTabBtn(
            ImagePath: "Assets/places.png",
            Selected: _selectedTab == 1 ? true : false,
            onPressed: () {
              widget.tabPress(1);
            },
          ),
          BottomTabBtn(
            ImagePath: "Assets/qr.png",
            Selected: _selectedTab == 2 ? true : false,
            onPressed: () {
              widget.tabPress(2);
            },
          ),
          BottomTabBtn(
            ImagePath: "Assets/user.png",
            Selected: _selectedTab == 3 ? true : false,
            onPressed: () {
              widget.tabPress(3);
            },
          ),
        ],
      ),
    );
  }
}

class BottomTabBtn extends StatelessWidget {
  final String ImagePath;
  final bool Selected;
  final Function onPressed;
  BottomTabBtn({this.ImagePath, this.Selected, this.onPressed});

  @override
  Widget build(BuildContext context) {
    bool _selected = Selected ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: _selected ? Theme.of(context).accentColor : Colors.transparent,
          width: 2.0,
        ))),
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 20.0,
        ),
        child: Image(
          width: 30.0,
          height: 30.0,
          image: AssetImage(
            ImagePath ?? "Assets/home.png",
          ),
          color: _selected ? Theme.of(context).accentColor : Colors.black54,
        ),
      ),
    );
  }
}
