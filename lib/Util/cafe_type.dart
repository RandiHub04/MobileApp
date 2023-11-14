// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CafeType extends StatelessWidget {
  final String cafeType;
  final bool isSelected;
  final VoidCallback onTap;

  CafeType({
    required this.cafeType,
    required this.isSelected,
    required this.onTap,
    });



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left:25.0),
        child: Text(
          cafeType,
          style:TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:isSelected ? Colors.orange : Colors.white,
    
            ),
          ),
      ),
    );
  }
}