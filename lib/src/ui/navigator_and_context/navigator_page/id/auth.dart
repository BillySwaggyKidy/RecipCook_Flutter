import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class AuthView extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<AuthView> {
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
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/tab2-background.png'),
            fit: BoxFit.fitHeight,
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 0, 255, 0).withOpacity(0.3),
      ),
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: ElevatedButton(
                  // style: ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all<Color>(
                  //     const Color.fromRGBO(178, 255, 89, 1))
                  // ),
                  onPressed: () {
                    _getFromCamera();
                    
                  },
                  //child: const Text("PICK FROM CAMERA"),
                  child: Container(
                    //margin: EdgeInsets.all(30.0),
                    padding: const EdgeInsets.fromLTRB(80, 0, 70, 200),
                    child: SvgPicture.asset(
                      'assets/icons/capture.svg',
                      width: 100.0,
                      height: 100.0,
                      color: Colors.black,
                    ),
                  ),
                  
                ),
                
                
              ),
            ),
            const Text(
              'Register',
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
              ),
            ),
            const Text(
              'Create your account',
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
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
            

            const SizedBox(
              height: 100,
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<NavigatorPageBloc>(context)
                      .add(NavigateToPageEvent(page: CurrentPage.login));
              },
              child: const Text(
                "Already Have an Account? Sign in",
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0)
                ),
              ),
            ),
          ],
        ),
      ),
      
      Align(
        alignment: FractionalOffset.bottomCenter,
        child: TextButton(
          onPressed: () {
            //if (_formKey.currentState!.validate()) {
              var email = emailController.text;
              var name = nameController.text;
              var password = passwordController.text;
              var cpass = cpassController.text;

              //var rsp = await registerUser(email, password, cpass, name);
              var rsp = connectData(email, password, cpass, name);

              BlocProvider.of<NavigatorPageBloc>(context)
                .add(NavigateToPageEvent(page: CurrentPage.login));

            /*} else {
              print(error);
            }*/
            print(emailController);
            print(passwordController);
            BlocProvider.of<NavigatorPageBloc>(context)
              .add(NavigateToPageEvent(page: CurrentPage.login));
          },
          child: const Text(
            'REGISTER',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              height: null,
              //fontWeight:,
              fontSize: 40,
              backgroundColor: Color.fromARGB(255, 0, 200, 0),
            ),
          ),
        ),
      ),
    ]);
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

      var ret = await collection.insertMany(<Map<String, dynamic>>[
        /*{'_id': 1, 'name': 'Tom', 'state': 'active', 'rating': 100, 'score': 5},
        {'_id': 2, 'name': 'William', 'state': 'busy', 'rating': 80, 'score': 4},
        {'_id': 3, 'name': 'Liz', 'state': 'on hold', 'rating': 70, 'score': 8},
        {'_id': 4, 'name': 'George', 'state': 'active', 'rating': 95, 'score': 8},
        {'_id': 5, 'name': 'Jim', 'state': 'idle', 'rating': 40, 'score': 3},
        {'_id': 6, 'name': 'Laureen', 'state': 'busy', 'rating': 87, 'score': 8},
        {'_id': 7, 'name': 'John', 'state': 'idle', 'rating': 72, 'score': 7},*/
        {'name': name, 'email': email, 'password': password, 'cpass': cpass,},
      ]);

      /*if (!ret.isSuccess) {
        print('Error detected in record insertion');
      }*/

      var res = await collection.findOne();

      print('Fetched ${res?['name']}');

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