import 'package:flutter/material.dart';
import 'package:islamic/screen/home_screen.dart';
import 'package:islamic/screen/quran_details/quran_details.dart';

void main() {
  runApp(const Islamic());
}

class Islamic extends StatelessWidget {
  const Islamic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          margin: EdgeInsets.all(16),
          elevation: 30,
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xffB7935F),
          thickness: 2,
        ),
        scaffoldBackgroundColor: Colors.transparent,
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
            color: Colors.black,
            size: 35,
          ),
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
            size: 35,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          primary: const Color(0xffB7935F),
          secondary: const Color(0xffB7935F).withOpacity(0.57),
          onPrimary: Colors.white,
          onSecondary: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        QuranDetails.routeName: (_) => QuranDetails(),
      },
    );
  }
}
