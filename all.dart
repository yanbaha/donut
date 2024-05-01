// main.dart
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.pink),
    );
  }
}
// util folder
// donut_tile.dart
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

// pages folder
// home_page.dart
import 'package:donuts/util/my_tab/my_tab.dart';
import 'package:flutter/material.dart';

import '../tab/burger_tab.dart';
import '../tab/donut_tab.dart';
import '../tab/pancake_tab.dart';
import '../tab/pizza_tab.dart';
import '../tab/smoothie_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // my tabs
  List<Widget> myTabs = [
    // donut
    const MyTab(iconPath: 'lib/icons/donut.png'),
    // burger
    const MyTab(iconPath: 'lib/icons/burger.png'),
    // smoothie
    const MyTab(iconPath: 'lib/icons/pancakes.png'),
    // pancake
    const MyTab(iconPath: 'lib/icons/pizza.png'),
    // pizza
    const MyTab(iconPath: 'lib/icons/smoothie.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.grey[800],
                size: 36,
              ),
              onPressed: () {
                // open drawer
              },
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.grey[800],
                  size: 36,
                ),
                onPressed: () {
                  // My Account
                },
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
              child: Row(children: const [
                // I want to eat
                Text(
                  'I want to ',
                  style: TextStyle(fontSize: 24),
                ),
                // bold
                Text(
                  'EAT',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ]),
            ),
            const SizedBox(height: 20),
            // tab bar
            TabBar(tabs: myTabs),
            //tab bar view
            Expanded(
              child: TabBarView(
                children: [
                  //donut
                  DonutTab(),
                  // burger
                  BurgerTab(),
                  //smoothie
                  SmoothieTab(),

                  // pancake
                  PancakeTab(),

                  // pizza
                  PizzaTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// tab folder
// burger_tab.dart
import 'package:flutter/material.dart';

class BurgerTab extends StatelessWidget {
  const BurgerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Burger tub'),
      ),
    );
  }
}
// donut_tab.dart
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
//pancake_tab.dart
import 'package:flutter/material.dart';

class PancakeTab extends StatelessWidget {
  const PancakeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Pancake tub'),
        ),
    );
  }
}
//pizza_tab.dart
import 'package:flutter/material.dart';

class PizzaTab extends StatelessWidget {
  const PizzaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Pizza tub'),
        ),
    );
  }
}
//smoothie_tab.dart
import 'package:flutter/material.dart';

class SmoothieTab extends StatelessWidget {
  const SmoothieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Smoothie tub'),
      ),
    );
  }
}

