import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
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
          //first Page
          Container(
            height: heightDevice - 56, //the default height of the appBar is 56
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.tealAccent,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold('Hello I am', 15)),
                    SizedBox(height: 15),
                    SansBold('Vanessa Paul', 55),
                    SansSmall('Flutter Engineer', 30),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(Icons.image),
                        SizedBox(
                          width: 20,
                        ),
                        SansSmall('vanessarosepaul5@gmail.com', 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(
                          width: 20,
                        ),
                        SansSmall('0717052716', 15),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_city),
                        SizedBox(
                          width: 20,
                        ),
                        SansSmall('Kakamega', 15),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: 140.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/imageCircle.png')),
                  ),
                ),
              ],
            ),
          ),

          //second page
          Container(
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/web.jpg',
                  height: widthDevice / 1.9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold('About me', 40),
                    SizedBox(
                      height: 15,
                    ),
                    SansSmall(
                        'Hello,I am Vanessa. I specialize in Flutter development',
                        15),
                    SansSmall(
                        'I strive to ensure astouding performance with state of',
                        15),
                    SansSmall(
                        'the art security for Android, Ios, Web, Mac, Linux and Windows',
                        15),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7),
                          child: SansSmall('Flutter,', 15)),
                      SizedBox(width: 7),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7),
                          child: SansSmall('Firebase,', 15)),
                      SizedBox(width: 7),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7),
                          child: SansSmall('Android,', 15)),
                      SizedBox(width: 7),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7),
                          child: SansSmall('Ios,', 15)),
                      SizedBox(width: 7),
                      Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.tealAccent,
                                style: BorderStyle.solid,
                                width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.all(7),
                          child: SansSmall('Windows', 15)),
                    ]),
                  ],
                ),
              ],
            ),
          ),

          //third section
          Container(
            height: heightDevice / 1.3,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SansBold('What I do?', 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AnimatedCard(
                        imagePath: 'assets/webL.png',
                        text: 'Web development',
                        fit: BoxFit.contain,
                      ),
                      AnimatedCard(
                        imagePath: 'assets/app.png',
                        text: 'App development',
                        fit: BoxFit.contain,
                        reverse: true,
                      ),
                      AnimatedCard(
                        imagePath: 'assets/firebase.png',
                        text: 'Backend development',
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          //fourth section
          SizedBox(
            height: 15.0,
          ),
          ContactWeb(),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
