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
