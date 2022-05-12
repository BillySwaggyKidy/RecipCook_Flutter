import 'package:flutter/material.dart';
import 'tab1/ingredient.dart';
import 'tab2/recipe_list.dart';
import 'tab3/favorite.dart';

class NavBar extends StatefulWidget {
  NavBar({required Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavBar();
  }
}

class _NavBar extends State<NavBar> {
  int selectedIndex = 0;
  Widget _myContacts = Ingredient(
    key: null,
  );
  Widget _myEmails = RecipeList();
  Widget _myProfile = Favorite(
    key: null,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => {}, child: Text("test")),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: this.getBody(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: this.selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.contacts),
              label: "Contacts",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mail),
              label: "Emails",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onTap: (int index) {
            this.onTapHandler(index);
          },
        ));
  }

  Widget getBody() {
    if (this.selectedIndex == 0) {
      return this._myContacts;
    } else if (this.selectedIndex == 1) {
      return this._myEmails;
    } else {
      return this._myProfile;
    }
  }

  void onTapHandler(int index) {
    this.setState(() {
      this.selectedIndex = index;
    });
  }
}
