import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/utilits/global_vars.dart';

import 'game_core/game.dart';
import 'game_core/main_loop.dart';
//  SystemChrome.setPreferredOrientations(
//           [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
//       .whenComplete(() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
//         overlays: [SystemUiOverlay.bottom]);
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .whenComplete(() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
         overlays: [SystemUiOverlay.bottom]);

    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: MyApp(),
          ),
        )));
  });
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void didChangeDependencies() {
    initGame(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.png"), fit: BoxFit.cover)),
        child: Game());
  }

  void initGame(BuildContext context) {
    GlobalVars.screenWidth = MediaQuery.of(context).size.width;
    GlobalVars.screenHeight = MediaQuery.of(context).size.height;
  }
}