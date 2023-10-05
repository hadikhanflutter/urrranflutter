import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_theme/provider/count_provider.dart';
import 'package:provider_theme/provider/example_oneprovider.dart';
import 'package:provider_theme/screens/count_example.dart';
import 'package:provider_theme/screens/example_one.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExapmleOneProvder()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ExampleOne(),
      ),
    );
  }
}
