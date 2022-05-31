part of 'login_items_bloc.dart';

class LoginItemsState {
  Status status;
  LoginItemModel? profile;
  String? error;

  LoginItemsState({this.status = Status.initial, this.profile, this.error});

  LoginItemsState copyWith(
      {required Status status, LoginItemModel? profile}) {
    return LoginItemsState(status: status, profile: profile);
  }
}
