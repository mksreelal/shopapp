import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/screens/cart_screen.dart';
import 'package:shopapp/screens/perfumedetail_screen.dart';

import '../components/perfumetile.dart';
import '../models/perfume.dart';
import '../models/shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Perfume> filteredPerfumes = [];

  void navigateToPerfumeDetails(int index) {
    final shop = context.read<Shop>();
    final perfumemenu = shop.perfumemenu;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PerfumeDetailsScreen(perfume: perfumemenu[index])));
  }

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_searchPerfumes);
  }

  void _searchPerfumes() {
    final shop = context.read<Shop>();
    final perfumemenu = shop.perfumemenu;
    final query = _searchController.text.toLowerCase();

    setState(() {
      filteredPerfumes = perfumemenu
          .where((perfume) => perfume.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final perfumemenu = shop.perfumemenu;
    final perfumesToDisplay =
        filteredPerfumes.isNotEmpty ? filteredPerfumes : perfumemenu;

    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.pink[50],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'H O M E',
                    style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart_outlined),
                title: Text(
                  "My Cart",
                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: Colors.pink[50],
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: perfumesToDisplay.length,
              itemBuilder: (context, index) {
                final perfume = perfumesToDisplay[index];
                return Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: PerfumeTile(
                    perfume: perfume,
                    ontap: () => navigateToPerfumeDetails(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
