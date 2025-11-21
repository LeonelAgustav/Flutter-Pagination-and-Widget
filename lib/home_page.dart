import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Utama"),
        backgroundColor: theme.colorScheme.surfaceVariant,
      ),
      // Menggunakan warna background yang sedikit abu-abu/berbeda
      backgroundColor: theme.colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
              "Selamat Datang,",
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
             Text(
              "Silakan pilih menu di bawah:",
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.outline),
               textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Kartu Menu 1 (Increment)
            Card(
              elevation: 4, // Bayangan agar tampak melayang
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              clipBehavior: Clip.antiAlias, // Agar efek ripple tidak keluar dari border radius
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/increment'),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      // Container untuk ikon dengan background warna
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primaryContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add_circle_outline, color: theme.colorScheme.onPrimaryContainer, size: 32),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Halaman Increment", style: theme.textTheme.titleLarge),
                            const SizedBox(height: 4),
                            Text("Masuk untuk menambah nilai counter", style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: theme.colorScheme.outline),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Kartu Menu 2 (Decrement)
            Card(
               elevation: 4,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
               clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, '/decrement'),
                 child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                       Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          // Menggunakan warna error/merah untuk decrement
                          color: theme.colorScheme.errorContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.remove_circle_outline, color: theme.colorScheme.onErrorContainer, size: 32),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Halaman Decrement", style: theme.textTheme.titleLarge),
                             const SizedBox(height: 4),
                             Text("Masuk untuk mengurangi nilai counter", style: theme.textTheme.bodyMedium),
                          ],
                        ),
                      ),
                       Icon(Icons.arrow_forward_ios, color: theme.colorScheme.outline),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}