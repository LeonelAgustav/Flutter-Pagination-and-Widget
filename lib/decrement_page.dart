import 'package:flutter/material.dart';
import 'dart:math';

class DecrementPage extends StatefulWidget {
  const DecrementPage({super.key});

  @override
  State<DecrementPage> createState() => _DecrementPageState();
}

class _DecrementPageState extends State<DecrementPage> {
  int _counter = 100;
  late Color _textColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Warna awal merah (error) karena ini halaman pengurangan
    _textColor = Theme.of(context).colorScheme.error;
  }

  Color _getRandomColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _textColor = _getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mode Kurang"),
        // Warna AppBar sedikit kemerahan
        backgroundColor: theme.colorScheme.errorContainer,
        foregroundColor: theme.colorScheme.onErrorContainer,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nilai Saat Ini", style: theme.textTheme.titleMedium),
              const SizedBox(height: 20),
              // Pembungkus Kartu untuk Angka
              Card(
                elevation: 8,
                // Memberi warna outline merah tipis pada kartu
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                    side: BorderSide(color: theme.colorScheme.error.withOpacity(0.5), width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                     transitionBuilder: (Widget child, Animation<double> animation) {
                      // Animasi slide masuk dari bawah untuk pengurangan
                      return SlideTransition(
                        position: Tween<Offset>(begin: const Offset(0.0, 0.5), end: Offset.zero).animate(animation),
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: Text(
                      '$_counter',
                       key: ValueKey<int>(_counter),
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: _textColor,
                         fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(), // Mendorong tombol ke bawah
              // Tombol lebar modern di bagian bawah
              SizedBox(
                width: double.infinity, // Lebar penuh
                height: 60,
                child: FilledButton.icon(
                  onPressed: _decrementCounter,
                  // Gaya tombol merah (error theme)
                  style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.error,
                    foregroundColor: theme.colorScheme.onError,
                    textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
                  ),
                  icon: const Icon(Icons.remove_circle),
                  label: const Text("KURANGI NILAI"),
                ),
              ),
              const SizedBox(height: 30), // Jarak di bawah tombol
            ],
          ),
        ),
      ),
    );
  }
}