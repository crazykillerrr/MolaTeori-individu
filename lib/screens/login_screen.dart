import 'package:flutter/material.dart';

/// halaman Login tampilan awal sebelum masuk ke Dashboard
/// user diminta memasukkan email dan password untuk melanjutkan
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

/// state dari LoginScreen digunakan untuk menyimpan input user
class _LoginScreenState extends State<LoginScreen> {
  // controller untuk mengambil nilai input dari TextField email
  final TextEditingController _email = TextEditingController();

  // controller untuk mengambil nilai input dari TextField password
  final TextEditingController _pass = TextEditingController();

  /// fungsi untuk mengecek input user dan melakukan navigasi
  /// jika email & password terisi, user diarahkan ke Dashboard
  /// jika tidak, maka muncul pesan peringatan (SnackBar)
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
      resizeToAvoidBottomInset:
          true, // mencegah overflow saat keyboard muncul (fix utama)

      /// Body adalah isi utama halaman login
      body: SafeArea(
        //  menjaga tampilan agar tidak tertutup notch/status bar
        child: SingleChildScrollView(
          // membuat layar bisa di-scroll jika konten terlalu panjang
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),

            /// column digunakan untuk menata widget secara vertikal
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, 
              children: [
                /// logo aplikasi 
                const Icon(Icons.music_note,
                    size: 90, color: Color(0xFF1DB954)),

                const SizedBox(height: 20),

                const Text(
                  "Welcome to Music Match",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

                /// input field untuk Email
                TextField(
                  controller: _email, // hubungkan ke controller email
                  decoration: InputDecoration(
                    hintText: "Email", // placeholder teks
                    prefixIcon:
                        const Icon(Icons.email), // ikon di kiri field
                    filled: true, 
                    fillColor: Colors.grey[900], 
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(12), 
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// Input field untuk Password
                TextField(
                  controller: _pass, // hubungkan ke controller password
                  obscureText: true, // 
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

                /// tombol Login utama
                SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF1DB954), 
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), 
                      ),
                    ),
                    onPressed:
                        _login, // jalankan fungsi login saat ditekan
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

                /// tombol teks untuk pindah ke halaman Sign Up
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
        ),
      ),
    );
  }
}
