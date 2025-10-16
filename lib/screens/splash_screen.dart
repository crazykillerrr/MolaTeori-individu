import 'dart:async'; // Digunakan untuk fungsi Timer (penundaan waktu)
import 'package:flutter/material.dart';

/// Halaman SplashScreen — ditampilkan pertama kali saat aplikasi dijalankan.
/// Tujuannya untuk menampilkan logo dan nama aplikasi selama beberapa detik
/// sebelum berpindah ke halaman utama (login screen).
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// State dari SplashScreen — menyimpan logika timer dan navigasi otomatis.
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    /// Timer digunakan untuk menunda navigasi selama beberapa detik.
    /// Setelah 3 detik, user akan otomatis diarahkan ke halaman login ('/').
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/'); // Navigasi ke halaman login
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Scaffold berfungsi sebagai struktur dasar halaman Flutter (seperti “kerangka” layar)
    return const Scaffold(
      backgroundColor: Color(0xFF121212),

      /// di sini logo dan nama aplikasi di tengah layar
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 🔹 Logo aplikasi
          
            Icon(Icons.music_note, size: 100, color: Color(0xFF1DB954)),

            SizedBox(height: 20), 

            /// Nama aplikasi di bawah logo
            Text(
              "Music Match", // Nama aplikasi
              style: TextStyle(
                color: Colors.white, 
                fontSize: 26, 
                fontWeight: FontWeight.bold, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
