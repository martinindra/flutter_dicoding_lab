import 'package:flutter/material.dart';
import 'package:dicoding_codelab_1/model/tourism_place.dart';
import 'package:dicoding_codelab_1/favourite_button.dart';

class DetailMobilePage extends StatefulWidget {
  final TourismPlace places;

  DetailMobilePage({required this.places});

  @override
  _DetailMobilePageState createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  var informationTextStyle = TextStyle(fontFamily: 'Oswald');

  var titleTextStyle = TextStyle(fontFamily: 'Staatliches', fontSize: 30.0);

  var wordingTextStyle = TextStyle(fontFamily: 'Oxygen', fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(widget.places.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back, color: Colors.black),
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: FavouriteButton(),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0),
              child: Text(widget.places.name,
                  textAlign: TextAlign.center, style: titleTextStyle),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                        widget.places.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0),
                      Text(
                        widget.places.openTime,
                        style: informationTextStyle,
                      )
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        widget.places.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Text(
                widget.places.description,
                textAlign: TextAlign.center,
                style: wordingTextStyle,
              ),
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.places.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
