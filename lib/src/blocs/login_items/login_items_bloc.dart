import 'package:recipcook/src/models/item_login_model/login_item_model.dart';
import 'package:recipcook/src/provider/provider.dart';
import 'package:recipcook/src/models/item_recipe_model/item_recipe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../status.dart';
part 'login_items_state.dart';

class LoginItemsEvent {
  String username;
  String password;
  LoginItemsEvent({
    required this.username,
    required this.password,
  });
}

class ProfilItemsBloc extends Bloc<LoginItemsEvent, LoginItemsState> {
  ProfilItemsBloc() : super(LoginItemsState()) {
    on<LoginItemsEvent>(_fetchAllLoginItems);
  }

  void _fetchAllLoginItems(
      LoginItemsEvent event, Emitter<LoginItemsState> emit) async {
    emit(state.copyWith(status: Status.loading, profile: null));
    try {
      final profilProvider = Provider();
      final profil =
          await profilProvider.fetchLogin(event.username, event.password);
      emit(
        state.copyWith(
          status: Status.success,
          profile: profil,
        ),
      );
    } catch (error, stacktrace) {
      emit(state.copyWith(status: Status.error));
    }
  }
}