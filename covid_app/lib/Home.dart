import 'package:covid_app/CovidCard.dart';
import 'package:covid_app/provider/covid_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    var provider = CovidProvider();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/illustration.png', width: MediaQuery.of(context).size.width,),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'Data Covid-19',
                      style: GoogleFonts.poppins().copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffE7A4A4))
                    ),
                  ),
                  Text(
                    'INDONESIA',
                    style: GoogleFonts.poppins().copyWith(fontSize: 30, fontWeight: FontWeight.w600, color: Color(0xffE7A4A4))
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: FutureBuilder<List<Data>>(
                      future: provider.getData(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          List<Data>?  data = snapshot.data;
                          int index = -1;
                          return Column(
                            children: data!.map((item){
                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: (MediaQuery.of(context).size.width - 68)/2,
                                        padding: EdgeInsets.only(top: 42, bottom: 42, left: 14,),
                                        decoration: BoxDecoration(
                                          color: Color(0xffFF3A81),
                                          borderRadius: BorderRadius.circular(17),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(-0.5,0.5),
                                              color: Colors.black45,
                                              spreadRadius: 0.1
                                            )
                                          ]
                                        ),
                                        child: CovidCard(data: item.positif, index: 0, ),
                                        margin: EdgeInsets.only(top: 20),
                                      ),
                                      Container(
                                        width: (MediaQuery.of(context).size.width - 68)/2,
                                        padding: EdgeInsets.only(top: 42, bottom: 42, left: 14,),
                                        decoration: BoxDecoration(
                                          color: Color(0xffA290E7),
                                          borderRadius: BorderRadius.circular(17),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(-0.5,0.5),
                                              color: Colors.black45,
                                              spreadRadius: 0.1
                                            )
                                          ]
                                        ),
                                        child: CovidCard(data: item.rawat, index: 1, ),
                                        margin: EdgeInsets.only(top: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: (MediaQuery.of(context).size.width - 68)/2,
                                        padding: EdgeInsets.only(top: 42, bottom: 42, left: 14,),
                                        decoration: BoxDecoration(
                                          color: Color(0xffA290E7) ,
                                          borderRadius: BorderRadius.circular(17),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(-0.5,0.5),
                                              color: Colors.black45,
                                              spreadRadius: 0.1
                                            )
                                          ]
                                        ),
                                        child: CovidCard(data: item.sembuh, index: 2, ),
                                        margin: EdgeInsets.only(top: 20),
                                      ),
                                      Container(
                                        width: (MediaQuery.of(context).size.width - 68)/2,
                                        padding: EdgeInsets.only(top: 42, bottom: 42, left: 14),
                                        decoration: BoxDecoration(
                                          color: Color(0xffFF3A81),
                                          borderRadius: BorderRadius.circular(17),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              offset: Offset(-0.5,0.5),
                                              color: Colors.black45,
                                              spreadRadius: 0.1
                                            )
                                          ]
                                        ),
                                        child: CovidCard(data: item.dead, index: index, ),
                                        margin: EdgeInsets.only(top: 20),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }).toList(),
                          );
                        }else{
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 50,),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CovidText extends StatelessWidget {

  final Data data;

  CovidText(this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Positif : ${data.positif}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.deepPurple[900]
          ),
        ),
        Text(
          'Sembuh : ${data.sembuh}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.deepPurple[900]
          ),
        ),
        Text(
          'Meninggal : ${data.dead}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.deepPurple[900]
          ),
        )
      ],
    );
  }
}