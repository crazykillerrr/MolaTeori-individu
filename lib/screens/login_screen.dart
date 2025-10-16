import 'package:flutter/material.dart';

/// Halaman Login — tampilan awal sebelum masuk ke Dashboard
/// User diminta memasukkan email dan password untuk melanjutkan
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// State dari LoginScreen — digunakan untuk menyimpan input user
class _LoginScreenState extends State<LoginScreen> {
  // Controller untuk mengambil nilai input dari TextField email
  final TextEditingController _email = TextEditingController();

  // Controller untuk mengambil nilai input dari TextField password
  final TextEditingController _pass = TextEditingController();

  /// Fungsi untuk mengecek input user dan melakukan navigasi
  /// Jika email & password terisi, user diarahkan ke Dashboard
  /// Jika tidak, maka muncul pesan peringatan (SnackBar)
  void _login() {
    if (_email.text.isNotEmpty && _pass.text.isNotEmpty) {
      // Pindah halaman ke Dashboard jika login berhasil
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      // Menampilkan notifikasi jika field kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Isi semua field terlebih dahulu!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Body adalah isi utama halaman login
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),

        /// Column digunakan untuk menata widget secara vertikal
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan secara vertikal
          children: [
            /// 🔹 Logo aplikasi (ikon musik hijau)
            const Icon(Icons.music_note, size: 90, color: Color(0xFF1DB954)),

            const SizedBox(height: 20),

            /// 🔹 Judul aplikasi
            const Text(
              "Welcome to Music Match",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            /// 🔹 Input field untuk Email
            TextField(
              controller: _email, // Hubungkan ke controller email
              decoration: InputDecoration(
                hintText: "Email", // Placeholder teks
                prefixIcon: const Icon(Icons.email), // Ikon di kiri field
                filled: true, // Aktifkan warna latar belakang
                fillColor: Colors.grey[900], // Warna abu gelap
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Sudut melengkung
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 Input field untuk Password
            TextField(
              controller: _pass, // Hubungkan ke controller password
              obscureText: true, // Sembunyikan teks input (••••)
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 25),

            /// 🔹 Tombol Login utama
            SizedBox(
              width: double.infinity, // Lebar penuh
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DB954), // Warna hijau Spotify
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Sudut tombol melengkung
                  ),
                ),
                onPressed: _login, // Jalankan fungsi login saat ditekan
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 Tombol teks untuk pindah ke halaman Sign Up
            TextButton(
              onPressed: () {
                // Navigasi ke halaman daftar
                Navigator.pushReplacementNamed(context, '/signup');
              },
              child: const Text(
                "Belum punya akun? Daftar",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
