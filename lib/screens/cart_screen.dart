import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopapp/screens/payment_screen.dart';
import '../models/perfume.dart';
import '../models/shop.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  void removeFromtCart(Perfume perfume, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeFromCart(perfume);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'My Cart',
          style: GoogleFonts.dmSerifDisplay(fontSize: 25, color: Colors.white),
        ),
        centerTitle: true,
        // backgroundColor: Colors.blue.shade900,
        // title: Text('Total Cart Items : '
        //     '${context
        //     .watch<Shop>()
        //     .cartCount}'
        // ),
        // centerTitle: true,
      ),
      body: context.watch<Shop>().cartCount == 0
          ? Center(
              child: Text(
                "No Items in cart",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 40, color: Colors.pink[100]),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: //replace with cart item count
                          context.watch<Shop>().cartItemCount,
                      itemBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink[100],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                      context
                                          .read<Shop>()
                                          .cart[index]
                                          .imagepath,
                                    ))),
                                  ),
                                ),
                                //cart list item name
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.read<Shop>().cart[index].name,
                                      style: GoogleFonts.dmSerifDisplay(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '\$',
                                          style: GoogleFonts.dmSerifDisplay(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          context
                                              .read<Shop>()
                                              .cart[index]
                                              .price
                                              .toString(),
                                          style: GoogleFonts.dmSerifDisplay(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                                Spacer(),
                                Container(
                                  width: 110,
                                  child: Row(
                                    children: [
                                      IconButton(
                                          color: Colors.pink[50],
                                          onPressed:
                                              context.watch<Shop>().cartCount ==
                                                      0
                                                  ? null
                                                  : () {
                                                      context
                                                          .read<Shop>()
                                                          .addToCart(context
                                                              .read<Shop>()
                                                              .cart[index]);
                                                      print(context
                                                          .read<Shop>()
                                                          .cart);
                                                    },
                                          icon: Icon(Icons.add_circle)),
                                      Text(
                                        '${context.watch<Shop>().cart[index].count}',
                                        style: GoogleFonts.dmSerifDisplay(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      IconButton(
                                          disabledColor:
                                              Colors.blueGrey.shade500,
                                          color: Colors.pink[50],
                                          onPressed: () {
                                            context.read<Shop>().removeFromCart(
                                                context
                                                    .read<Shop>()
                                                    .cart[index]);
                                            print(context.read<Shop>().cart);
                                          },
                                          icon: Icon(
                                            Icons.remove_circle,
                                          )),
                                    ],
                                  ),
                                ),
                                // IconButton(
                                //   onPressed: () {
                                //     removeFromtCart(context.read<Shop>().cart[index], context);
                                //   },
                                //   icon: Icon(Icons.delete, color: Colors.pink[50]),
                                // ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.pink[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<Shop>(
                          builder: (context, shop, child) {
                            return Text(
                              ' \$${shop.getTotalCartAmount().toStringAsFixed(2)}',
                              style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 25, color: Colors.white),
                            );
                          },
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Upi())),
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.pink[50],
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text(
                                "Pay Now",
                                style: GoogleFonts.dmSerifDisplay(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
