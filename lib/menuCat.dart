import 'package:flutter/material.dart';

class MenuCat extends StatefulWidget {
  @override
  State<MenuCat> createState() => _MenuCatState();
}

class _MenuCatState extends State<MenuCat> {
  int currentCatlog = 1;

  final List<String> list = [
    "All",
    "Cardiology",
    "Orthopedics",
    "Neurology",
    "Psychiatry",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final isSelected = currentCatlog == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                currentCatlog = index;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Chip(
                label: Text(
                  list[index],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                backgroundColor:
                isSelected ? Colors.black : Colors.grey.shade300,
              ),
            ),
          );
        },
      ),
    );
  }
}
