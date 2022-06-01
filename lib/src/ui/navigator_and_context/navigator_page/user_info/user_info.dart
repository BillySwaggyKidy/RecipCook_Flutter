import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';

class UserInfo extends StatelessWidget {
  UserInfo();

  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 136, 199, 120),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Stack(
                children: [
                  Align(
                      alignment: Alignment.center,
                      child: Container(
                          margin: const EdgeInsets.all(10),
                          child: const CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 40,
                          ))),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.redo),
                      onPressed: () {
                        BlocProvider.of<NavigatorPageBloc>(context)
                            .add(NavigateToPageEvent(page: CurrentPage.navbar));
                      },
                    ),
                  )
                ],
              ),
              Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: TextFormField(
                            controller: nameController,
                            validator: (String? val) =>
                                val!.isEmpty ? 'Name Cannot be Empty' : null,
                            decoration:
                                const InputDecoration(labelText: "Name"),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: TextFormField(
                            controller: emailController,
                            validator: (String? val) =>
                                val!.isEmpty ? 'Email Cannot be Empty' : null,
                            decoration:
                                const InputDecoration(labelText: "Email"),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: TextFormField(
                            controller: passwordController,
                            validator: (String? val) => val!.isEmpty
                                ? 'Password Cannot be Empty'
                                : null,
                            decoration:
                                const InputDecoration(labelText: "Password"),
                            obscureText: true,
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: TextFormField(
                            controller: verifyPasswordController,
                            validator: (String? val) =>
                                val!.isEmpty || val != passwordController.text
                                    ? 'the Passwords are not identical'
                                    : null,
                            decoration: const InputDecoration(
                                labelText: "Verify password"),
                            obscureText: true,
                          ),
                        ),
                      ])),
              ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size.fromHeight(40)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 126, 182, 64))),
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    var email = emailController.text;
                    var name = nameController.text;
                    var password = passwordController.text;
                    var cpassword = verifyPasswordController.text;

                    Map editFieldData = Map();
                    editFieldData["email"] = email;
                    editFieldData["name"] = name;
                    editFieldData["password"] = password;
                    editFieldData["cpassword"] = cpassword;

                    //BlocProvider.of<RecipeItemsBloc>(context)
                    //    .add(RecipeItemsEvent(fieldData: fieldData));
                  }
                },
                child: const Text('Edit'),
              ),
            ])));
  }
}
