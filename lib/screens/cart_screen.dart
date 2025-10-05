import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cartItems = [
      {"nama": "Bakso Urat", "harga": 15000, "jumlah": 2},
      {"nama": "Bakso Telur", "harga": 18000, "jumlah": 1},
    ];

    int total = cartItems.fold(
        0, (sum, item) => sum + (item["harga"] as int) * (item["jumlah"] as int));

    return Scaffold(
      appBar: AppBar(title: const Text("Keranjang")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(Icons.ramen_dining, color: Colors.green),
                    title: Text(cartItems[index]["nama"]),
                    subtitle: Text(
                      "Rp ${cartItems[index]["harga"]} x ${cartItems[index]["jumlah"]}",
                    ),
                    trailing: Text(
                      "Rp ${(cartItems[index]["harga"] as int) * (cartItems[index]["jumlah"] as int)}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey[200]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: Rp $total",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Pesanan berhasil!")),
                    );
                  },
                  child: const Text("Checkout"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
