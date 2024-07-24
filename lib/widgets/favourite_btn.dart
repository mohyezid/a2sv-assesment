import 'package:flutter/material.dart';

class FavouriteBtn extends StatefulWidget {
  const FavouriteBtn({super.key});

  @override
  State<FavouriteBtn> createState() => _FavouriteBtnState();
}

bool _isfav = false;

class _FavouriteBtnState extends State<FavouriteBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isfav = !_isfav;
        });
      },
      child: favorite(_isfav),
    );
  }
}

Widget favorite(bool isFav) {
  return Container(
    height: 40.0,
    width: 40.0,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(4.0),
    ),
    child: Icon(isFav ? Icons.favorite : Icons.favorite_outline_sharp,
        color: Colors.black, size: 28.0),
  );
}
