import 'package:flutter/material.dart';
import 'package:noviindus_machine_test/controller/category_provider.dart';
import 'package:noviindus_machine_test/controller/content_provider.dart';
import 'package:noviindus_machine_test/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContentProvider(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            primarySwatch: Colors.blue,
          ),
          home: const HomeScreen()),
    );
  }
}
