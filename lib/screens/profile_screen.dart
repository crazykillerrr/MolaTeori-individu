import 'package:flutter/material.dart';

/// Halaman Profil — menampilkan informasi pengguna yang sedang login.
/// Berisi avatar, nama, email, beberapa menu (pengaturan, lagu favorit),
/// dan tombol logout untuk kembali ke halaman login.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),

      ///AppBar di bagian atas layar
      appBar: AppBar(
        backgroundColor: Colors.transparent, 
        elevation: 0,
        title: const Text(
          "Profil Saya",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),

      /// konten utama profil
      body: Padding(
        padding: const EdgeInsets.all(24.0), // Jarak sisi kiri-kanan
        child: Column(
          children: [
            /// Foto Profil (Avatar)
            const CircleAvatar(
              radius: 50, 
              backgroundColor: Color(0xFF1DB954),
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=47", // Gambar profil dummy dari internet
              ),
            ),

            const SizedBox(height: 20),

           
            const Text(
              "Dhimas Dzulfajri",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 5),

            ///
            const Text(
              "dhimas@example.com",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 30),

            /// Menu 1: Pengaturan Akun
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF1DB954)),
              title: const Text("Pengaturan Akun"),
              onTap: () {
                //  diarahkan ke halaman pengaturan akun
              },
            ),

            /// 🔹 Menu 2: Lagu Favorit
            ListTile(
              leading: const Icon(Icons.favorite, color: Color(0xFF1DB954)),
              title: const Text("Lagu Favorit"),
              onTap: () {
                // buka daftar lagu favorit user
              },
            ),

            const Spacer(), 
            ///Tombol Logout (keluar dari akun)
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent, 
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
