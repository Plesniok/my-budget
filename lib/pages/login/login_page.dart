import 'dart:async';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_budget/blocs/user_bloc/user_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:my_budget/main.dart';
import 'package:my_budget/pages/main/main_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/users-page";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Timer? timer;

  @override
  void initState() {
    // final UsersManagementBloc userBloc = context.read<UsersManagementBloc>();
    // userBloc.add(LoadUsersList());

    // timer = Timer.periodic(const Duration(seconds: TimerTheme.seconds), (timer) {
    //   userBloc.add(RefreshUsersList());
    //   setState(() {});
    // });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return Scaffold(
            body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SignInScreen(
                providers: [
                  EmailAuthProvider(), // new
                ],
              );
            }

            return MyHomePage(title: "You are logged");
          },
        ));
      },
    );
  }
}
