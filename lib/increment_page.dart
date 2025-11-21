import 'package:flutter/material.dart';
import 'dart:math';

class IncrementPage extends StatefulWidget {
  const IncrementPage({super.key});

  @override
  State<IncrementPage> createState() => _IncrementPageState();
}

class _IncrementPageState extends State<IncrementPage> {
  int _counter = 0;
  // Warna awal mengambil dari warna primary tema
  late Color _textColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Inisialisasi warna awal saat dependencies (Theme) tersedia
    _textColor = Theme.of(context).colorScheme.primary;
  }

  Color _getRandomColor() {
    return Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _textColor = _getRandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mode Tambah"),
        // Menggunakan warna surface variant agar sedikit berbeda dari body
        backgroundColor: theme.colorScheme.surfaceVariant,
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
                elevation: 8, // Bayangan lebih menonjol
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 24.0),
                  child: AnimatedSwitcher(
                    // Animasi halus saat angka berubah
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: Text(
                      '$_counter',
                      key: ValueKey<int>(_counter), // Key penting untuk animasi
                      style: theme.textTheme.displayLarge?.copyWith(
                        color: _textColor,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _incrementCounter,
        // Warna FAB menyesuaikan skema warna primary
        backgroundColor: theme.colorScheme.primaryContainer,
        foregroundColor: theme.colorScheme.onPrimaryContainer,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Posisi di tengah bawah
    );
  }
}