import 'package:Toxic/ui/UITheme.dart';
import 'package:Toxic/ui/wallboard/WallboardScreen.dart';
import 'package:flutter/material.dart';
import 'ui/wallboard/WallboardScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  String _scaffoldAppBarTitle = WallboardState.APP_BAR_TITLE;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: UITheme.appTheme,
      home: Scaffold(
        appBar: AppBar(title: Text(_scaffoldAppBarTitle),),
        drawer: buildHamburgerMenu(),
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