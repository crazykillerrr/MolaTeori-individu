import 'package:flutter/material.dart';

/// Halaman utama (Dashboard) — menampilkan daftar musik, kategori, dan mini player
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Index tab yang sedang aktif di BottomNavigationBar
  int _selectedIndex = 0;

  // Status untuk menentukan apakah musik sedang diputar atau tidak (true = play)
  bool isPlaying = false;

  // Daftar kategori di bagian atas (filter horizontal)
  final List<Map<String, dynamic>> _categories = [
    {"label": "Semua"},
    {"label": "Musik"},
    {"label": "Mengikuti"},
    {"label": "Podcast"},
  ];

  // Daftar playlist atau lagu yang terakhir diputar (grid 2 kolom)
  final List<Map<String, String>> _recentPlay = [
    {
      "title": "pulang kampus",
      "image": "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4"
    },
    {
      "title": "Dalam Dinamika",
      "image": "https://images.unsplash.com/photo-1497032628192-86f99bcd76bc"
    },
    {
      "title": "Radio Kalibata, 2012",
      "image": "https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2"
    },
    {
      "title": "20",
      "image": "https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3"
    },
  ];

  // Daftar rekomendasi musik seperti Hindia (horizontal scroll)
  final List<Map<String, String>> _mixTop = [
    {
      "title": "Peradaban",
      "artist": ".Feast",
      "image": "https://images.unsplash.com/photo-1470225620780-dba8ba36b745"
    },
    {
      "title": "Hindia",
      "artist": ".Feast, Nadin Amizah",
      "image": "https://images.unsplash.com/photo-1495435229349-e86db7bfa013"
    },
    {
      "title": "Nina",
      "artist": ".Feast",
      "image": "https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2"
    },
  ];

  /// Fungsi untuk menangani klik pada BottomNavigationBar
  /// Jika index == 3 (tab profil), maka navigasi ke halaman Profile
  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);

    if (index == 3) {
      Navigator.pushNamed(context, '/profile');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Warna background hitam 

      /// AppBar di atas (judul aplikasi dan ikon pengaturan)
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Music Match",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),

      /// Body utama (isi konten yang bisa discroll)
      body: Column(
        children: [
          /// Expanded agar ListView bisa scroll di dalam column
          Expanded(
            child: ListView(
              children: [
                const SizedBox(height: 10),

                /// Bagian Kategori (horizontal scroll)
                SizedBox(
                  height: 45,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      // Warna aktif untuk kategori "Musik"
                      final isActive = index == 1;
                      return Container(
                        margin: const EdgeInsets.only(right: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFF1DB954) // Hijau Spotify
                              : Colors.grey[800],
                          borderRadius: BorderRadius.circular(24),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          _categories[index]['label'],
                          style: TextStyle(
                            color: isActive ? Colors.black : Colors.white,
                            fontWeight:
                                isActive ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),

                /// Grid Recent Playlist (2 kolom)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GridView.builder(
                    itemCount: _recentPlay.length,
                    shrinkWrap: true, // Agar grid menyesuaikan tinggi konten
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Dua kolom
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 2.8, // Lebar dibanding tinggi
                    ),
                    itemBuilder: (context, index) {
                      // Tiap card playlist
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[900],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            // Gambar playlist
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  bottomLeft: Radius.circular(8)),
                              child: Image.network(
                                _recentPlay[index]['image']!,
                                width: 60,
                                height: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Judul playlist
                            Expanded(
                              child: Text(
                                _recentPlay[index]['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 25),

                /// 🔹 Bagian “Lainnya Seperti Hindia”
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Lainnya seperti Hindia",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 12),

                /// 🔹 Daftar musik horizontal (rekomendasi)
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _mixTop.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Gambar album
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                _mixTop[index]["image"]!,
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // Judul lagu
                            Text(
                              _mixTop[index]["title"]!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              overflow: TextOverflow.ellipsis,
                            ),
                            // Nama artis
                            Text(
                              _mixTop[index]["artist"]!,
                              style: const TextStyle(color: Colors.white70),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),

          /// Mini Player (Now Playing) di bagian bawah layar
          /// Tidak menutupi konten lain karena diletakkan di dalam Column
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Gambar album lagu yang sedang diputar
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1507874457470-272b3c8d8ee2",
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                // Nama lagu dan artis
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alexandra",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text("Hindia", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                ),
                // Tombol Play/Pause
                IconButton(
                  onPressed: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause_circle : Icons.play_circle_fill,
                    color: const Color(0xFF1DB954),
                    size: 38,
                  ),
                )
              ],
            ),
          ),
        ],
      ),

      /// 🔹 Bottom Navigation Bar untuk navigasi antar halaman
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF1DB954), // Hijau Spotify
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped, // Panggil fungsi saat item ditekan
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cari'),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: 'Koleksi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
