// ignore_for_file: unused_local_variable, must_be_immutable, library_private_types_in_public_api, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, deprecated_member_use

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetailScreen extends StatefulWidget {
  final int id;
  final String fname;
  final String lname;
  final String email;
  final String phone;
  String image;
  final String address;
  ProfileDetailScreen(
      {Key key,
      this.id,
      this.email,
      this.fname,
      this.lname,
      this.image,
      this.phone,
      this.address})
      : super(key: key);

  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {
  var resimage;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    // Profile
    onload();
    super.initState();
  }

  File image;
  PickedFile _pickedFile;
  final _picker = ImagePicker();

  // AuthController authController = Get.find();
  RxBool isLoading = false.obs;
  // final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  String errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final firstNameEditingController = TextEditingController();
  final secondNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final addressEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController(text: '+92');

  @override
  Widget build(BuildContext context) {
    ///first name field
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    ///second name field
    final secondNameField = TextFormField(
        autofocus: false,
        controller: secondNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value.isEmpty) {
            return ("Second Name cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          secondNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    ///email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailEditingController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return ("Please Enter a valid email");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    ///Phone number field
    final phoneNumberField = TextFormField(
        autofocus: false,
        controller: phoneNumberEditingController,
        validator: (value) {
          if (value.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!value.contains('+92')) {
            return ("Please Start your number with +92 instead of 0");
          }
          if (value.length < 13) {
            return ("Please Enter a valid Phone Number");
          }
          // if (!RegExp("r'\+994\s+\([0-9]{2}\)\s+[0-9]{3}\s+[0-9]{2}\s+[0-9]{2}'").hasMatch(value)) {
          //   return ("Please Enter a valid Phone Number");
          // }
          return null;
        },
        onSaved: (value) {
          phoneNumberEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone Number",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    // address feild
    final addressField = TextFormField(
        autofocus: false,
        controller: addressEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          if (value.isEmpty) {
            return ("Address cannot be Empty");
          }
          return null;
        },
        onSaved: (value) {
          addressEditingController.text = value;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    ///signup button
    final signUpButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(10),
      color: Colors.greenAccent[400],
      child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width,
          onPressed: () async {
            // ignore: unnecessary_new
            // print(image.path.split('/').last);
            var stream = http.ByteStream(image.openRead());
            stream.cast();
            // print(image.path.length);
            var length = image.path.length;
            // for mobile
            // var uri = Uri.parse('http://192.168.73.142:8000/api/postprofile');

            // for emulator
            var uri = Uri.parse('http://10.0.2.2:8000/api/postprofile');
            var request = http.MultipartRequest('POST', uri);
            // // request.fields['id'] = widget.id as String;
            if (image == null) {
              http.MultipartFile multipart =
                  await http.MultipartFile.fromPath('image', image.path);

              request.files.add(multipart);
            } else {
              request.fields['image'] = image.path.toString();
            }
            String id = widget.id.toString();
            request.fields['Firstname'] = firstNameEditingController.text;
            request.fields['Lastname'] = secondNameEditingController.text;

            request.fields['email'] = emailEditingController.text;

            request.fields['Phone'] = phoneNumberEditingController.text;
            request.fields['id'] = id;
            request.fields['Address'] = addressEditingController.text;

            http.StreamedResponse res = await request.send();
            var m = await jsonDecode(await res.stream.bytesToString());
            // ignore: prefer_is_not_empty
            if (!m['status'].toString().isEmpty) {
              _showMsg(m['message'].toString());
            } else {
              // print('em');

              _showMsg('Profile Not Uploaded ');
            }
            // print(result);
          },
          child: const Text(
            "Upload",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          )),
    );

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.greenAccent[400]),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            border: Border.all(color: Colors.greenAccent[400])),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.image != null
                              ? widget.image.toString()
                              : 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png'),
                          child: Stack(
                            children: [
                              Positioned(
                                right: 2,
                                bottom: 10,
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.greenAccent[400],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          // print("hh");
                                          _pickImage();
                                        },
                                        child: const Icon(
                                          Icons.camera_alt,
                                          size: 30,
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    firstNameField,
                    const SizedBox(height: 10),
                    secondNameField,
                    const SizedBox(height: 10),
                    emailField,
                    const SizedBox(height: 10),
                    phoneNumberField,
                    const SizedBox(height: 10),
                    addressField,
                    const SizedBox(height: 15),
                    Obx(() => isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : signUpButton),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showMsg(msg) {
    //
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFF363f93),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        image = File(_pickedFile.path);
        // widget.image = image.path.toString();
        // print(image.path.split('/').last);
      });
      // print(image);
    }
  }

  onload() async {
    if (widget.image != null) {
      // print(widget.image);
      // setState(() {
      // print(widget.image.split('/').last);
      image = File(widget.image.createPath());
      // });
      // print(image);
      // image = widget.image as File;
    }
    firstNameEditingController.text = widget.fname;
    secondNameEditingController.text = widget.lname;
    emailEditingController.text = widget.email;
    phoneNumberEditingController.text = widget.phone;
    addressEditingController.text = widget.address;
  }
}
