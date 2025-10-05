import 'package:flutter/material.dart';
import '../widgets/food_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, dynamic>> baksoMenu = const [
    {"nama": "Bakso Urat", "harga": 15000},
    {"nama": "Bakso Telur", "harga": 18000},
    {"nama": "Bakso Malang", "harga": 25000},
    {"nama": "Bakso Jumbo", "harga": 30000},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bakso Mantap"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: baksoMenu.length,
        itemBuilder: (context, index) {
          return FoodCard(
            nama: baksoMenu[index]["nama"],
            harga: baksoMenu[index]["harga"],
            onAddToCart: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("${baksoMenu[index]["nama"]} ditambahkan ke keranjang"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
