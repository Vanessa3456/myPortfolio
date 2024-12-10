import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({super.key});

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {


  tealContainer(String text) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.tealAccent, style: BorderStyle.solid, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(7),
        child: SansSmall(text, 15));
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            drawer: WebDrawer(),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              iconTheme: IconThemeData(
                size: 25.0,
                color: Colors.black,
              ),
              title: TabsWebList(),
            ),
            body: ListView(
              children: [
                //about me,first section
                SizedBox(
                  height: 500.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SansBold('About me', 40.0),
                          SizedBox(height: 15.0),
                          SansSmall(
                              "Hi, I am Vanessa Rose Paul, a Flutter developer with a passion for building sleek,",
                              15.0),
                          SansSmall(
                              'high-performance applications across multiple platforms.',
                              15.0),
                          SansSmall('from mobile to web and beyond.', 15.0),
                          SansSmall(
                              'I love creating seamless solutions that deliver great user experiences.',
                              15.0),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(children: [
                            tealContainer('Flutter'),
                            SizedBox(width: 7),
                            tealContainer('Firebase'),
                            SizedBox(width: 7),
                            tealContainer('Android'),
                            SizedBox(width: 7),
                            tealContainer('IOS'),
                            SizedBox(width: 7),
                            tealContainer('Windows'),
                          ]),
                        ],
                      ),
                      CircleAvatar(
                        radius: 150.0,
                        backgroundColor: Colors.tealAccent,
                        child: CircleAvatar(
                          radius: 147.0,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                              radius: 145.0,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                'assets/imageCircle3.png',
                                filterQuality: FilterQuality.high,
                              )),
                        ),
                      ),
                    ],
                  ),
                ),

                //Web development ,second section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'assets/webL.png',
                      height: 250.0,
                      width: 250.0,
                    ),
                    SizedBox(
                      width: widthDevice / 3,
                      child: Column(
                        children: [
                          SansBold('Web development', 30.0),
                          SizedBox(height: 15.0),
                          SansSmall(
                              'Empowering businesses with dynamic,', 15.0),
                          SansSmall(
                              'responsive, and user-friendly websites!', 15.0),
                          SansSmall(
                              'As a skilled web developer, I bring your ideas to life with clean code,',
                              15.0),
                          SansSmall(
                              'modern design, and seamless functionality.',
                              15.0),
                          SansSmall(
                              'Lets build your online presence together!', 15.0)
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 20.0,
                ),
                //App development third section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: widthDevice / 3.0,
                      child: Column(
                        children: [
                          SansBold('App development', 30.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          SansSmall(
                              'Building high-performance, cross-platform apps with Flutter! ',
                              15.0),
                          SansSmall(
                              'I specialize in building seamless, visually stunning apps',
                              15.0),
                          SansSmall(
                              'that work flawlessly on mobile, web, and desktop. ',
                              15.0),
                          SansSmall(
                              'Lets transform your ideas into exceptional user experiences!',
                              15.0),
                        ],
                      ),
                    ),
                    AnimatedCard(
                      imagePath: 'assets/app.png',
                      height: 250,
                      width: 250,
                      reverse: true,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: 'assets/firebase.png',
                      height: 250.0,
                      width: 250.0,
                    ),
                    SizedBox(
                      width: widthDevice / 3.0,
                      child: Column(
                        children: [
                          SansBold('Back-end development', 30.0),
                          SizedBox(
                            height: 15.0,
                          ),
                          SansSmall(
                              'Experienced in building scalable backends with Firebase,',
                              15.0),
                          SansSmall(
                              ' including Firestore, Cloud Functions, and Authentication.',
                              15.0),
                          SansSmall(
                              ' I deliver secure, real-time, and efficient solutions for multi-platform applications',
                              15.0),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            )));
  }
}
