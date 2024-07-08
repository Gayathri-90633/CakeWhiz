import 'package:flutter/material.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({Key? key}) : super(key: key);

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  List<String> tripImages = [
    'images/pancakes.jpg',
    'images/chocolates.jpg',
    'images/sweets.jpg',
    'images/icecreams.jpg',
  ];

  List<String> tripTitles = [
    'Pancakes',
    'Chocolates',
    'Sweets',
    'Icecreams',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('~Shop by Categories'),
        backgroundColor: Colors.black12, // Set screen title
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: tripImages.length,
        itemBuilder: (context, index) {
          return _buildTripItem(tripImages[index], tripTitles[index], index);
        },
      ),
    );
  }

  Widget _buildTripItem(String imagePath, String title, int index) {
    return GestureDetector(
      onTap: () {
        // Define your onTap action here
        print('Tapped on $title');
        // You can navigate to another screen or show a dialog, etc.
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(title: title),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurpleAccent), // Added border color
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 120, // Adjust height to your needs
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;

  const DetailScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: _buildDetailContent(context),
      ),
    );
  }

  Widget _buildDetailContent(BuildContext context) {
    if (title == 'Pancakes') {
      return _buildPancakesContent(context);
    } else if (title == 'Chocolates') {
      return _buildChocolatesContent();
    } else if (title == 'Sweets') {
      return _buildSweetsContent();
    } else if (title == 'Icecreams') {
      return _buildIcecreamsContent();
    } else {
      return Text('Details about $title');
    }
  }

  Widget _buildPancakesContent(BuildContext context) {
    List<String> pancakeImages = [
      'images/classic1.jpeg',
      'images/blueberry.jpeg',
      'images/banana.jpg',
      'images/chip.jpeg',
      'images/straw4.jpeg',
    ];

    List<String> pancakeTitles = [
      'Classic Pancake',
      'Blueberry Pancake',
      'Banana Pancake',
      'Chocolate Chip Pancake',
      'Strawberry Pancake',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(pancakeImages.length, (index) {
          String title = pancakeTitles[index];
          return GestureDetector(
            onTap: () {
              if (title == 'Classic Pancake') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClassicPancakeDetailScreen(),
                  ),
                );
              } else if (title == 'Blueberry Pancake') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlueberryPancakeDetailScreen(),
                  ),
                );
              } else if (title == 'Banana Pancake') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BananaPancakeDetailScreen(),
                  ),
                );
              } else if (title == 'Chocolate Chip Pancake') {
                print('Tapped on Chocolate Chip Pancake');
                // Add navigation for Chocolate Chip Pancake if needed
              } else if (title == 'Strawberry Pancake') {
                print('Tapped on Strawberry Pancake');
                // Add navigation for Strawberry Pancake if needed
              }
            },
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pinkAccent), // Added border color
                borderRadius: BorderRadius.circular(12), // Added border radius
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12), // ClipRRect for rounded image corners
                    child: Image.asset(
                      pancakeImages[index],
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
                          title,
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Delicious and fluffy',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildChocolatesContent() {
    List<String> chocolateImages = [
      'images/dark.jpeg',
      'images/milk.jpeg',
      'images/white.jpeg',
      'images/Hazelnut.jpg',
      'images/mint1.jpeg',
    ];

    List<String> chocolateTitles = [
      'Dark Chocolate',
      'Milk Chocolate',
      'White Chocolate',
      'Hazelnut Chocolate',
      'Mint Chocolate',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(chocolateImages.length, (index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orangeAccent), // Added border color
              borderRadius: BorderRadius.circular(12), // Added border radius
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // ClipRRect for rounded image corners
                  child: Image.asset(
                    chocolateImages[index],
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
                        chocolateTitles[index],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Delicious and sweet',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildSweetsContent() {
    List<String> sweetsImages = [
      'images/candy.jpg',
      'images/cookies.jpg',
      'images/brownies.jpeg',
      'images/muffins.jpeg',
      'images/pies.jpeg',
    ];

    List<String> sweetsTitles = [
      'Candy',
      'Cookies',
      'Brownies',
      'Muffins',
      'Pies',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(sweetsImages.length, (index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.greenAccent), // Added border color
              borderRadius: BorderRadius.circular(12), // Added border radius
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // ClipRRect for rounded image corners
                  child: Image.asset(
                    sweetsImages[index],
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
                        sweetsTitles[index],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Delicious and sweet',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIcecreamsContent() {
    List<String> icecreamImages = [
      'images/Black.jpg',
      'images/choco.jpeg',
      'images/kulfi.jpeg',
      'images/sand.jpeg',
      'images/scotch.jpeg',
    ];

    List<String> icecreamTitles = [
      'Black Currant Icecream',
      'Chocolate Icecream',
      'Kulfi Icecream',
      'Oreo Sandwich Icecream',
      'Butterscotch Icecream',
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(icecreamImages.length, (index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurpleAccent), // Added border color
              borderRadius: BorderRadius.circular(12), // Added border radius
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12), // ClipRRect for rounded image corners
                  child: Image.asset(
                    icecreamImages[index],
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
                        icecreamTitles[index],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Delicious and creamy',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ClassicPancakeDetailScreen extends StatelessWidget {
  const ClassicPancakeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classic Pancake'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.asset('images/classic1.jpeg', width: 200, height: 200),
          SizedBox(height: 16),
          Text(
            'Classic Pancake',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            '- 1 cup all-purpose flour\n'
            '- 2 tablespoons sugar\n'
            '- 2 teaspoons baking powder\n'
            '- 1/2 teaspoon salt\n'
            '- 1 cup milk\n'
            '- 1 egg\n'
            '- 2 tablespoons melted butter\n'
            '- 1 teaspoon vanilla extract\n'
            '- Fresh fruits and syrup for topping\n'
            '                                                   \n'
            'Preparation:\n'
            '1. In a large bowl, whisk together the flour, sugar, baking powder, and salt.\n'
            '2. In another bowl, whisk together the milk, egg, melted butter, and vanilla extract.\n'
            '3. Pour the wet ingredients into the dry ingredients and stir until just combined.\n'
            '4. Heat a non-stick skillet or griddle over medium heat and lightly grease it.\n'
            '5. Pour 1/4 cup of batter onto the skillet for each pancake.\n'
            '6. Cook until bubbles form on the surface, then flip and cook until golden brown on both sides.\n'
            '7. Serve warm with fresh fruits and syrup of your choice.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BlueberryPancakeDetailScreen extends StatelessWidget {
  const BlueberryPancakeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blueberry Pancake'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.asset('images/blueberry.jpeg', width: 200, height: 200),
          SizedBox(height: 16),
          Text(
            'Blueberry Pancake',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            '- 1 cup all-purpose flour\n'
            '- 2 tablespoons granulated sugar\n'
            '- 1 tablespoon baking powder\n'
            '- 1/2 teaspoon salt\n'
            '- 3/4 cup milk\n'
            '- 1/4 cup plain Greek yogurt or buttermilk\n'
            '- 1 large egg\n'
            '- 2 tablespoons unsalted butter, melted\n'
            '- 1 teaspoon vanilla extract\n'
            '- 1 cup fresh or frozen blueberries\n'
            '- Butter or oil for cooking\n'
            '                                          \n'
            'Preparation:\n'
            '1. In a large bowl, whisk together the flour, sugar, baking powder, and salt.\n'
            '2. In another bowl, combine the milk, Greek yogurt (or buttermilk), egg, melted butter, and vanilla extract. Mix well until smooth.\n'
            '3. Pour the wet ingredients into the dry ingredients. Stir gently until just combined. The batter will be lumpy; be careful not to over-mix.\n'
            '4. Gently fold in the blueberries, being careful not to overwork the batter.\n'
            '5. Heat a non-stick skillet or griddle over medium heat. Lightly grease with butter or oil.\n'
            '6. Pour 1/4 cup of batter onto the skillet for each pancake. Cook until bubbles form on the surface and the edges look set, about 2-3 minutes. Flip and cook until golden brown on the other side, about 1-2 minutes more.\n'
            '7. Serve the pancakes warm with additional blueberries, maple syrup, and a dusting of powdered sugar if desired.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

class BananaPancakeDetailScreen extends StatelessWidget {
  const BananaPancakeDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Banana Pancake'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Image.asset('images/banana.jpg', width: 200, height: 200),
          SizedBox(height: 16),
          Text(
            'Banana Pancake',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            '- 1 cup all-purpose flour\n'
            '- 2 tablespoons sugar\n'
            '- 2 teaspoons baking powder\n'
            '- 1/2 teaspoon salt\n'
            '- 1 cup milk\n'
            '- 1 egg\n'
            '- 2 tablespoons melted butter\n'
            '- 1 teaspoon vanilla extract\n'
            '- 1 ripe banana, mashed\n'
            '- Fresh banana slices for topping\n'
            '                                        \n'
            'Preparation:\n'
            '1. In a large bowl, whisk together the flour, sugar, baking powder, and salt.\n'
            '2. In another bowl, whisk together the milk, egg, melted butter, and vanilla extract.\n'
            '3. Add the mashed banana to the wet ingredients and mix well.\n'
            '4. Pour the wet ingredients into the dry ingredients and stir until just combined.\n'
            '5. Heat a non-stick skillet or griddle over medium heat and lightly grease it.\n'
            '6. Pour 1/4 cup of batter onto the skillet for each pancake.\n'
            '7. Cook until bubbles form on the surface, then flip and cook until golden brown on both sides.\n'
            '8. Serve warm with fresh banana slices and syrup of your choice.',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
