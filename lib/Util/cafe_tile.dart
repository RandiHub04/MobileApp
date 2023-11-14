import 'package:flutter/material.dart';

class CafeTile extends StatelessWidget {
  
  final String cafeImagePath;
  final String cafeName;
  final String cafePrice;
  final Function()? onTap;

  CafeTile({
    required this.cafeImagePath, 
    required this.cafeName, 
    required this.cafePrice,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Padding(
      padding : EdgeInsets.only(left:25.0, bottom: 90),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 210,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54,
        ),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            

            //Coffe image
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(cafeImagePath),
                ),
            ),

            //coffe name
            Padding(
              padding: const EdgeInsets.symmetric(vertical:12.0,horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                // ignore: prefer_const_constructors
                Text(
                  cafeName,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  'With Latte',
                  style: TextStyle(color: Colors.grey[700]),
                
                )
                ],
              ),
            ),

            //price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$'+ cafePrice),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6)
                      ),
                    child: Icon(Icons.add),),
                ],
              ),
            )
          ],
          
        ),
      ),
    )
    );
  }
}