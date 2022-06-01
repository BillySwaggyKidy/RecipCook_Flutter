import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            print(emailController);
            print(passwordController);
            BlocProvider.of<NavigatorPageBloc>(context)
              .add(NavigateToPageEvent(page: CurrentPage.navbar));
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
}