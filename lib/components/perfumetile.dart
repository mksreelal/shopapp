import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/perfume.dart';
class PerfumeTile extends StatelessWidget {
  final Perfume perfume;
  final void Function()? ontap;
  const PerfumeTile({super.key, required this.perfume, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:ontap ,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),child: Column(
        children: [
          SizedBox(height: 5,),
          Image.asset(perfume.imagepath,height: 130,),
          Text(perfume.name,style: GoogleFonts.dmSerifDisplay(fontSize: 20,)),
          Text('\$'+perfume.price.toString(),style: GoogleFonts.dmSerifDisplay(fontSize: 20),)
        ],
      ),
      ),
    );
  }
}
