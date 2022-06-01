import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipcook/src/ui/navigator_and_context/navigator_page/id/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mongo_dart/mongo_dart.dart' as mongo;


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  final cpassController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  late File imageFile;

  String error = '';

  String message = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Container(
            height: size.height,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('img/tab3-background.png'),
                        fit: BoxFit.fitHeight,
                        alignment: FractionalOffset.topCenter,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(178, 255, 89, 1))),
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: const Text("PICK FROM CAMERA"),
                  ),
                  const Text(
                    'Register',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 60, 0),
                      fontSize: 25,
                    ),
                  ),
                  const Text(
                    'Create your account',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 60, 0),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: nameController,
                      validator: (String? val) =>
                          val!.isEmpty ? 'Please Enter Name' : null,
                      decoration: const InputDecoration(labelText: "Name"),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: emailController,
                      validator: (String? val) =>
                          val!.isEmpty ? 'Email cannot be Empty' : null,
                      decoration: const InputDecoration(labelText: "Email"),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (String? val) =>
                          val!.isEmpty ? 'Password Cannot be Empty' : null,
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: cpassController,
                      validator: (String? val) => val != passwordController.text
                          ? 'Password Did not Match'
                          : null,
                      decoration:
                          const InputDecoration(labelText: "Confirm Password"),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          var email = emailController.text;
                          var name = nameController.text;
                          var password = passwordController.text;
                          var cpass = cpassController.text;

                          //var rsp = await registerUser(email, password, cpass, name);
                          var rsp = connectData(email, password, cpass, name);

                          BlocProvider.of<NavigatorPageBloc>(context)
                            .add(NavigateToPageEvent(page: CurrentPage.login));

                        } else {
                          print(error);
                        }
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(80.0))),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(color: Colors.white)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.all(0))),
                      child: Container(
                        alignment: Alignment.center,
                        height: 50.0,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: const LinearGradient(colors: [
                              Color.fromARGB(255, 255, 136, 34),
                              Color.fromARGB(255, 255, 177, 41)
                            ])),
                        padding: const EdgeInsets.all(0),
                        child: const Text(
                          "SIGN UP",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    child: GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()))
                      },
                      child: const Text(
                        "Already Have an Account? Sign in",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2661FA)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  registerUser(String email, String password, String cpass, String name) {
    connectData(email, password, cpass, name);
  }

  void connectData(String email, String password, String cpass, String name) async {
  var db = await mongo.Db.create("mongodb+srv://test:test@cluster0.yhi0oy3.mongodb.net/Profile");
  await db.open();
  print("****************success register ---------------------------------");
  Future cleanupDatabase() async {
    await db.close();
  }

  if (!db.masterConnection.serverCapabilities.supportsOpMsg) {
    return;
  }

  var collectionName = 'insertOne';
  await db.dropCollection(collectionName);
  var collection = db.collection(collectionName);

  var ret = await collection.insertOne(<String, dynamic>{
    'name': "name",
    'email': "email",
    'password': "password",
    'cpass': "cpass",
  });

  if (!ret.isSuccess) {
    print('Error detected in record insertion');
  }

  var res = await collection.findOne();

  print('Fetched ${res?['name']}');
  // Tom

  await cleanupDatabase();
  //await db.close();
}
  /// Get from camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }
}
