part of 'navigator_page_bloc.dart';

class NavigatorPageState {
  CurrentPage currentPage;
  dynamic data;

  NavigatorPageState({required this.currentPage, this.data});

  NavigatorPageState copyWith(
      {required CurrentPage page, required dynamic data}) {
    return NavigatorPageState(currentPage: page, data: data);
  }
}
