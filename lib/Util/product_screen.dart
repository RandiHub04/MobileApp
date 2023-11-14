import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final String cafeName;

  ProductScreen({required this.cafeName});

  @override
  Widget build(BuildContext context) {
    String imagePath = "lib/images/$cafeName.jpg";

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.9),
                  BlendMode.dstATop,
                ),
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Text(cafeName),
            ),
          ),
          // Content of your screen below the app bar
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  getMenuDescription(cafeName),
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getMenuDescription(String cafeName) {
    switch (cafeName) {
      case 'beer':
        return 'Refreshing beer to quench your thirst.';
      case 'coffe':
        return 'A coffee of the best quality.';
      case 'juice':
        return 'Freshly squeezed juice for a burst of flavor.';
      default:
        return '';
    }
  }
}
