import 'package:flutter/material.dart';
import 'package:financeLine/common/widgets/bottom_bar.dart';
import 'package:financeLine/common/widgets/side_menu.dart';
import 'package:financeLine/constants/global_variables.dart';
import 'package:financeLine/features/admin/screens/admin_screen.dart';
import 'package:financeLine/features/auth/screens/auth_screen.dart';
import 'package:financeLine/features/auth/services/auth_service.dart';
import 'package:financeLine/features/home/screens/home_screen.dart';
import 'package:financeLine/providers/user_provider.dart';
import 'package:financeLine/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FinanceLine',
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(37, 63, 180, 1)),
            primarySwatch: Colors.blue,
            iconTheme: const IconThemeData(color: Colors.black)),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: Provider.of<UserProvider>(context).user.type == 'user'
            ? const BottomBar()
            : const AuthScreen());
  }
}
