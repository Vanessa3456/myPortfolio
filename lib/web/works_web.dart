import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class WorksWeb extends StatefulWidget {
  const WorksWeb({super.key});

  @override
  State<WorksWeb> createState() => _WorksWebState();
}

class _WorksWebState extends State<WorksWeb> {
  @override
  Widget build(BuildContext context) {


    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: WebDrawer(),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(
                size: 25.0,
                color: Colors.black,
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/works.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: TabsWebList(),
            ),
          ];
        },
        body: ListView(
          children: [
            Column(children: [
              SizedBox(height: 30.0),
              SansBold('Projects', 40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AnimatedCard(
                    imagePath: 'assets/porfolio.png',
                    height: 200.0,
                    width: 300.0,
                  ),
                  SizedBox(
                    width: widthDevice / 3,
                    child: Column(
                      children: [
                        SansBold('Portfolio', 30.0),
                        SizedBox(
                          height: 15.0,
                        ),
                        SansSmall(
                            'Deployed on Android,IOS and web.I  used flutter to dveloped the beautiful and responsive UI and firebase for the backend',
                            15.0),
                      ],
                    ),
                  )
                ],
              )
            ])
          ],
        ),
      ),
    );
  }
}
