import 'package:flutter/material.dart';
// import 'package:birthdayapp/layout/all_layout.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  //static const routeName = '/Loginn';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //final _storage = FlutterSecureStorage();

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
          physics: ClampingScrollPhysics(),
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
                  Container(
                    color:
                        const Color.fromARGB(255, 0, 255, 0).withOpacity(0.3),
                  ),
                  Text(
                    'Login',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 60, 0),
                      fontSize: 25,
                    ),
                  ),
                  Text(
                    'Sign to your account',
                    textAlign: TextAlign.left,
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: Color.fromARGB(255, 180, 60, 0),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      //validator: (String? val) => val!.isEmpty ? 'Please enter username' : null,
                      decoration: InputDecoration(
                        labelText: "Username",
                      ),
                      controller: usernameController,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      //validator: (String? val) => val!.isEmpty ? 'Please enter password' : null,
                      decoration: InputDecoration(labelText: "Password"),
                      controller: passwordController,
                      obscureText: true,
                    ),
                  ),
                  /*Container(
                    height: 55,
                    padding: const EdgeInsets.only(top: 10, left: 70, right: 70),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      color: Colors.black,
                      onPressed: () {
                        print(usernameController);
                        print(passwordController);
                        BlocProvider.of<NavigatorPageBloc>(context)
                              .add(NavigateToPageEvent(page: CurrentPage.navbar));
                      },
                      child: const Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,),),
                    ),
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account yet ? Really',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          BlocProvider.of<NavigatorPageBloc>(context).add(
                              NavigateToPageEvent(page: CurrentPage.register));
                        },
                        child: const Text(
                          'CREATE ONE',
                          style:
                              TextStyle(color: Color.fromARGB(255, 180, 60, 0)),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        print(usernameController);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
