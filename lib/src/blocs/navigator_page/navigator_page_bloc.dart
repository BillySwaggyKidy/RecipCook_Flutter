import 'package:bloc/bloc.dart';
part 'navigator_page_state.dart';

enum CurrentPage { home, register, login, navbar, recipeView }

class NavigateToPageEvent {
  final CurrentPage page;
  final dynamic data;
  NavigateToPageEvent({required this.page, this.data});
}

class NavigatorPageBloc extends Bloc<NavigateToPageEvent, NavigatorPageState> {
  NavigatorPageBloc()
      : super(NavigatorPageState(currentPage: CurrentPage.navbar)) {
    on<NavigateToPageEvent>(_navigateToPage);
  }

  void _navigateToPage(
      NavigateToPageEvent event, Emitter<NavigatorPageState> emit) async {
    state.currentPage = event.page;
    state.data = event.data;
    emit(state.copyWith(page: state.currentPage, data: state.data));
  }
}
