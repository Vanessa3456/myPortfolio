import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: MobileDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            children: [
              //Intro first section
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 117.0,
                      backgroundColor: Colors.tealAccent,
                      child: CircleAvatar(
                        radius: 113.0,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 110.0,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('assets/imageCircle2.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),

                    //about section,second section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SansBold('About me', 35.0),
                          SizedBox(height: 15.0),
                          SansSmall(
                              'Hello I am Vanessa, I am a flutter engineer specializing in flutter development',
                              15.0),
                          SansSmall(
                              'I strive to ensure astounding performance with state of the art security of android,Ios,Mac,Linux ',
                              15.0),
                          SizedBox(
                            height: 10.0,
                          ),
                          Wrap(
                            spacing: 7.0,
                            runSpacing: 7.0,
                            children: [
                              tealContainer('flutter'),
                              tealContainer('Firebase'),
                              tealContainer('Android'),
                              tealContainer('Windows'),
                              tealContainer('Mac'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),

              //web development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: 'assets/webL.png', width: 200.0),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold('Web develpoment', 20.0),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SansSmall(
                    'I craft stunning web experiences that blend creativity with top-notch functionality.',
                    15.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                      imagePath: 'assets/app.png', width: 200.0, reverse: true),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold('App develpoment', 20.0),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SansSmall(
                    ' I create stunning, high-performance, cross-platform apps that captivate users and deliver seamless experiences.',
                    15.0),
              ),

              // backend development
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: 'assets/firebase.png', width: 200.0),
                  SizedBox(
                    height: 30.0,
                  ),
                  SansBold('Backend develpoment', 20.0),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: SansSmall(
                    'Power up your apps with seamless backend solutions! I specialize in Firebase, crafting robust, scalable systems that drive real-time performance and user engagement.',
                    15.0),
              ),
              SizedBox(height:20.0),
            ],
          ),
        ),
      ),
    );
  }
}
