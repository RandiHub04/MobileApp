import 'package:cafe_app_ui/Util/Cafe_tile.dart';
import 'package:cafe_app_ui/Util/cafe_type.dart';
import 'package:cafe_app_ui/Util/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //list of cafe types
  final List cafeType =[
    // [cafe type, isSelected]
    [
      'Cappucino',
      true,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];

  //user tapped on cafe types
  void cafeTypeSelected(int index){
    setState(() {

      //this for loop makes every selection false
      for(int i=0; i<cafeType.length; i++){
        cafeType[i][1] =false;

      }
      cafeType[index][1] =true;
    });

  }

   void navigateToProductScreen(String cafeName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductScreen(cafeName: cafeName),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: [
          Padding(padding: const EdgeInsets.only(right: 20.0),
           child: Icon(Icons.person)
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
            ),
          ],
        ),
      body: Column(children: [
        // find the best menu for you
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            "Find the best menu for you",
            style: GoogleFonts.bebasNeue(
              fontSize: 40,
            )
            ),
        ),
        
        SizedBox(height: 25),

        //Search bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:25.0),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Find your menu..',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              ),
                enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade600),
              )
            ),
          ),
        ),

        SizedBox(height: 25),

        //horizontal listview of menu types
        Container(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cafeType.length,
            itemBuilder: (context, index) {
            return CafeType(
            cafeType: cafeType[index][0],
            isSelected: cafeType[index][1],
            onTap: () {
              cafeTypeSelected(index);
            }
            );
          },
        ),
        ),
    

        //Horizontal Listview of menu titles
        Expanded(
          child:ListView(
            scrollDirection: Axis.horizontal,
          children: [
            CafeTile(
              cafeImagePath: 'lib/images/Coffe.jpg',
              cafeName: 'coffe',
              cafePrice: '4.20',
              onTap: () {
                navigateToProductScreen('coffe');
              },
            ),
             CafeTile(
              cafeImagePath: 'lib/images/Beer.jpg',
              cafeName: 'beer',
              cafePrice: '4.60',
              onTap:() {
                navigateToProductScreen('beer');
              },
            ),
             CafeTile(
              cafeImagePath: 'lib/images/Juice.jpg',
              cafeName: 'juice',
              cafePrice: '4.10',
              onTap:() {
                navigateToProductScreen('juice');
              }
            ),
          ],
          ),
          )
      ],)
    );
  }
}