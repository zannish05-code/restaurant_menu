
import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Menu',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        scaffoldBackgroundColor: Colors.orange.shade50,
      ),
      home: const MenuScreen(),
    );
  }
}

// MAIN RESTAURANT MENU SCREEN
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Restaurant Menu'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Welcome to My Restaurant!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          // FOOD CARD 1
          foodCard(
            context,
            'Nasi Lemak',
            'Delicious coconut rice with sambal and egg',
            'RM 8.50',
            Icons.rice_bowl,
          ),

          // FOOD CARD 2
          foodCard(
            context,
            'Chicken Burger',
            'Juicy chicken burger with fresh vegetables',
            'RM 12.90',
            Icons.lunch_dining,
          ),

          // FOOD CARD 3
          foodCard(
            context,
            'Spaghetti Bolognese',
            'Italian pasta with tomato and meat sauce',
            'RM 15.90',
            Icons.dinner_dining,
          ),
        ],
      ),
    );
  }

  // FUNCTION TO CREATE FOOD CARDS
  Widget foodCard(
    BuildContext context,
    String name,
    String description,
    String price,
    IconData foodIcon,
  ) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FoodDetailScreen(
                name: name,
                description: description,
                price: price,
                foodIcon: foodIcon,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(
                foodIcon,
                size: 50,
                color: Colors.deepOrange,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(description),
                    const SizedBox(height: 8),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

// FOOD DETAILS SCREEN
class FoodDetailScreen extends StatelessWidget {
  final String name;
  final String description;
  final String price;
  final IconData foodIcon;

  const FoodDetailScreen({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.foodIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                foodIcon,
                size: 120,
                color: Colors.deepOrange,
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Back to Menu'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
