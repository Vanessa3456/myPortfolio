import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class TabsWeb extends StatefulWidget {
  const TabsWeb({Key? key, this.title, this.route}) : super(key: key);
  final title;
  final route;

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        //detects the mouse position when the cursor hover over it
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
          // print('Entered');
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
          // print('Exited');
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 100),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.roboto(
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -8))],
                  fontSize: 25.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent)
              : GoogleFonts.oswald(color: Colors.black, fontSize: 20.0),
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}

class TabMobile extends StatefulWidget {
  final text;
  final route;
  const TabMobile({super.key, required this.text, required this.route});

  @override
  State<TabMobile> createState() => _TabMobileState();
}

class _TabMobileState extends State<TabMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: Colors.black,
        elevation: 20.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        height: 50.0,
        minWidth: 200.0,
        child: Text(
          widget.text,
          style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(widget.route);
        });
  }
}

class SansBold extends StatelessWidget {
  final text;
  final double size;
  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold));
  }
}

class SansSmall extends StatelessWidget {
  final text;
  final size;
  const SansSmall(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class TextForm extends StatelessWidget {
  final text;
  final containerWidth;
  final hintText;
  final maxLine;
  final filter;
  final controller;
  final validator;
  const TextForm({
    Key? key,
    @required this.text,
    @required this.containerWidth,
    @required this.hintText,
    // @required this.filter,
    this.maxLine,
    this.controller,
    this.validator,
    this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SansSmall(text, 16.0),
        SizedBox(
          height: 5,
        ),
        SizedBox(
            width: containerWidth,
            child: TextFormField(
              validator: validator, //checks if the text meeets our condition
              controller: controller,
              inputFormatters: filter,
              // inputFormatters: [
              //   LengthLimitingTextInputFormatter(10),
              //   FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
              // ],
              maxLines: maxLine == null ? null : maxLine,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                  borderSide: //outline preferences
                      BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: //outline preferences
                      BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: //outline preferences
                      BorderSide(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                hintText: hintText,
                hintStyle: GoogleFonts.poppins(fontSize: 14),
              ),
              // validator: (text) {
              //   if (RegExp("\\bpaulina\\b", caseSensitive: false)
              //       .hasMatch(text.toString())) return 'Match found';
              // },
              // autovalidateMode: AutovalidateMode.onUserInteraction,
            )),
      ],
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(
          flex: 3,
        ),
        TabsWeb(
          title: "Home",
          route: '/',
        ),
        Spacer(),
        TabsWeb(
          title: 'Works',
          route: '/works',
        ),
        Spacer(),
        TabsWeb(
          title: 'Blog',
          route: '/blog',
        ),
        Spacer(),
        TabsWeb(
          title: 'About',
          route: '/about',
        ),
        Spacer(),
        TabsWeb(
          title: 'Contact',
          route: '/contact',
        ),
        Spacer(),
      ],
    );
  }
}

urlLauncher(String imagePath, String url) {
  return IconButton(
      onPressed: () async {
        await launchUrl(Uri.parse(url));
      },
      icon: SvgPicture.asset(imagePath, width: 35.0));
}

class WebDrawer extends StatefulWidget {
  const WebDrawer({super.key});

  @override
  State<WebDrawer> createState() => _WebDrawerState();
}

class _WebDrawerState extends State<WebDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 72.0,
            backgroundColor: Colors.tealAccent,
            child: CircleAvatar(
              radius: 70.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/image.png'),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          SansBold('Vanessa Paul', 30.0),
          SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg",
                  'https://www.instagram.com/vanessarose7826/'),
              urlLauncher('assets/inked.svg',
                  'https://www.linkedin.com/in/vanessa-paul-857066232/'),
              urlLauncher('assets/github.svg', 'https://github.com/Vanessa3456')
            ],
          )
        ],
      ),
    );
  }
}

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2.0, color: Colors.black)),
              child: Image.asset('assets/imageCircle.png'),
            ),
          ),
          TabMobile(text: 'Home', route: '/'),
          SizedBox(
            height: 20.0,
          ),
          TabMobile(
            text: 'Works',
            route: '/works',
          ),
          SizedBox(
            height: 20.0,
          ),
          TabMobile(
            text: 'Blog',
            route: '/blog',
          ),
          SizedBox(
            height: 20.0,
          ),
          TabMobile(
            text: 'About',
            route: '/about',
          ),
          SizedBox(
            height: 20.0,
          ),
          TabMobile(
            text: 'Contact',
            route: '/contact',
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () async => await launchUrl(Uri.parse(
                      'https://www.linkedin.com/in/vanessa-paul-857066232/')),
                  icon: SvgPicture.asset(
                    'assets/inked.svg',
                    width: 35.0,
                  )),
              IconButton(
                  onPressed: () async => await launchUrl(
                      Uri.parse('https://github.com/Vanessa3456')),
                  icon: SvgPicture.asset(
                    'assets/github.svg',
                    width: 35.0,
                  )),
              IconButton(
                  onPressed: () async => await launchUrl(
                      Uri.parse('https://www.instagram.com/vanessarose7826/')),
                  icon: SvgPicture.asset(
                    'assets/instagram.svg',
                    width: 35.0,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;
  const AnimatedCard(
      {Key? key,
      this.fit,
      this.reverse,
      this.height,
      this.width,
      @required this.imagePath,
      this.text})
      : super(key: key);

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 4))
        ..repeat(reverse: true);
  //prevents offscreen animation from consuming uncessary resources
  late Animation<Offset> _animation = Tween(
    //tween specifies where the animation begin and where it is going to end
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
            side: BorderSide(color: Colors.tealAccent)),
        shadowColor: Colors.tealAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.imagePath,
              height: widget.height == null ? 200.0 : widget.height,
              width: widget.width == null ? 200.0 : widget.width,
              fit: widget.fit == null ? null : widget.fit,
            ),
            SizedBox(
              height: 10,
            ),
            widget.text == null ? SizedBox() : SansBold(widget.text, 15),
          ],
        ),
      ),
    );
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;
  const AbelCustom(
      {Key? key,
      @required this.text,
      @required this.size,
      this.color,
      this.fontWeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

class AddDataFireStore {
  final logger = Logger();
  CollectionReference response =
      FirebaseFirestore.instance.collection('messages');
  Future addResponse(
      final firstName, lastName, email, phoneNumber, message) async {
    return response.add({
      'first Name': firstName,
      'last Name': lastName,
      'email': email,
      'phone Number': phoneNumber,
      'message': message,
    }).then((value) {
      logger.d('Success');
      return true;
    }).catchError((error) {
      logger.d(error);
      return false;
    }); //firrestore stores data in the form of maps
  }
}

Future DialogError(BuildContext context, String title) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            title: SansBold(title, 20.0),
          ));
}

//variables
final logger = Logger();
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;

    return Form(
      key: formKey,
      child: Column(
        children: [
          SizedBox(
            height: 30.0,
          ),
          SansBold('Contact me', 40.0),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  TextForm(
                    text: 'First Name',
                    containerWidth: 350,
                    hintText: 'Please enter your first name',
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
                  SizedBox(
                    height: 15.0,
                  ),
                  TextForm(
                    // filter: [
                    //   LengthLimitingTextInputFormatter(10),
                    //   FilteringTextInputFormatter.allow(RegExp(
                    //       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'))
                    // ],
                    controller: _emailController,
                    text: 'Email',
                    containerWidth: 350,
                    hintText: 'Please enter your  email',
                    validator: (text) {
                      //get the value that the user typee in the textform field
                      if (text.toString().isEmpty) {
                        return 'Required';
                      }
                    },
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextForm(
                    filter: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
                    ],
                    controller: _lastNameController,
                    text: 'Last Name',
                    containerWidth: 350.0,
                    hintText: 'Please Enter your last name',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextForm(
                    filter: [
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    controller: _phoneController,
                    text: 'Phone number',
                    containerWidth: 350,
                    hintText: 'Please Enter your phone number',
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          TextForm(
            filter: [
              LengthLimitingTextInputFormatter(500),
              FilteringTextInputFormatter.allow(RegExp('[A-Za-z]'))
            ],
            controller: _messageController,
            text: 'Message',
            containerWidth: widthDevice / 1.5,
            hintText: 'Please Enter your message',
            maxLine: 10,
            validator: (text) {
              //get the value that the user typee in the textform field
              if (text.toString().isEmpty) {
                return 'Required';
              }
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          MaterialButton(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: 20.0,
            color: Colors.tealAccent,
            child: SansBold('Submit', 20.0),
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
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        //wrap all the widgets that contains the textfields with a form and add the key
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          SansBold('Contact me', 35.0),
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
            controller: _phoneController,
            text: 'Phone number',
            containerWidth: widthDevice / 1.4,
            hintText: 'Please Enter your phone number',
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
          ),
        ],
      ),
    );
  }
}

 tealContainer(String text) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.tealAccent, style: BorderStyle.solid, width: 2.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      padding: EdgeInsets.all(7.0),
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 15.0),
      ),
    );
  }
