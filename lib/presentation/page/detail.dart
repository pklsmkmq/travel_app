// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:traver_v2/presentation/widget/home/gallery.dart';
import 'package:traver_v2/presentation/widget/home/judul.dart';

import '../widget/home/kategori.dart';
import '../widget/home/review.dart';
import '../widget/home/wisata.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Detail Wisata'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                // Add filter action here
              },
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Wisata("assets/img/page1.jpg", "Tempat Wisata",
                    "Jonggol, Indonesia", "4.8", tinggi, lebar, context, true),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Judul("What's Included?", "", tinggi)),
                Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(spacing: 20, children: [
                        Category("Flight", "assets/img/plane.png", lebar),
                        Category("Hotel", "assets/img/resort.png", lebar),
                        Category("Transportation", "assets/img/car.png", lebar),
                        Category("Eat", "assets/img/eat.png", lebar),
                      ]),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Judul("About Trip", "", tinggi)),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
                    "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
                    "nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
                    "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
                    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia "
                    "deserunt mollit anim id est laborum.",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Judul("Gallery Photo", "", tinggi),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BuildGalleryPhoto("assets/img/page1.jpg"),
                        BuildGalleryPhoto("assets/img/page2.jpg"),
                        BuildGalleryPhoto("assets/img/page3.jpg"),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Judul("Review (99)", "", tinggi, angka: 4.8),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Column(
                    children: [
                      ReviewTile(
                        name: "Alice Brown",
                        rating: 5.0,
                        review: "Amazing place! Had a great time.",
                        time: "2 hours ago",
                      ),
                      ReviewTile(
                        name: "Charlie Davis",
                        rating: 4.5,
                        review: "Beautiful scenery and friendly staff.",
                        time: "1 day ago",
                      ),
                      // Add more ReviewTile widgets as needed
                    ],
                  ),
                ),
              ])),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$750.00 / Person',
                  style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ),
                Container(
                  width: lebar * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // Add booking action here
                    },
                    child: Text(
                      'Booking',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
