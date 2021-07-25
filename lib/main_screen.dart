import 'package:dicoding_codelab_1/model/tourism_place.dart';
import 'package:flutter/material.dart';
import 'tourismplacescreen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Wisata Bandung. Size: ${MediaQuery.of(context).size.width}'),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return TourismPlaceList();
          } else {
            return TourismPlaceGrid();
          }
        },
      ),
    );
  }
}
