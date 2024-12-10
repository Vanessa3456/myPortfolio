import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({super.key});

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
 

  final logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
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
        body: ListView(
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
                      radius: 110.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/imageCircle.png'),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Column(
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
                        child: SansBold('Hello I am', 15.0),
                      ),
                      SansBold('Vanessa Rose Paul', 40.0),
                      SansSmall('Flutter Developer', 20.0),
                    ],
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_city),
                        ],
                      ),
                      SizedBox(
                        width: 40.0,
                      ),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          SansSmall('vanessarosepaul5@gmail.com', 15.0),
                          SansSmall('0717052716', 15.0),
                          SansSmall('Kakamega', 15.0),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            SizedBox(
              height: 90.0,
            ),
            //about section,second section
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold('About me', 35.0),
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
            SizedBox(
              height: 60.0,
            ),
            //third section:What I do
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold('What I do', 35.0),
                AnimatedCard(
                  imagePath: 'assets/webL.png',
                  text: 'Web development',
                  width: 300.0,
                ),
                SizedBox(
                  height: 35.0,
                ),
                AnimatedCard(
                  imagePath: 'assets/app.png',
                  text: 'App development',
                  fit: BoxFit.contain,
                  reverse: true,
                  width: 300.0,
                ),
                SizedBox(
                  height: 35.0,
                ),
                AnimatedCard(
                  imagePath: 'assets/firebase.png',
                  text: 'Backend development',
                  width: 300.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 60.0,
                ),
              ],
            ),
            //contact:fourth section
            Form(
              key: formKey,
              child: Wrap(
                //because it accepts runspacing
                runSpacing: 20.0,
                spacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SansBold('Contact me', 20.0),
                  ),
                  TextForm(
                    text: 'First name',
                    containerWidth: widthDevice / 1.4,
                    hintText: 'Please type your first name',
                    filter: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
                    ],
                    controller: _firstNameController,
                    validator: (text) {
                      //get the value that the user typee in the textform field
                      if (text.toString().isEmpty) {
                        return 'Required';
                      }
                    },
                  ),
                  TextForm(
                    text: 'Last',
                    containerWidth: widthDevice / 1.4,
                    hintText: 'Please enter your last name',
                    filter: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
                    ],
                    controller: _lastNameController,
                  ),
                  TextForm(
                    text: 'Email',
                    containerWidth: widthDevice / 1.4,
                    hintText: 'Please enter your email',
                    // filter: [
                    //   LengthLimitingTextInputFormatter(10),
                    //   FilteringTextInputFormatter.allow(RegExp(
                    //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
                    // ],
                    controller: _emailController,
                    validator: (text) {
                      //get the value that the user typee in the textform field
                      if (text.toString().isEmpty) {
                        return 'Required';
                      }
                    },
                  ),
                  TextForm(
                    filter: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    text: 'Phone number',
                    containerWidth: widthDevice / 1.4,
                    hintText: 'Please Enter your phone number',
                    controller: _phoneController,
                  ),
                  TextForm(
                    // filter: [
                    //   LengthLimitingTextInputFormatter(10),
                    //   FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
                    // ],
                    text: 'Message',
                    containerWidth: widthDevice / 1.4,
                    hintText: ' Message',
                    maxLine: 10,
                    controller: _messageController,
                    validator: (text) {
                      //get the value that the user typee in the textform field
                      if (text.toString().isEmpty) {
                        return 'Required';
                      }
                    },
                  ),
                  MaterialButton(
                    onPressed: () async {
                      logger.d(_firstNameController.text);
                      final addData = AddDataFireStore();
                      if (formKey
                          .currentState! //will return true if therres in no error
                          .validate()) {
                        if (await addData.addResponse(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _phoneController.text,
                            _messageController.text)) {
                          formKey.currentState!
                              .reset(); //deletes the texts from the textfield after the user has submitted
                          DialogError(context, 'Message Sent succesfully');
                        } else {
                          DialogError(context, 'Failed');
                        }
                      }
                      ; //all the textfields connected to the form keys will be valited on pressed on the submit button
                    },
                    elevation: 20.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: widthDevice / 2.2,
                    color: Colors.tealAccent,
                    child: SansBold('Submit', 20.0),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
