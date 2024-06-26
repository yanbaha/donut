import 'package:flutter/material.dart';

class DonutTile extends StatelessWidget {
  final String donutFlavor;
  final String donutPrice;
  final donutColor;
  final String imageName;
  final double borderRadius = 12;

  const DonutTile(
      {super.key,
      required this.donutFlavor,
      required this.donutPrice,
      required this.donutColor,
      required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: donutColor[50],
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: donutColor[100],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    '\$' + donutPrice,
                    style: TextStyle(
                        color: donutColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
            // donut picture
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 24),
              child: Image.asset(imageName),
            ),
            // donut flavor
            Text(
              donutFlavor,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'GodHelp',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 12,
            ),
            // love icon + button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // love
                Icon(
                  Icons.favorite,
                  color: Colors.pink[400],
                ),

                //plus
                Icon(
                  Icons.add,
                  color: Colors.grey[800],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
