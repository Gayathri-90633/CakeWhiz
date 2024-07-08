import 'package:flutter/material.dart';
import 'package:myapp/Screens/support.dart';
import 'package:myapp/Screens/Trips.dart';
import 'package:myapp/Screens/wallet.dart';
import 'package:myapp/Widgets/appBar.dart'; // Assuming you have your custom AppBar widget
import 'package:myapp/Screens/hi.dart';
import 'package:myapp/Widgets/BottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;

  static List<Widget> _widgetsOptions = <Widget>[
    hi(),
    TripsScreen(),
    WalletScreen(), // Add ProfileScreen widget here
  ];

  int _selectedIndex = 0;
  String _searchQuery = '';
  List<Map<String, dynamic>> _allItems = [];
  List<Map<String, dynamic>> _filteredItems = [];
  List<Map<String, dynamic>> _cartItems = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeItems();
  }

  void _initializeItems() {
    _allItems = [
      {'title': 'Chocolate cake', 'description': 'Rs.200', 'rating': 4.5, 'imagePath': 'images/chocolate.jpg', 'type': 'Cakes'},
      {'title': 'Mango cake', 'description': 'Rs.300', 'rating': 4.7, 'imagePath': 'images/mango.jpg', 'type': 'Cakes'},
      {'title': 'Redvelvet cake', 'description': 'Rs.410', 'rating': 5.0, 'imagePath': 'images/red.jpg', 'type': 'Cakes'},
      {'title': 'Strawberry cake', 'description': 'Rs.250', 'rating': 4.3, 'imagePath': 'images/strawberry.jpg', 'type': 'Cakes'},
      {'title': 'Vanilla cake', 'description': 'Rs.100', 'rating': 4.2, 'imagePath': 'images/vanilla.jpg', 'type': 'Cakes'},
      {'title': 'Strawberry Shortcake Cupcakes', 'description': 'Rs.80', 'rating': 4.6, 'imagePath': 'images/Strawberry.jpg', 'type': 'Cupcakes'},
      {'title': 'Lemon Cupcakes', 'description': 'Rs.50', 'rating': 4.4, 'imagePath': 'images/Lemon.jpg', 'type': 'Cupcakes'},
      {'title': 'Ultimate Nutella Cupcakes', 'description': 'Rs.120', 'rating': 4.7, 'imagePath': 'images/Nutella.jpg', 'type': 'Cupcakes'},
      {'title': 'Chocolate Cupcakes with Peanut Butter Frosting', 'description': 'Rs.90', 'rating': 4.5, 'imagePath': 'images/Peanut.jpg', 'type': 'Cupcakes'},
      {'title': 'Coconut Cupcakes', 'description': 'Rs.70', 'rating': 3.3, 'imagePath': 'images/Coconut.jpg', 'type': 'Cupcakes'},
      {'title': 'Oreo Cupcakes', 'description': 'Rs.140', 'rating': 4.8, 'imagePath': 'images/Oreo.jpg', 'type': 'Cupcakes'},
      {'title': 'Ultimate Salted Caramel Cupcakes', 'description': 'Rs.90', 'rating': 4.6, 'imagePath': 'images/Caramel.jpg', 'type': 'Cupcakes'},
      {'title': 'Red Velvet Cupcakes', 'description': 'Rs.60', 'rating': 4.4, 'imagePath': 'images/RedVelvet.jpg', 'type': 'Cupcakes'},
      {'title': 'S’mores Cupcakes with Graham Cracker Frosting', 'description': 'Rs.110', 'rating': 4.5, 'imagePath': 'images/Smores.jpg', 'type': 'Cupcakes'},
      {'title': 'Chocolate Cherry Cupcakes', 'description': 'Rs.80', 'rating': 4.2, 'imagePath': 'images/Chocolate.jpg', 'type': 'Cupcakes'},
      {'title': 'Edible Bakeshop® Brownie', 'description': 'Rs.68', 'rating': 4.6, 'imagePath': 'images/Bakeshop.jpg', 'type': 'Brownies'},
      {'title': 'Fudge Walnut Brownies', 'description': 'Rs.80', 'rating': 4.7, 'imagePath': 'images/Fudge.jpg', 'type': 'Brownies'},
      {'title': 'Fudge Iced Brownies', 'description': 'Rs.45', 'rating': 4.1, 'imagePath': 'images/Iced.jpg', 'type': 'Brownies'},
      {'title': 'Blondies', 'description': 'Rs.49', 'rating': 4.3, 'imagePath': 'images/Blondies.jpg', 'type': 'Brownies'},
      {'title': 'Peanut Butter Brownies', 'description': 'Rs.90', 'rating': 4.9, 'imagePath': 'images/Butter.jpg', 'type': 'Brownies'},
      {'title': 'Nutella Brownies', 'description': 'Rs.30', 'rating': 4.2, 'imagePath': 'images/nutella1.jpg', 'type': 'Brownies'},
      {'title': 'Double Chocolate Brownies with White Chocolate Drizzle', 'description': 'Rs.70', 'rating': 4.6, 'imagePath': 'images/Double.jpg', 'type': 'Brownies'},
      {'title': 'Mint Chocolate Brownies', 'description': 'Rs.66', 'rating': 4.4, 'imagePath': 'images/Mint.jpg', 'type': 'Brownies'},
      {'title': 'Espresso Brownies', 'description': 'Rs.95', 'rating': 2.7, 'imagePath': 'images/Espresso.jpg', 'type': 'Brownies'},
      {'title': 'Caramel Brownies', 'description': 'Rs.50', 'rating': 4.5, 'imagePath': 'images/Caramel1.jpg', 'type': 'Brownies'},
    ];
    _filteredItems = List.from(_allItems);
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _filteredItems = _allItems.where((item) {
        return item['title']!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addItemToCart(Map<String, dynamic> item) {
    setState(() {
      bool itemExists = false;
      for (var cartItem in _cartItems) {
        if (cartItem['title'] == item['title']) {
          cartItem['quantity']++;
          itemExists = true;
          break;
        }
      }
      if (!itemExists) {
        _cartItems.add({'title': item['title'], 'description': item['description'], 'imagePath': item['imagePath'], 'quantity': 1});
      }
    });
  }

  void _showMoreDetails(Map<String, dynamic> item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item['title']!),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(item['imagePath']!, height: 100, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(
              item['description']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                SizedBox(width: 4),
                Text(
                  item['rating'].toString(),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
          TextButton(
            onPressed: () {
              _addItemToCart(item);
              Navigator.of(context).pop();
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Text(
            'CakeWhiz',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'YourFontFamily', // Set your custom font family here
              fontSize: 24, // Adjust the font size as needed
              fontWeight: FontWeight.bold, // Adjust the font weight as needed
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(cartItems: _cartItems)),
              );
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          if (_selectedIndex == 0) // Show search bar and tabs only on the HomeScreen
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search for Cakes, Cupcakes, Brownies',
                      prefixIcon: Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Color.fromARGB(255, 218, 218, 217),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    ),
                    onChanged: _onSearchChanged,
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black, // Active tab label color
                  unselectedLabelColor: Colors.grey, // Inactive tab label color
                  indicator: BoxDecoration(
                    color: Color.fromARGB(52, 156, 125, 63),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  tabs: [
                    Tab(text: 'Cakes'),
                    Tab(text: 'Cupcakes'),
                    Tab(text: 'Brownies'),
                  ],
                ),
              ],
            ),
          Expanded(
            child: _selectedIndex == 0
                ? TabBarView(
                    controller: _tabController,
                    children: [
                      _buildTabContent('Cakes'),
                      _buildTabContent('Cupcakes'),
                      _buildTabContent('Brownies'),
                    ],
                  )
                : _widgetsOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildTabContent(String type) {
    List<Map<String, dynamic>> items = _filteredItems.where((item) => item['type'] == type).toList();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((item) {
          return _buildListItem(
            item,
            Colors.brown.withOpacity(0.1),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildListItem(Map<String, dynamic> item, Color backgroundColor) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor, // Set the background color
        border: Border.all(color: backgroundColor.darken()), // Darker border
        borderRadius: BorderRadius.circular(12), // Added border radius
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50), // ClipRRect for rounded image corners
            child: Image.asset(
              item['imagePath']!,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title']!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  item['description']!,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      item['rating'].toString(),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 8), // Adjust spacing as needed
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  _addItemToCart(item);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${item['title']} added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 13),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 8),
              TextButton(
                onPressed: () => _showMoreDetails(item),
                child: Text(
                  'More Details',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _incrementQuantity(int index) {
    setState(() {
      widget.cartItems[index]['quantity']++;
    });
  }

  void _decrementQuantity(int index) {
    setState(() {
      if (widget.cartItems[index]['quantity'] > 1) {
        widget.cartItems[index]['quantity']--;
      } else {
        _removeItem(index);
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      widget.cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          final item = widget.cartItems[index];
          return ListTile(
            leading: Image.asset(
              item['imagePath']!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(item['title']!),
            subtitle: Text('${item['description']} x${item['quantity']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.remove, color: Colors.red), // Red color for decrement
                  onPressed: () => _decrementQuantity(index),
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.green), // Green color for increment
                  onPressed: () => _incrementQuantity(index),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.black), // Black color for delete
                  onPressed: () => _removeItem(index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

extension ColorUtils on Color {
  /// Darkens the color by the specified [amount].
  ///
  /// The [amount] must be between 0.0 and 1.0, where 0.0 returns the original color
  /// and 1.0 returns black.
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }
}
