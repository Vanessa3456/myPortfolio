import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';
import 'package:portfolio/components.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  final logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        endDrawer: MobileDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  size: 35.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/contact_image.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                expandedHeight: 400.0,
              ),
            ];
          },
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Form(
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
            ),
          ),
        ),
      ),
    );
  }
}
