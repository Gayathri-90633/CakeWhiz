import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key, required List<Map<String, dynamic>> cartItems});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  // Sample data for demonstration
  final List<Map<String, dynamic>> _items = [
    {'title': 'Chocolate Cake', 'price': 'Rs.200', 'quantity': 1, 'image': 'images/chocolate.jpg'},
    {'title': 'Vanilla Cake', 'price': 'Rs.100', 'quantity': 1, 'image': 'images/vanilla.jpg'},
    {'title': 'Strawberry Cake', 'price': 'Rs.250', 'quantity': 1, 'image': 'images/strawberry.jpg'},
  ];

  // Increment item quantity
  void _incrementQuantity(int index) {
    setState(() {
      _items[index]['quantity'] += 1;
    });
  }

  // Decrement item quantity
  void _decrementQuantity(int index) {
    setState(() {
      if (_items[index]['quantity'] > 1) {
        _items[index]['quantity'] -= 1;
      }
    });
  }

  // Remove item from the list
  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  // Calculate total price
  String _calculateTotalPrice() {
    final total = _items.fold<double>(
      0.0,
      (sum, item) => sum + double.parse(item['price'].replaceAll('Rs.', '')) * item['quantity'],
    );
    return 'Rs.${total.toStringAsFixed(2)}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('~Cart'),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey), // Border color
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item['image'],
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                item['price'],
                                style: const TextStyle(fontSize: 14, color: Colors.grey),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                                    onPressed: () => _decrementQuantity(index),
                                  ),
                                  Text(
                                    '${item['quantity']}',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle, color: Colors.green),
                                    onPressed: () => _incrementQuantity(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.black),
                          onPressed: () => _removeItem(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  _calculateTotalPrice(),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                _proceedToCheckout(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 172, 166, 122), // Background color
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(fontSize: 19, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _proceedToCheckout(BuildContext context) {
    final totalPrice = _calculateTotalPrice();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Checkout'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Total Price: $totalPrice'),
            const SizedBox(height: 10),
            Text('Please provide your payment details to complete the purchase.'),
            // Add your payment form or additional steps here
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Implement payment processing logic here
              print('Payment processing initiated.');
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Proceed to Payment'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
