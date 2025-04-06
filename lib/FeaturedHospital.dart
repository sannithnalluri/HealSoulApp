import 'package:featuedhospatial/ServiceMenu.dart';
import 'package:featuedhospatial/menuCat.dart';
import 'package:flutter/material.dart';

class FeaturedHospital extends StatefulWidget {
  const FeaturedHospital({super.key});

  @override
  State<FeaturedHospital> createState() => _FeaturedHospitalState();
}

class _FeaturedHospitalState extends State<FeaturedHospital> {
  final List<Map<String, String>> hospitals = [
    {
      "hospitalName": "MNR Hospital",
      "location": "Hyderabad",
      "discount": "20% off on first visit",
      "rating": "4.5",
      "specialist": "Cardiology, Neurology",
      "imageUrl":
      "https://img.freepik.com/free-vector/hand-drawn-hospital-cartoon-illustration_23-2150566481.jpg"
    },
    {
      "hospitalName": "Apollo Clinic",
      "location": "Secunderabad",
      "discount": "10% discount",
      "rating": "4.8",
      "specialist": "Orthopedics, General Medicine",
      "imageUrl":
      "https://img.freepik.com/free-photo/nobody-office-with-medical-equipment-instruments_482257-27345.jpg"
    },
    {
      "hospitalName": "Apollo Clinic",
      "location": "Secunderabad",
      "discount": "10% discount",
      "rating": "4.8",
      "specialist": "Orthopedics, General Medicine",
      "imageUrl":
      "https://img.freepik.com/free-photo/nobody-office-with-medical-equipment-instruments_482257-27345.jpg"
    },
    {
      "hospitalName": "Apollo Clinic",
      "location": "Secunderabad",
      "discount": "10% discount",
      "rating": "4.8",
      "specialist": "Orthopedics, General Medicine",
      "imageUrl":
      "https://img.freepik.com/free-photo/nobody-office-with-medical-equipment-instruments_482257-27345.jpg"
    },
  ];

  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    final filteredHospitals = hospitals.where((hospital) {
      final location = hospital["location"]!.toLowerCase();
      return location.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // 🔝 AppBar
          SliverAppBar(
            pinned: true,
            floating: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("INMED"),
                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.black),
                    SizedBox(width: 6),
                    Text(
                      "Hyderabad",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),

          // 🔍 Search Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search for Doctors, Specialists...",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ),

          // 📁 Menu Categories
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(1),
              child: SizedBox(
                height: 70,
                child: MenuCat(),
              ),
            ),
          ),

          // 🧾 Service Menu
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(4),
              child: ServiceMenu(),
            ),
          ),

          // 🏥 Hospital Cards
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final hospital = filteredHospitals[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Hospital Image
                        ClipRRect(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            hospital["imageUrl"]!,
                            height: 180,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hospital["hospitalName"] ?? "",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.location_on,
                                      size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text(hospital["location"] ?? ""),
                                  Spacer(),
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  SizedBox(width: 2),
                                  Text(hospital["rating"] ?? ""),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Specialists: ${hospital["specialist"]}"),
                              SizedBox(height: 4),
                              Text(
                                hospital["discount"] ?? "",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () {
                                  print("Booking at ${hospital["hospitalName"]}");
                                },
                                child: Text("Book Appointment"),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              childCount: filteredHospitals.length,
            ),
          )
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(

          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        )
    );
  }
}
