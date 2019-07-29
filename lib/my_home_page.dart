import 'package:auto_size_text/auto_size_text.dart';
import 'package:bubble_icon_tab_bar/random_anim_container.dart';
import 'package:bubble_icon_tab_bar/super_elevated_tap.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildTabScreen(),
      // floatingActionButton: _buildFabButton(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _animTabLabel(
                  icon: Icons.home,
                  label: 'Home',
                  selected: _selectedTab == 0,
                  color: Colors.amber,
                  onTap: () {
                    if (_selectedTab != 0) {
                      setState(() {
                        _selectedTab = 0;
                      });
                    }
                  }),
              _animTabLabel(
                  icon: Icons.access_time,
                  label: 'Logger',
                  selected: _selectedTab == 1,
                  color: Colors.purpleAccent,
                  onTap: () {
                    if (_selectedTab != 1) {
                      setState(() {
                        _selectedTab = 1;
                      });
                    }
                  }),
              _animTabLabel(
                  icon: Icons.folder_open,
                  label: 'Document',
                  selected: _selectedTab == 2,
                  color: Colors.deepPurple,
                  onTap: () {
                    if (_selectedTab != 2) {
                      setState(() {
                        _selectedTab = 2;
                      });
                    }
                  }),
              _animTabLabel(
                  icon: Icons.menu,
                  label: 'Menu',
                  selected: _selectedTab == 3,
                  color: Colors.green,
                  onTap: () {
                    if (_selectedTab != 3) {
                      setState(() {
                        _selectedTab = 3;
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _buildTabScreen() {
    switch (_selectedTab) {
      case 0:
        return RandomAnimContainer();
      case 1:
        return SuperElevatedTap();
      case 2:
        return Container(
          color: Colors.indigo,
        );
      case 3:
        return Container(
          color: Colors.green,
        );

      default:
        return Container(
          color: Colors.red,
        );
    }
  }

  _animTabLabel(
      {IconData icon,
      String label,
      VoidCallback onTap,
      bool selected,
      Color color}) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 10),
        duration: Duration(milliseconds: 200),
        height: 35,
        width: selected ? 120 : 35,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          // color: _opacity != 0.0
          color: selected ? color.withOpacity(0.1) : Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              color: selected ? color : Colors.black54,
              size: 15,
            ),
            if(selected) SizedBox(width: 10),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: selected ? null : 0,
              child: AnimatedOpacity(
                opacity: selected ? 1.0 : 0.0,
                duration: Duration(milliseconds: 200),
                child: AutoSizeText(
                  label,
                  style: TextStyle(color: color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
