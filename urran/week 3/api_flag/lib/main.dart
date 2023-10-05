import 'dart:convert';

import 'package:api_flag/home_work/example_four.dart';
import 'package:api_flag/home_work/sign_up.dart';
import 'package:api_flag/theme_data/dark_theme.dart';
import 'package:api_flag/theme_data/is_home_screens.dart';
import 'package:api_flag/theme_data/screen_drawer.dart';
import 'package:api_flag/theme_data/second_screen.dart';
import 'package:api_flag/theme_data/theme_changer.dart';
import 'package:api_flag/theme_data/theme_dark.dart';
import 'package:api_flag/theme_data/theme_light.dart';
import 'package:api_flag/theme_data/theme_notifier.dart';
import 'package:api_flag/theme_data/theme_text.dart';
import 'package:api_flag/theme_work/helper_widgets.dart';
import 'package:api_flag/theme_work/theme_brightness.dart';
import 'package:api_flag/theme_work/theme_manager.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(() {
      themelistener();
      super.dispose();
    });
  }

  @override
  void initState() {
    _themeManager.addListener(() {
      themelistener();
    });
    super.initState();
  }

  themelistener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const MyHomeUI(),
    );
  }
}

class MyHomeUI extends StatefulWidget {
  const MyHomeUI({Key? key}) : super(key: key);

  @override
  State<MyHomeUI> createState() => _MyHomeUIState();
}

class _MyHomeUIState extends State<MyHomeUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme App"),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              })
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                  'assets/images/IMG_20211210_164302.jpg',
                ),
              ),
              AddVerticalSpaces(10),
              Text('Your Name'),
              AddVerticalSpaces(10),
              Text('@yourusername'),
              AddVerticalSpaces(10),
              Text('This is a simple status'),
              TextField(),
              AddVerticalSpaces(10),
              ElevatedButton(onPressed: () {}, child: Text('Just Check')),
              AddVerticalSpaces(10),
              ElevatedButton(onPressed: () {}, child: Text('Just CLick')),
            ],
          ),
        ),
      ),
      floatingActionButton: Theme(
        data: Theme.of(context).copyWith(splashColor: Colors.blue),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}

/*
return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeChanger(),
      ),
    ],
    child: const MyApp(),
  ));
 */

/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SetThemeState();
  }

  void SetThemeState() async {
    final prefs = await SharedPreferences.getInstance();
    Provider.of<ThemeNotifier>(context, listen: false).SetThemeStatus(
      prefs.getBool('is_dark_theme') ?? false,
    );
  }

  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: ScreenDrawer(),
      body: context.watch<ThemeNotifier>().getScreenStatus
          ? IsHomeScreen()
          : SecondScreen(),
    );
  }
}
*/
