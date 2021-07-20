import 'package:flutter/material.dart';
import 'package:multiplatform_application/pages/HomePage/LandingSection.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          children: [
            LandingSection(),
          ],
        ),
      ),
    );
  }
}
