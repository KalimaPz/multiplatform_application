import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:multiplatform_application/actions/ActionRetriveGitHubData.dart';
import 'package:multiplatform_application/models/GitHubProfileModel.dart';

class LandingSection extends StatefulWidget {
  const LandingSection({Key key}) : super(key: key);

  @override
  _LandingSectionState createState() => _LandingSectionState();
}

class _LandingSectionState extends State<LandingSection> {
  bool isLoad = true;
  String profileImage = "";
  String textIntro;
  initialAction() async {
    final GitHubProfileModel res = await ActionRetriveGitHubData.getProfile();
    setState(() {
      profileImage = res.avatarUrl;
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

  Widget introduction() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.green,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 64,
                  child: Image(
                    image: AssetImage('assets/images/programming.png'),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
                    TypewriterAnimatedText(
                      "Hello. I'm a Front-End / Mobile Developer at Alicorn Tech",
                      speed: Duration(milliseconds: 100),
                      curve: Curves.easeOutQuad,
                      textStyle: TextStyle(
                          color: Color(0xffFFA0A0).withOpacity(0.75),
                          fontSize: 28,
                          letterSpacing: 0.35,
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              // skeleton
              "My name is Donnukrit Satirakul. I'm graduate with a bachelor degree in Computer Engineering \nPrince of Songkhla University",
              // maxLines: 2,
              style: TextStyle(
                  color: Color(0xffFFA0A0).withOpacity(0.75),
                  fontSize: 18,
                  letterSpacing: 0.35,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              // color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 50),
                          decoration: BoxDecoration(
                            color: Color(0xffFFE3E3).withOpacity(0.9),
                            border: Border.all(
                                width: 2,
                                color: Color(0xffFFA0A0).withOpacity(0.5)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text("Let's Started"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Container(
            color: Color(0xff262A53).withOpacity(0.9),
            width: MediaQuery.of(context).size.width * 0.5,
            child: introduction(),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                SizedBox(
                  height: 256,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Image(
                      image: NetworkImage(
                          "https://scontent.fbkk5-4.fna.fbcdn.net/v/t1.6435-9/170615322_4069305883090622_5280854000416563373_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeF8rNCSHT4ZfBfnYJAIWpwlrRXKgDzqU1-tFcqAPOpTX9PiI7KDXchQwKVRi95WN9tVLyHX5TPhLUJGHizyw4PM&_nc_ohc=ygflOp3UDt0AX8mYiWa&_nc_ht=scontent.fbkk5-4.fna&oh=ac407eba459a0938395e781452b08ade&oe=60FCB48D"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
