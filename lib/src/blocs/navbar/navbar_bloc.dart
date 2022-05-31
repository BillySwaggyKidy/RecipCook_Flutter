import 'package:bloc/bloc.dart';
part 'navbar_state.dart';

class NavbarEvent {
  final int tabIndex;
  NavbarEvent({
    required this.tabIndex,
  });
}

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  NavbarBloc() : super(NavbarState(tabIndex: 0)) {
    on<NavbarEvent>(_changeTabIndex);
  }

  void _changeTabIndex(NavbarEvent event, Emitter<NavbarState> emit) async {
    state.tabIndex = event.tabIndex;
    emit(state.copyWith(index: state.tabIndex));
  }
}
