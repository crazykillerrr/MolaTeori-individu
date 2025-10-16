import 'package:flutter/material.dart';

/// Halaman Signup — digunakan untuk mendaftarkan akun baru
/// Terdiri dari input Nama, Email, dan Password
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

/// State dari SignupScreen — menyimpan input pengguna dan aksi tombol
class _SignupScreenState extends State<SignupScreen> {
  // Controller untuk mengambil input teks dari TextField nama lengkap
  final _name = TextEditingController();

  // Controller untuk mengambil input teks dari TextField email
  final _email = TextEditingController();

  // Controller untuk mengambil input teks dari TextField password
  final _pass = TextEditingController();

  /// Fungsi untuk memproses pendaftaran akun baru
  /// Jika semua field diisi, maka diarahkan ke halaman Dashboard
  /// Jika masih ada yang kosong, maka muncul pesan peringatan (SnackBar)
  void _signup() {
    if (_name.text.isNotEmpty && _email.text.isNotEmpty && _pass.text.isNotEmpty) {
      // Navigasi ke halaman Dashboard jika pendaftaran berhasil
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      // Tampilkan notifikasi jika input masih kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Semua field wajib diisi!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Body adalah bagian utama tampilan halaman
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),

        /// Column menata semua widget secara vertikal di tengah layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan secara vertikal
          children: [
            /// 🔹 Ikon utama halaman Signup (ikon musik)
            const Icon(Icons.library_music, size: 90, color: Color(0xFF1DB954)),

            const SizedBox(height: 20),

            /// 🔹 Judul halaman
            const Text(
              "Buat Akun Baru",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 40),

            /// 🔹 Input field Nama Lengkap
            TextField(
              controller: _name, // Controller untuk mengambil input teks
              decoration: InputDecoration(
                hintText: "Nama Lengkap", // Placeholder teks
                prefixIcon: const Icon(Icons.person), // Ikon di kiri
                filled: true, // Aktifkan warna latar belakang
                fillColor: Colors.grey[900], // Warna abu gelap
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12), // Sudut melengkung
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 Input field Email
            TextField(
              controller: _email,
              decoration: InputDecoration(
                hintText: "Email",
                prefixIcon: const Icon(Icons.email),
                filled: true,
                fillColor: Colors.grey[900],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 Input field Password
            TextField(
              controller: _pass,
              obscureText: true, // Menyembunyikan karakter input
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

            /// 🔹 Tombol utama “Daftar” untuk membuat akun baru
            SizedBox(
              width: double.infinity, // Lebar penuh
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1DB954), // Warna hijau khas Spotify
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Sudut tombol melengkung
                  ),
                ),
                onPressed: _signup, // Jalankan fungsi signup saat ditekan
                child: const Text(
                  "Daftar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            /// 🔹 Tombol teks untuk kembali ke halaman Login
            TextButton(
              onPressed: () {
                // Navigasi kembali ke halaman login (route '/')
                Navigator.pushReplacementNamed(context, '/');
              },
              child: const Text(
                "Sudah punya akun? Login",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
