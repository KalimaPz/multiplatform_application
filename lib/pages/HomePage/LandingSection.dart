import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_application/actions/ActionRetriveGitHubData.dart';
import 'package:multiplatform_application/models/GitHubProfileModel.dart';

import 'NavigatorBar.dart';

class LandingSection extends StatefulWidget {
  const LandingSection({Key key}) : super(key: key);

  @override
  _LandingSectionState createState() => _LandingSectionState();
}

class _LandingSectionState extends State<LandingSection> {
  bool isLoad = true;
  String avatarUrl = "";
  initialAction() async {
    final GitHubProfileModel res_github_profile =
        await ActionRetriveGitHubData.getProfile();

    setState(() {
      avatarUrl = res_github_profile.avatarUrl;
      isLoad = false;
    });
  }

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(60),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Color(0xff5142B4),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          )),
      child: Column(
        children: [
          NavigatorBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                // color: Colors.blue.withOpacity(0.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedTextKit(
                            isRepeatingAnimation: false,
                            animatedTexts: [
                              TyperAnimatedText(
                                  "Donnukrit Satirakul\n Front End / Mobile Developer \nat Allicorn Tech Co. Ltd. Phuket, TH\n(1 Year of Experience)",
                                  textAlign: TextAlign.center,
                                  textStyle: TextStyle(
                                      fontSize: 28, color: Colors.white))
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: isLoad
                          ? Container(
                              width: 350,
                              height: 350,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(5000),
                              child: Container(
                                width: 350,
                                height: 350,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                        image: NetworkImage(avatarUrl))),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
