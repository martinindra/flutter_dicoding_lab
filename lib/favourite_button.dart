import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool isFavourite = false;
  Icon favourite = Icon(
    Icons.favorite,
    color: Colors.black,
  );
  Icon favourited = Icon(
    Icons.favorite_border,
    color: Colors.black,
  );
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFavourite = !isFavourite;
        });
      },
      icon: isFavourite ? favourite : favourited,
    );
  }
}
