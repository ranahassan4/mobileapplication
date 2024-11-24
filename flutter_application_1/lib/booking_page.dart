import 'package:flutter/material.dart';
// class BookingPage extends StatefulWidget {
// class BookingPage extends StatefulWidget {
// class BookingPage extends StatefulWidget {
import 'profile_page.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});
  @override
  BookingPageState createState() => BookingPageState();
}

class BookingPageState extends State<BookingPage> {
  String? selectedDepartureCity;
  String? selectedArrivalCity;
  DateTime? departureDate;
  DateTime? returnDate;
  int numberOfPassengers = 1;
  String? selectedClass;
  TextEditingController discountController = TextEditingController();
  double totalPrice = 1000.0;

  final List<String> cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'San Francisco'
  ];
  final List<String> classes = ['Economy', 'Business', 'First Class'];

  void calculatePrice() {
    totalPrice = 1000.0; // Base price for economy class
    if (selectedClass == 'Business') totalPrice *= 1.5;
    if (selectedClass == 'First Class') totalPrice *= 2.0;
    totalPrice *= numberOfPassengers;

    if (discountController.text.isNotEmpty) {
      totalPrice *= 0.9; // Apply 10% discount
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flight Booking",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select Your Flight Details",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Departure City",
                      labelStyle: const TextStyle(color: Colors.purple),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: selectedDepartureCity,
                    hint: const Text("Select Departure City"),
                    onChanged: (value) {
                      setState(() {
                        selectedDepartureCity = value;
                      });
                    },
                    items: cities.map<DropdownMenuItem<String>>((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Arrival City",
                      labelStyle: const TextStyle(color: Colors.purple),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: selectedArrivalCity,
                    hint: const Text("Select Arrival City"),
                    onChanged: (value) {
                      setState(() {
                        selectedArrivalCity = value;
                      });
                    },
                    items: cities.map<DropdownMenuItem<String>>((String city) {
                      return DropdownMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 140, // Adjusted smaller width
                      child: TextButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            setState(() {
                              departureDate = date;
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(8), // Smaller padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          departureDate == null
                              ? 'Departure Date'
                              : 'Dep: ${departureDate?.toLocal().toString().split(' ')[0]}',
                          style: const TextStyle(color: Colors.purple),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 140, // Adjusted smaller width
                      child: TextButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2100),
                          );
                          if (date != null) {
                            setState(() {
                              returnDate = date;
                            });
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.all(8), // Smaller padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          returnDate == null
                              ? 'Return Date'
                              : 'Ret: ${returnDate?.toLocal().toString().split(' ')[0]}',
                          style: const TextStyle(color: Colors.purple),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 250,
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Class",
                      labelStyle: const TextStyle(color: Colors.purple),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    value: selectedClass,
                    hint: const Text("Select Class"),
                    onChanged: (value) {
                      setState(() {
                        selectedClass = value;
                      });
                    },
                    items: classes
                        .map<DropdownMenuItem<String>>((String className) {
                      return DropdownMenuItem<String>(
                        value: className,
                        child: Text(className),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 250, // Adjusted width
                  child: TextFormField(
                    controller: discountController,
                    decoration: InputDecoration(
                      labelText: "Discount Code (Optional)",
                      labelStyle: const TextStyle(color: Colors.purple),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      calculatePrice();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilePages(
                            departureCity: selectedDepartureCity,
                            arrivalCity: selectedArrivalCity,
                            departureDate: departureDate,
                            returnDate: returnDate,
                            passengers: numberOfPassengers,
                            classType: selectedClass,
                            price: totalPrice,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Proceed to Summary",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class ProfilePages extends StatelessWidget {
//   final String? departureCity;
//   final String? arrivalCity;
//   final DateTime? departureDate;
//   final DateTime? returnDate;
//   final int passengers;
//   final String? classType;
//   final double price;

//   const ProfilePages({
//     super.key,
//     required this.departureCity,
//     required this.arrivalCity,
//     required this.departureDate,
//     required this.returnDate,
//     required this.passengers,
//     required this.classType,
//     required this.price,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Booking Summary"),
//       ),
//       body: const Center(
//         child: Text(
//           "Summary details here...",
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
