import 'package:flutter/material.dart';

class ServiceMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
        physics: NeverScrollableScrollPhysics(), // To allow outer scrolling
        children: [
          buildServiceItem(
            icon: Icons.person,
            title: "Doctor",
            subtitle: "Book Appointment",
          ),
          buildServiceItem(
            icon: Icons.science,
            title: "Lab Tests",
            subtitle: "Book Appointment",
          ),
          buildServiceItem(
            icon: Icons.local_pharmacy,
            title: "Pharmacy",
            subtitle: "Order Medicine",
          ),
          buildServiceItem(
            icon: Icons.local_hospital,
            title: "Hospital",
            subtitle: "Book Bed",
          ),
        ],
      ),
    );
  }

  Widget buildServiceItem({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 50),
          SizedBox(height: 12),
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
