part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserDataLoaded extends UserState {
  final UserData userData;

  UserDataLoaded({required this.userData});
}

final class UserDataEmpty extends UserState {
  String? error;

  UserDataEmpty({this.error});
}
