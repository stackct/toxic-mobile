import 'package:Toxic/ui/ui_theme.dart';
import 'package:Toxic/ui/wallboard/wallboard_screen.dart';
import 'package:flutter/material.dart';
import 'ui/wallboard/wallboard_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final String _scaffoldAppBarTitle = WallboardState.APP_BAR_TITLE;
  @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'TOXIC',
        theme: UITheme.appTheme,
        home: Scaffold(
          drawer: buildHamburgerMenu(),
          appBar: AppBar(
            title: Text(_scaffoldAppBarTitle),
          ),
          body: WallboardScreen(),
        ),
        supportedLocales: [
          const Locale('en', 'US'),
        ],
      );
    }


    StatelessWidget buildHamburgerMenu() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text("Stu"),
          accountName: Text("toxic@stackct.com"),
          currentAccountPicture: Container( decoration:BoxDecoration(image: DecorationImage(image: ExactAssetImage('assets/face.png')), shape: BoxShape.circle ))),
        ListTile(title: Text("Wallboard"),),
        ListTile(title: Text("Dashboard"),),
        ListTile(title: Text("Projects"),),
        ListTile(title: Text("About"),)
      ],),
    );
  }
}