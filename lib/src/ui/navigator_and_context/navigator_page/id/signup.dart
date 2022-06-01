import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var check = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('img/tab2-background.png'),
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
                child: Container(
                    // decoration: const BoxDecoration(
                    //   image: DecorationImage(
                    //     image: AssetImage('img/tab3-background.png'),
                    //     fit: BoxFit.fitHeight,
                    //     alignment: FractionalOffset.topCenter,
                    //   ),
                    // ),
                  ),
              ),
            ),
            const Text(
              'Login',
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 25,
              ),
            ),
            const Text(
              'Sign to your account',
              textAlign: TextAlign.left,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com'
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password'
                ),
                controller: passwordController,
              ),
            ),
            // FlatButton(
            //   onPressed: (){
            //     //TODO FORGOT PASSWORD SCREEN GOES HERE
            //   },
            //   child: Text(
            //     'Forgot Password',
            //     style: TextStyle(
            //       color: Colors.blue,
            //       fontSize: 15
            //       ),
            //   ),
            // ),
            // Container(
            //   height: 50,
            //   width: 250,
            //   decoration: BoxDecoration(
            //       color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            //   child: FlatButton(
            //     onPressed: () {
            //       BlocProvider.of<NavigatorPageBloc>(context)
            //         .add(NavigateToPageEvent(page: CurrentPage.navbar));
            //     },
            //     child: const Text(
            //       'Login',
            //       style: TextStyle(color: Colors.white, fontSize: 25),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 200,
            ),
            TextButton(
              onPressed: () {
                BlocProvider.of<NavigatorPageBloc>(context)
                      .add(NavigateToPageEvent(page: CurrentPage.register));
              },
              child: const Text(
                'New User? Create Account',
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
            var email = emailController.text;
            var password = passwordController.text;
            verifData(email, password);
            print(emailController);
            print(passwordController);
            if(check==0)
            {
              BlocProvider.of<NavigatorPageBloc>(context)
                .add(NavigateToPageEvent(page: CurrentPage.login));
            }
            else if (check==1)
            {
              BlocProvider.of<NavigatorPageBloc>(context)
                .add(NavigateToPageEvent(page: CurrentPage.navbar));
            }
            
          },
          child: const Text(
            'LOGIN',
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

  void verifData(String email, String password) async {
    var db = await mongo.Db.create("mongodb+srv://test:test@cluster0.yhi0oy3.mongodb.net/Profile");
    await db.open();
    print("****************success login ---------------------------------");
    Future cleanupDatabase() async {
      await db.close();
    }

    if (!db.masterConnection.serverCapabilities.supportsOpMsg) {
      return;
    }

    var collectionName = 'insertOne';
    //await db.dropCollection(collectionName);
    var collection = db.collection(collectionName);

    var res = await collection.find({
      'email': email,
      'password': password
    }).toList();

    print('First document fetched: ${res.first['name']} - ${res.first['password']}');

    if(res.first['name']!=null && res.first['password']!=null)
    {
      check=1;
    } else {
      check = 0;
    }

    await cleanupDatabase();
  }
}