import 'package:flutter/material.dart';

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({Key key}) : super(key: key);

  @override
  _NavigatorBarState createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorBar> {
  bool _hovering = false;
  Color selected;
  _onMouseHover(bool hover) {
    if (hover) {
      setState(() {
        selected = Colors.amber;
      });
    } else {
      setState(() {
        selected = Colors.white;
      });
    }
  }

  AnimatedContainer navItem({String label}) {
    return AnimatedContainer(
      curve: Curves.easeIn,
      duration: Duration(milliseconds: 2000),
      child: Text(label,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.35,
              color: selected ?? Colors.white)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 60,
      // decoration: BoxDecoration(color: Colors.black87.withOpacity(0.75)),
      child: Row(
        children: [
          SizedBox(width: 20),
          Image(
            width: 30,
            image: AssetImage('assets/images/programming.png'),
          ),
          Spacer(),
          Container(
              child: Row(
            children: [
              MouseRegion(
                onHover: (e) => _onMouseHover(true),
                onExit: (e) => _onMouseHover(false),
                child: navItem(label: "About"),
              ),
              SizedBox(width: 20),
              MouseRegion(
                onHover: (e) => _onMouseHover(true),
                onExit: (e) => _onMouseHover(false),
                child: navItem(label: "Skills"),
              ),
              SizedBox(width: 20),
              MouseRegion(
                onHover: (e) => _onMouseHover(true),
                onExit: (e) => _onMouseHover(false),
                child: navItem(label: "Experience"),
              ),
              SizedBox(width: 20),
              MouseRegion(
                onHover: (e) => _onMouseHover(true),
                onExit: (e) => _onMouseHover(false),
                child: navItem(label: "Portfolio"),
              ),
              SizedBox(width: 20),
              MouseRegion(
                onHover: (e) => _onMouseHover(true),
                onExit: (e) => _onMouseHover(false),
                child: navItem(label: "Contact"),
              ),
              SizedBox(width: 20),
            ],
          )),
          Spacer(),
          Image(
              color: Colors.white,
              width: 30,
              image: AssetImage('assets/images/github.png')),
          SizedBox(width: 20),
          Image(width: 30, image: AssetImage('assets/images/linkedin.png')),
          SizedBox(width: 20),
        ],
      ),
    );
  }
}
