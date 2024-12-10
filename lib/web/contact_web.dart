import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
                  'assets/contact_image.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: TabsWebList(),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Form(
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
                            FilteringTextInputFormatter.allow(
                                RegExp('[A-Za-z]'))
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
                            FilteringTextInputFormatter.allow(
                                RegExp('[A-Za-z]'))
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
                  height: 20.0,
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
          ),
        ),
      ),
    );
  }
}
