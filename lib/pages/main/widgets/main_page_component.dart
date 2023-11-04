import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_budget/blocs/user_bloc/user_bloc.dart';

class MainComponent extends StatefulWidget {
  MainComponent();

  @override
  State<MainComponent> createState() => _MainComponentState();
}

class _MainComponentState extends State<MainComponent> {
  @override
  Widget build(BuildContext context) {
    // Use the state to build your UI
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        // DatabaseReference starCountRef =
        //     FirebaseDatabase.instance.ref('users/qew-32');
        // starCountRef.onValue.listen((DatabaseEvent event) {
        //   final data = event.snapshot.value;
        //   print(data);
        // });
        if (userState is UserDataLoaded) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TextButton(
              //     onPressed: () async {
              //       FireBaseClass firebaseDatabase = FireBaseClass();
              //       firebaseDatabase.initInstance();

              //       DatabaseReference ref =
              //           FirebaseDatabase.instance.ref("users/qew-32");

              //       await ref.set({
              //         "userId": 1,
              //         "data": {"name": "changed tester32"}
              //       });
              //     },
              //     child: const Text("test")),
              Text(
                'Hello ${userState.userData.email}, ${userState.userData.uid}',
              ),
              TextButton(
                child: const Text("sign out"),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                },
              ),
            ],
          );
        }
        if (userState is UserDataEmpty) {
          return Center(child: Text(userState.error ?? "err"));
        }

        return Column(
          children: [
            TextButton(
              child: const Text("refresh widget"),
              onPressed: () async {
                setState(() {});
              },
            ),
            TextButton(
              child: const Text("sign out"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
              },
            ),
          ],
        );
      },
    );
  }
}
