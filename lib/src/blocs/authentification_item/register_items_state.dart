part of 'register_items_bloc.dart';

class RegisterItemsState {
  Status status;
  LoginItemModel? profile;
  String? error;

  RegisterItemsState({this.status = Status.initial, this.profile, this.error});

  RegisterItemsState copyWith(
      {required Status status, LoginItemModel? profile}) {
    return RegisterItemsState(status: status, profile: profile);
  }
}
