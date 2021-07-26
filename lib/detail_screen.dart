import 'package:dicoding_codelab_1/model/tourism_place.dart';
import 'package:flutter/material.dart';
import 'detail_place/detail_mobile.dart';
import 'detail_place/detail_web.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace places;

  DetailScreen({required this.places});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(places: places);
        } else {
          return DetailMobilePage(places: places);
        }
      },
    );
  }
}
