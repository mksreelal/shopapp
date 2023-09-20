import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/models/shop.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/home_screen.dart';
import 'package:shopapp/screens/intro_screen.dart';
import 'package:shopapp/screens/splash_screen.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/intropage': (context) => const IntroScreen(),
        '/homepage': (context) => const HomeScreen(),
        '/cartpage': (context) => const CartScreen()
      },
    );
  }
}
