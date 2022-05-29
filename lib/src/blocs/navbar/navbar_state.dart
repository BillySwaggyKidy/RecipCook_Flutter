part of 'navbar_bloc.dart';

class NavbarState {
  int tabIndex;

  NavbarState({
    required this.tabIndex,
  });

  NavbarState copyWith({required int? index}) {
    return NavbarState(tabIndex: index!);
  }
}
