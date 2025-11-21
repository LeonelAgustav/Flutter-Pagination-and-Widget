import 'package:flutter/material.dart';
import 'home_page.dart';
import 'increment_page.dart';
import 'decrement_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Modern Routes',
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      theme: ThemeData(
        // MENGAKTIFKAN MATERIAL 3
        useMaterial3: true,
        // Menghasilkan skema warna modern dari satu warna benih
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        // Mendefinisikan gaya teks global yang modern
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 96,
            fontWeight: FontWeight.w300,
            letterSpacing: -1.5,
          ),
          titleLarge: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 2, // Sedikit bayangan pada AppBar
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/increment': (context) => const IncrementPage(),
        '/decrement': (context) => const DecrementPage(),
      },
    );
  }
}
