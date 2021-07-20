import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multiplatform_application/pages/HomePage.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          textTheme: GoogleFonts.kanitTextTheme(Theme.of(context).textTheme)),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
