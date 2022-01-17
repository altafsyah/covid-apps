import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: unused_import
import 'data.dart';

// ignore: must_be_immutable
class CovidCard extends StatelessWidget {

  final String? data;
  int? index;

  CovidCard({
    required this.data,
    this.index
  });

  String? positif;
  String? sembuh;
  String? dead;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text((() {
          if(index == 0){return "Positif";}
          else if(index == 1){return "Dirawat";}
          else if(index == 2){return "Sembuh";}
          else{return "Meninggal";}
          })(),
          style: GoogleFonts.poppins().copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        SizedBox(height: 2,),
        Text(
          data!,
          style: GoogleFonts.poppins().copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white)
        ),
        SizedBox(height: 2,),
        Text(
          'Orang',
          style: GoogleFonts.poppins().copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white)
        )
      ],
    );
  }
}