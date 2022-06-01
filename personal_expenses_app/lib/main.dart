import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'home_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized(); // for close the landscape mode
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const CupertinoApp(
            home: HomePage(),
            theme: CupertinoThemeData(
              primaryColor: Colors.purple,
            ),
          )
        : MaterialApp(
            theme: ThemeData(
                errorColor: Colors.red,
                primaryColor: Colors.purple,
                textTheme: const TextTheme(
                    titleMedium: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                )),
                appBarTheme: const AppBarTheme(
                    titleTextStyle: TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                fontFamily: 'QuickSand',
                colorScheme: ColorScheme.fromSwatch(
                    accentColor: Colors.amber, primarySwatch: Colors.purple)),
            debugShowCheckedModeBanner: false,
            home: const HomePage(),
          );
  }
}
