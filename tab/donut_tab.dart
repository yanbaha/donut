import 'package:flutter/material.dart';

import '../util/donut_tile.dart';

class DonutTab extends StatelessWidget {
  List donutOnsale = [
//[donutFlavor, donutPrice, donutColor, imageName]
    ['Ice Cream', '36', Colors.blue, 'lib/images/icecream_donut.png'],
    ['Ice Cream', '36', Colors.red, 'lib/images/strawberry_donut.png'],
    ['Ice Cream', '36', Colors.purple, 'lib/images/grape_donut.png'],
    ['Ice Cream', '36', Colors.brown, 'lib/images/chocolate_donut.png'],
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: donutOnsale.length,
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
      ),
      itemBuilder: (context, index) {
        return DonutTile(
          donutFlavor: donutOnsale[index][0],
          donutPrice: donutOnsale[index][1],
          donutColor: donutOnsale[index][2],
          imageName: donutOnsale[index][3],
        );
      },
    );
  }
}
