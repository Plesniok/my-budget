import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_budget/blocs/user_bloc/user_bloc.dart';
import 'package:my_budget/pages/login/login_page.dart';
import '../firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          Brightness.light,
    ));
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserBloc()..add(LoadUserData())),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(100, 217, 186, 140),
              background: const Color.fromARGB(100, 27, 27, 27),
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),
          home: const LoginPage(),
        ));
  }
}
