import 'package:flutter/material.dart';

class SkillSection extends StatelessWidget {
  const SkillSection({Key key}) : super(key: key);
  Container frontEndPanel() {
    return Container();
  }
  Container backEndEndPanel() {}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 100),
        child: Container(
          alignment: Alignment.topCenter,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Skills",
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.50),
                      ),
                      Text(
                          "Expert in Front End / Mobile Application Development. Now is focusing on Backend Development and UX/UI Designing",
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 0.35))
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.blue,
                    child: Column(
                      children: [],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
