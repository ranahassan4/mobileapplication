import 'package:flutter/material.dart';

// class ProfilePage extends StatelessWidget {
// class ProfilePage extends StatelessWidget {
class ProfilePages extends StatelessWidget {
  final String? departureCity;
  final String? arrivalCity;
  final DateTime? departureDate;
  final DateTime? returnDate;
  final int passengers;
  final String? classType;
  final double price;

  const ProfilePages({
    super.key,
    required this.departureCity,
    required this.arrivalCity,
    required this.departureDate,
    required this.returnDate,
    required this.passengers,
    required this.classType,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.purple),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.purple),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3, // Adjust width
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.airplanemode_active,
                color: Colors.purple,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                "Departure City: $departureCity",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Arrival City: $arrivalCity",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Departure Date: ${departureDate?.toLocal()}",
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Text(
                "Return Date: ${returnDate?.toLocal()}",
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Text(
                "Passengers: $passengers",
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 8),
              Text(
                "Class: $classType",
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),
              Text(
                "Total Price: \$${price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
