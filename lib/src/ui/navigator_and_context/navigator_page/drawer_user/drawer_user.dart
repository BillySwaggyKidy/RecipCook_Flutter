import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:recipcook/src/ui/navigator_and_context/inherited_navbar/inherited_navbar.dart';

class DrawerUser extends StatelessWidget {
  DrawerUser();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 40,
        ),
        Text(
          InheritedNavbar.of(context).profil!.getName,
          style: const TextStyle(fontSize: 20, color: Colors.black),
        ),
        ElevatedButton(
          style: ButtonStyle(
              shadowColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(0, 0, 0, 0)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(0, 0, 0, 0))),
          onPressed: () {
            BlocProvider.of<NavigatorPageBloc>(context).add(NavigateToPageEvent(
                page: CurrentPage.userInfo,
                data: InheritedNavbar.of(context).profil));
          },
          child: const Text("Edit",
              style: TextStyle(
                  decoration: TextDecoration.underline, color: Colors.black)),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(255, 0, 0, 0.8))),
          onPressed: () {
            InheritedNavbar.of(context).profil = null;
            BlocProvider.of<NavigatorPageBloc>(context)
                .add(NavigateToPageEvent(page: CurrentPage.login));
          },
          child: const Text("Disconnect",
              style: TextStyle(fontSize: 20, color: Colors.black)),
        ),
      ],
    );
  }
}
