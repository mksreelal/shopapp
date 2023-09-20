import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/models/perfume.dart';
import 'package:shopapp/models/shop.dart';

class PerfumeDetailsScreen extends StatefulWidget {
  final Perfume perfume;
  const PerfumeDetailsScreen({super.key, required this.perfume});

  @override
  State<PerfumeDetailsScreen> createState() => _PerfumeDetailsScreenState();
}

class _PerfumeDetailsScreenState extends State<PerfumeDetailsScreen> {
  int quantityCount = 0;
  //decrement
  void decrementQuantity() {
    setState(() {
      if (quantityCount > 0) {
        quantityCount--;
      }
    });
  }

  //increment
  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    final shop = context.read<Shop>();

    shop.addToCart(
      widget.perfume,
    );

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.pink[100],
              content: Text(
                "Successfully added to cart",
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);

                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Image.asset(
                  widget.perfume.imagepath,
                  height: 250,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              widget.perfume.name,
                              softWrap: true,
                              style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Text(
                                  "(50ml)",
                                  style: GoogleFonts.dmSerifDisplay(
                                    fontSize: 18,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Description",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 25),
                        ),
                        Text(
                          "a substance, extract,or preparation for diffusing or imparting an agreeable or attractive smell,"
                          " especially a fluid containing fragrant natural oils extracted from flowers, woods, etc., or similar synthetic oils."
                          " the scent, odor, or volatile particles emitted by substances that smell agreeable.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 16, color: Colors.black, height: 2),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            color: Colors.pink[100],
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$' + widget.perfume.price.toString(),
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 30, color: Colors.white),
                      ),
                      // Row(children: [
                      //   Container(decoration: BoxDecoration(
                      //       color: Colors.pink[50],
                      //     shape: BoxShape.circle
                      //   ),
                      //   child: IconButton(icon: Icon(Icons.remove),
                      //   color: Colors.white,
                      //   onPressed: decrementQuantity,),
                      // ),
                      //   SizedBox(
                      //       width: 20,
                      //       child: Center(child: Text(quantityCount.toString(),
                      //         style: GoogleFonts.dmSerifDisplay(fontSize: 20,color: Colors.white),))),
                      //   Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors.pink[50],
                      //         shape: BoxShape.circle
                      //     ),
                      //     child: IconButton(icon: Icon(Icons.add),
                      //       color: Colors.white,
                      //       onPressed: incrementQuantity,),
                      //   )
                      // ],)
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: addToCart,
                    child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pink[50],
                      ),
                      child: Center(
                          child: Text(
                        "Add to Cart",
                        style: GoogleFonts.dmSerifDisplay(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
