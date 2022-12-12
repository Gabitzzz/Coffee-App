import 'package:coffe/pages/util/cofee_tile.dart';
import 'package:coffe/pages/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of coffee types
  final List coffeeType = [
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

  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
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
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Icon(Icons.person),
            ),
          ],
        ),
        body: Column(children: [
          // BEST COFFEE
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Find the best coffe for you",
              style: GoogleFonts.bebasNeue(
                fontSize: 60,
              ),
            ),
          ),
          SizedBox(height: 25),

          //  SEARCH BAR
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffe',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),

          SizedBox(height: 25),

          // HORIZONTAL TYPES OF COFFEE
          Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                      coffeeType: coffeeType[index][0],
                      isSelected: coffeeType[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      },
                    );
                  })),

          // HORIZONTAL SCROLL
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeeTile(
                coffeeImagePath: 'lib/images/latte.jpg',
                coffeeName: 'Latte',
                coffeePrice: '4.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'lib/images/latte.jpg',
                coffeeName: 'Cappucino',
                coffeePrice: '6.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'lib/images/latte.jpg',
                coffeeName: 'Black',
                coffeePrice: '3.00',
              ),
              CoffeeTile(
                coffeeImagePath: 'lib/images/latte.jpg',
                coffeeName: 'Tea',
                coffeePrice: '2.00',
              ),
            ],
          )),
        ]),
        bottomNavigationBar:
            BottomNavigationBar(items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Coffee',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ]));
  }
}
