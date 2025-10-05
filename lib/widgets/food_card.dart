import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String nama;
  final int harga;
  final VoidCallback onAddToCart;

  const FoodCard({
    super.key,
    required this.nama,
    required this.harga,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.ramen_dining, color: Colors.deepOrange, size: 32),
        title: Text(
          nama,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text("Rp $harga"),
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: onAddToCart,
          child: const Text("Tambah"),
        ),
      ),
    );
  }
}
