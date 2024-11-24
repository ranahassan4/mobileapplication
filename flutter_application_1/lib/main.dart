import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'home_pages.dart';
import 'booking_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking System',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        iconTheme: const IconThemeData(
          color: Colors.purple, // Set the default color for icons
        ),
      ),
      // Purple primary color

      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const BookingPage(),
    ProfilePages(
      departureCity: 'New York',
      arrivalCity: 'Los Angeles',
      departureDate: DateTime.now(),
      returnDate: DateTime.now().add(const Duration(days: 7)),
      passengers: 2,
      classType: 'Economy',
      price: 1800.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket), label: 'Booking'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
