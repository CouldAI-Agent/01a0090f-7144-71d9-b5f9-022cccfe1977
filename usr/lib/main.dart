import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const EmbeddedCApp());
}

class EmbeddedCApp extends StatelessWidget {
  const EmbeddedCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Embedded C Guide',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0D47A1), // Deep Blue representing C and embedded systems
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.robotoTextTheme(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1976D2),
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}
