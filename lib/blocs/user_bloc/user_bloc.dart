import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:my_budget/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadUserData>((event, emit) async {
      try {
        emit(UserDataEmpty(error: "No user data loaded at begin"));

        if (FirebaseAuth.instance.currentUser != null) {
          String? email = FirebaseAuth.instance.currentUser!.email;
          String? uid = FirebaseAuth.instance.currentUser!.uid;

          return emit(
              UserDataLoaded(userData: UserData(email: email, uid: uid)));
        }

        return emit(UserDataEmpty(error: "No user data loaded"));
      } catch (e) {
        return emit(
            UserDataEmpty(error: "Unexpected error in loading user data"));
      }
    });
  }
}
