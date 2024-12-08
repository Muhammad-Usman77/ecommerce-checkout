import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scrview/bottom_navi.dart';
import 'package:provider/provider.dart';
import 'package:scrview/provider/cart_provider.dart';
import 'package:scrview/provider/favorite_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CartProvider()),
          ChangeNotifierProvider(create: (_) =>FavoriteProvider())
          
          ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: BottomNaviBar(),
        ),
      );
}
