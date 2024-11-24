import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromRGBO(230, 190, 250, 1), // Light lavender background
      appBar: AppBar(
        title: const Text("Home",
            style: TextStyle(
              color: Color.fromRGBO(
                  230, 190, 250, 1), // Set the color of the title text
            )),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "Welcome to the Flight Booking System!",
          style: TextStyle(
            fontSize: 24,
            color: Color.fromARGB(255, 250, 250, 250),
          ),
        ),
      ),
    );
  }
}
