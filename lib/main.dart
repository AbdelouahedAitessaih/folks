import 'package:flutter/material.dart';
import 'package:folks/pages/login_page.dart';
import 'package:folks/pages/splash_page.dart';
import 'package:folks/providers/authentication_provider.dart';
import 'package:folks/services/navigation_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(MainApp());
      }));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AutheticationProvider>(
          create: (BuildContext _contxt) => AutheticationProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Folks',
        theme: ThemeData(
            backgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
            scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromRGBO(30, 29, 37, 1.0))),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {'/login': (BuildContext _context) => const LoginPage()},
      ),
    );
  }
}
