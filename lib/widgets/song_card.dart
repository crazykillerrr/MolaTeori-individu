import 'package:flutter/material.dart';

class SongCard extends StatelessWidget {
  final String title;
  final String artist;

  const SongCard({super.key, required this.title, required this.artist});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(
          Icons.music_note,
          color: Color(0xFF1DB954),
          size: 32,
        ),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(artist, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(
          Icons.play_circle_fill,
          color: Color(0xFF1DB954),
          size: 32,
        ),
      ),
    );
  }
}
