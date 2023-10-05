import 'package:api_flag/theme_data/is_home_screens.dart';
import 'package:api_flag/theme_data/second_screen.dart';
import 'package:api_flag/theme_data/theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenDrawer extends StatefulWidget {
  const ScreenDrawer({Key? key}) : super(key: key);

  @override
  State<ScreenDrawer> createState() => _ScreenDrawerState();
}

class _ScreenDrawerState extends State<ScreenDrawer> {
  bool is_dark_theme = false;

  @override
  Widget build(BuildContext context) {
    context.watch<ThemeNotifier>();
    return Scaffold(
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width - 100,
        height: MediaQuery.of(context).size.height,
        child: InkWell(
            onTap: () {
              is_dark_theme = !is_dark_theme;
              Provider.of<ThemeNotifier>(context, listen: false).SetThemeStatus(
                is_dark_theme,
              );
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.ac_unit,
                color: Theme.of(context).iconTheme.color,
                size: Theme.of(context).iconTheme.size,
              ),
            )),
      ),
      body: context.watch<ThemeNotifier>().getScreenStatus
          ? IsHomeScreen()
          : SecondScreen(),
    );
  }
}
