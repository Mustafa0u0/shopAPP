import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/common/widgets/bottom_bar.dart';
import 'package:shop_app/common/widgets/splash_screen.dart';
import 'package:shop_app/constants/global_variables.dart';
import 'package:shop_app/features/admin/screens/admin_screen.dart';
import 'package:shop_app/features/auth/screens/auth_screen.dart';
import 'package:shop_app/features/auth/screens/signin_screen.dart';
import 'package:shop_app/features/auth/services/auth_service.dart';
import 'package:shop_app/features/home/screens/home_screen.dart';
import 'package:shop_app/providers/user_provider.dart';
import 'package:shop_app/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
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
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
      ],
      title: 'متجرك',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        primaryColor: GlobalVariables.secondaryColor,
        accentColor: GlobalVariables.secondaryLightColor,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const BottomBar()
              : const AdminScreen()
          : const SplashScreen(),
    );
  }
}
