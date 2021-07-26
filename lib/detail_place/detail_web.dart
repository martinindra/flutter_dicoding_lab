import 'package:flutter/material.dart';
import 'package:dicoding_codelab_1/model/tourism_place.dart';
import 'package:dicoding_codelab_1/favourite_button.dart';

class DetailWebPage extends StatefulWidget {
  final TourismPlace places;

  DetailWebPage({required this.places});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  var informationTextStyle = TextStyle(fontFamily: 'Oswald', fontSize: 18.0);

  var titleTextStyle = TextStyle(fontFamily: 'Staatliches', fontSize: 30.0);

  var wordingTextStyle = TextStyle(fontFamily: 'Oxygen', fontSize: 16.0);

  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: Container(
            width: 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    Text(
                      'Wisata Bandung',
                      style: titleTextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            child: Image.asset(widget.places.imageAsset),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          SizedBox(height: 16.0),
                          Container(
                            height: 150,
                            padding: const EdgeInsets.only(bottom: 16),
                            child: Scrollbar(
                              isAlwaysShown: true,
                              controller: _scrollController,
                              child: ListView(
                                controller: _scrollController,
                                padding: const EdgeInsets.only(bottom: 16.0),
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
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  widget.places.name,
                                  style: titleTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.calendar_today),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.places.openDays,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  FavouriteButton(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.access_time),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.places.openTime,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.monetization_on),
                                      SizedBox(width: 8.0),
                                      Text(
                                        widget.places.ticketPrice,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.places.description,
                                  textAlign: TextAlign.justify,
                                  style: wordingTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );

    @override
    void dispos() {
      _scrollController.dispose();
      super.dispose();
    }
  }
}
