import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_maquinaria_carvel/ThemeModel.dart';
import 'package:test_maquinaria_carvel/themes.dart';
import 'pages/home_page.dart';
import 'providers/character_provider.dart';
import 'dart:async';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharacterProvider()),
        ChangeNotifierProvider(create: (_) => ThemeModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
      builder: (context, ThemeModel themeNotifier, child) {
        return MaterialApp(
          theme: themeNotifier.isDark ? Themes.jhDark : Themes.jhLight,
          home: SplashScreenPage(),
        );
      },
    );
  }
}

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _checkPermissionsAndRedirect();
  }

  Future<void> _checkPermissionsAndRedirect() async {
    Timer(const Duration(seconds: 2), () {
      final provider = Provider.of<CharacterProvider>(context, listen: false);
      provider.loadCharacters();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/harry-potter.png',
              width: 170,
              height: 140,
            ),
            const SizedBox(height: 16),
            const Text(
              'by: Carlos Ivan Salinas Garcia',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
