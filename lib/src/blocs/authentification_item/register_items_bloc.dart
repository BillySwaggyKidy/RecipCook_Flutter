import 'package:recipcook/src/models/item_login_model/login_item_model.dart';
import 'package:recipcook/src/provider/provider.dart';
import 'package:recipcook/src/models/item_recipe_model/item_recipe_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../status.dart';
part 'register_items_state.dart';

class ProfilEvent {
  String email;
  String password;
  String name;
  String cpass;
  ProfilEvent({
    required this.email,
    required this.password,
    required this.name,
    required this.cpass
  });
}

class ProfilItemsBloc extends Bloc<ProfilEvent, RegisterItemsState> {
  ProfilItemsBloc() : super(RegisterItemsState()) {
    on<ProfilEvent>(_fetchAllRegisterItems);
  }

  void _fetchAllRegisterItems(
      ProfilEvent event, Emitter<RegisterItemsState> emit) async {
    emit(state.copyWith(status: Status.loading, profile: null));
    try {
      final profilProvider = Provider();
      final profil =
          await profilProvider.fetchRegister(event.email, event.password, event.name, event.cpass);
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