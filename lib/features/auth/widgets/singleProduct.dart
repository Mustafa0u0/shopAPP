import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  const SingleProduct({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Container(
          height: 140,
          width: 130,
          padding: const EdgeInsets.all(10),
          child: Image.network(
            image,
            fit: BoxFit.contain,
            width: 150,
          ),
        ),
      ),
    );
  }
}
