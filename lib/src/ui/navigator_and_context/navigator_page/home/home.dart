import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipcook/src/blocs/navigator_page/navigator_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: <Widget>[
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/image/tab2-background.jpg'),
            fit: BoxFit.fitHeight,
            alignment: FractionalOffset.topCenter,
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(255, 0, 255, 0).withOpacity(0.3),
      ),
      
      Container(
        //margin: EdgeInsets.all(30.0),
        padding: const EdgeInsets.fromLTRB(80, 0, 70, 200),
        child: SvgPicture.asset(
          'assets/icons/app-cook-icon.svg',
          width: 100.0,
          height: 100.0,
          color: Colors.black,
        ),
      ),
      const Text(
        'RecipCook',
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          height: null,
          fontSize: 40,
        ),
        
      ),
      const Padding(),
      Align(
        alignment: FractionalOffset.bottomCenter,
        child: TextButton(
          onPressed: () {
            BlocProvider.of<NavigatorPageBloc>(context)
                  .add(NavigateToPageEvent(page: CurrentPage.login));
          },
          child: const Text(
            'GET STARTED',
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

class Padding extends StatelessWidget {
  const Padding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(100, 450, 100, 30),
      //child: const Produit(),
      child: null,
    );
  }
}

