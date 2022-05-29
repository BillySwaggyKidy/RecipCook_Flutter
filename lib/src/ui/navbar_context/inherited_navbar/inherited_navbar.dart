import 'package:flutter/material.dart';
import 'inherited_navbar_data.dart';

class InheritedNavbar extends InheritedWidget {
  final InheritedNavbarData data;

  InheritedNavbar({
    Key? key,
    required Widget child,
  })  : assert(child != null),
        data = InheritedNavbarData(),
        super(key: key, child: child);

  static InheritedNavbarData of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<InheritedNavbar>()
              as InheritedNavbar)
          .data;

  @override
  bool updateShouldNotify(InheritedNavbar old) => false;
}
