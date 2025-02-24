// ignore_for_file: sort_child_properties_last, use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/home/judul.dart';
import '../widget/home/kategori.dart';
import '../widget/home/popular.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('Search'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list_alt),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => FilterOptions(),
                );
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
                  Judul("We Found 4 Trip in Bali", "", tinggi),
                  Container(
                      margin: EdgeInsets.only(bottom: tinggi * 0.03),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(spacing: 20, children: [
                          Category("Beach", "assets/img/beach.png", lebar),
                          Category(
                              "Mountain", "assets/img/mountains.png", lebar),
                          Category("Religion", "assets/img/mosque.png", lebar),
                        ]),
                      )),
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
                ]))));
  }
}

class FilterOptions extends StatefulWidget {
  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  RangeValues _currentRangeValues = RangeValues(1000, 5000);
  bool _includeFlight = false;
  bool _includeHotel = false;
  bool _includeTransportation = false;
  bool _includeEat = false;
  int _selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Filter Options',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Price Range'),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 5000000,
              divisions: 100,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Star Review'),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _selectedStar ? Icons.star : Icons.star_border,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStar = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Include'),
            CheckboxListTile(
              title: Text('Flight'),
              value: _includeFlight,
              onChanged: (value) {
                setState(() {
                  _includeFlight = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Hotel'),
              value: _includeHotel,
              onChanged: (value) {
                setState(() {
                  _includeHotel = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Transportation'),
              value: _includeTransportation,
              onChanged: (value) {
                setState(() {
                  _includeTransportation = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Eat'),
              value: _includeEat,
              onChanged: (value) {
                setState(() {
                  _includeEat = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: ElevatedButton(
                    onPressed: () {
                      // Clear all filters
                      setState(() {
                        _currentRangeValues = RangeValues(1000, 5000);
                        _includeFlight = false;
                        _includeHotel = false;
                        _includeTransportation = false;
                        _includeEat = false;
                        _selectedStar = 0;
                      });
                    },
                    child: Text('Clear All'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: ElevatedButton(
                    onPressed: () {
                      // Apply filters
                      Navigator.pop(context);
                    },
                    child: Text('Apply'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
