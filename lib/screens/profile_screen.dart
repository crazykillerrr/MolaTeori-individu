import 'package:flutter/material.dart';

/// Halaman Profil — menampilkan informasi pengguna yang sedang login.
/// Berisi avatar, nama, email, beberapa menu (pengaturan, lagu favorit),
/// dan tombol logout untuk kembali ke halaman login.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Warna hitam gelap (tema Spotify)

      /// 🔹 AppBar di bagian atas layar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparan agar menyatu dengan background
        elevation: 0, // Hilangkan bayangan bawah AppBar
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),

      /// 🔹 Body berisi konten utama profil
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Jarak sisi kiri-kanan
        child: Column(
          children: [
            /// 🔸 Foto Profil (Avatar)
            const CircleAvatar(
              radius: 50, // Ukuran lingkaran
              backgroundColor: Color(0xFF1DB954), // Warna hijau khas Spotify
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=47", // Gambar profil dummy dari internet
              ),
            ),

            const SizedBox(height: 20),

            /// 🔸 Nama Pengguna
            const Text(
              "Dhimas Dzulfajri",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            /// 🔸 Email pengguna
            const Text(
              "dhimas@example.com",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 30),

            /// 🔹 Menu 1: Pengaturan Akun
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF1DB954)),
              title: const Text("Pengaturan Akun"),
              onTap: () {
                // Aksi jika menu ditekan (bisa diarahkan ke halaman pengaturan akun)
              },
            ),

            /// 🔹 Menu 2: Lagu Favorit
            ListTile(
              leading: const Icon(Icons.favorite, color: Color(0xFF1DB954)),
              title: const Text("Lagu Favorit"),
              onTap: () {
                // Aksi jika menu ditekan (misalnya buka daftar lagu favorit user)
              },
            ),

            const Spacer(), // Mendorong tombol logout ke bagian bawah layar

            /// 🔹 Tombol Logout (keluar dari akun)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, // Warna merah untuk logout
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                // Navigasi kembali ke halaman login
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: const Icon(Icons.logout),
              label: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
