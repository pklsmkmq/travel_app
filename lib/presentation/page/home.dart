// ignore_for_file: unused_import, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traver_v2/core/usecase/home.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

import '../../core/models/model.dart';
import '../widget/home/judul.dart';
import '../widget/home/kategori.dart';
import '../widget/home/popular.dart';
import '../widget/home/wisata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int menu = 0;
  List lsMenu = [HomeScreen(), null, null, null];
  Login? dataUser;
  List<Categories> data = [];

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final loginData = prefs.getString('login');
    print(loginData.runtimeType);

    if (loginData != null) {
      setState(() {
        dataUser = loginFromJson(loginData.toString());
        print(dataUser);
      });
    } else {
      print("No login data found");
    }

    HomeController().getCategory().then(
      (value) {
        setState(() {
          if (value != null) {
            data = value;
          }
        });
      },
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                //Start hello
                Container(
                  margin: EdgeInsets.only(bottom: tinggi * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 252, 211, 64),
                              child: Icon(Icons.person),
                            ),
                          ),
                          Text("Hello, ${dataUser?.user.name}",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)))
                        ],
                      ),
                      Icon(Icons.notifications)
                    ],
                  ),
                ),
                //end hello

                //start explore
                Container(
                  margin: EdgeInsets.only(bottom: tinggi * 0.03),
                  child: Text("Where do you want to explore today?",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 37, fontWeight: FontWeight.w700))),
                ),
                //end explore

                //start search
                Container(
                  margin: EdgeInsets.only(bottom: tinggi * 0.03),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search destination",
                        suffixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        hintStyle: GoogleFonts.poppins(fontSize: 20)),
                  ),
                ),
//end search
                //start category
                Judul("Choose Category", "See All", tinggi),
                Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                          spacing: 20,
                          children: List.generate(data.length, (index) {
                            return Category(
                                data[index].name, data[index].image, lebar);
                          })
                          // [
                          //   Category("Beach", "assets/img/beach.png", lebar),
                          //   Category("Mountain", "assets/img/mountains.png", lebar),
                          //   Category("Religion", "assets/img/mosque.png", lebar),
                          // ]
                          ),
                    )),
                //end category
                //start favorit
                Judul("Favorite Place", "Explore", tinggi),
                Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(spacing: 20, children: [
                          Wisata(
                              "assets/img/page1.jpg",
                              "Tempat Wisata",
                              "Jonggol, Indonesia",
                              "4.8",
                              tinggi,
                              lebar,
                              context,
                              false),
                          Wisata(
                              "assets/img/page2.jpg",
                              "Tempat Wisata",
                              "Jonggol, Indonesia",
                              "4.8",
                              tinggi,
                              lebar,
                              context,
                              false),
                          Wisata(
                              "assets/img/page3.jpg",
                              "Tempat Wisata",
                              "Jonggol, Indonesia",
                              "4.8",
                              tinggi,
                              lebar,
                              context,
                              false),
                        ]))),
//end favorit
//start popular
                Judul("Popular Package", "See All", tinggi),
                Container(
                  margin: EdgeInsets.only(bottom: tinggi * 0.03),
                  child: Wrap(
                    runSpacing: 30,
                    children: [
                      Popular(
                          "assets/img/page1.jpg",
                          "Tempat Wisata",
                          "500000",
                          4.8,
                          "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
                          lebar,
                          tinggi),
                      Popular(
                          "assets/img/page2.jpg",
                          "Tempat Wisata",
                          "300000",
                          4.8,
                          "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
                          lebar,
                          tinggi),
                      Popular(
                          "assets/img/page3.jpg",
                          "Tempat Wisata",
                          "800000",
                          4.8,
                          "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
                          lebar,
                          tinggi),
                    ],
                  ),
                )
//end popular
              ]))),
    );
  }
}
