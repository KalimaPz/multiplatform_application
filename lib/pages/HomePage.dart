import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

Widget navItem(BuildContext context,
    {String text, @required VoidCallback action}) {
  return GestureDetector(
    onTap: action,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(border: Border.all()),
      alignment: Alignment.center,
      child: Text(text),
    ),
  );
}

Widget navBar(BuildContext context, {List menuItem}) {
  var width = MediaQuery.of(context).size.width;
  List<PopupMenuItem> popupMenuItem = [];
  menuItem.forEach((element) {
    popupMenuItem.add(PopupMenuItem(child: Text(element)));
  });
  return Row(
    children: [
      Expanded(
          child: Container(
        child: Text("Expanded"),
        decoration: BoxDecoration(
            //  color: Colors.black
            ),
      )),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(),
          child: width <= 414
              ? PopupMenuButton(
                  onSelected: (value) => print(value),
                  itemBuilder: (context) => popupMenuItem,
                )
              : menuItem.length > 0
                  ? Container(
                      child: Row(
                        children: [
                          navItem(context,
                              action: () {}, text: menuItem[0] ?? "1"),
                          navItem(context,
                              action: () {}, text: menuItem[1] ?? "1"),
                          navItem(context,
                              action: () {}, text: menuItem[2] ?? "1"),
                          navItem(context,
                              action: () {}, text: menuItem[3] ?? "1"),
                        ],
                      ),
                    )
                  : Text("No Menu Items"),
        ),
      )
    ],
  );
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
            Container(
                decoration: BoxDecoration(color: Colors.blue),
                child: navBar(context, menuItem: ["1", "2", "3", "4"])),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.red[100],
              child: Center(child: Text("Main 1 Section")),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.green[100],
              child: Center(child: Text("Main 2 Section")),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.blue[100],
              child: Center(child: Text("Main 3 Section")),
            ),
          ],
        ),
      ),
    );
  }
}
