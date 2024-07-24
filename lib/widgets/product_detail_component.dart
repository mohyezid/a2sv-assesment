import 'package:flutter/material.dart';
import 'package:flutter_assessment/models/product/product.dart';
import 'package:flutter_assessment/utils/constants.dart';

class ProductDetailsComponent extends StatefulWidget {
  const ProductDetailsComponent({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsComponent> createState() =>
      _ProductDetailsComponentState();
}

class _ProductDetailsComponentState extends State<ProductDetailsComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                    widget.product.title ?? "N/A",
                    style: const TextStyle(
                        color: blueColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Text(
                "${widget.product.price} ETB",
                style: const TextStyle(
                    color: Colors.black,
                    height: 1.5,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            children: [
              const Text(
                "Category: ",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(widget.product.category ?? "Not Specified")
            ],
          ),

          const SizedBox(height: 12),
          _builtRating(),

          const SizedBox(height: 10),
          const Wrap(
            children: [
              Text(
                "Availability:  ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
              ),
              Text(
                "In good shape",
                style: TextStyle(
                    color: Color(0xff27AE61), fontWeight: FontWeight.w600),
              )
            ],
          ),
          const SizedBox(height: 10.0),
          Text(
            widget.product.description ?? 'N/A',
            textAlign: TextAlign.justify,
            style: const TextStyle(color: iconGreyColor),
          ),

          // const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _builtRating() {
    return Row(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Rating:   ",
              style: TextStyle(fontSize: 14, height: 1.25),
            ),
            const Icon(
              Icons.star,
              size: 14,
              color: Color(0xffF6D060),
            ),
            const SizedBox(width: 4),
            Text(
              widget.product.rating?.rate.toString() ?? "0.0",
              style: const TextStyle(fontSize: 14, height: 1.25),
            ),
          ],
        ),
      ],
    );
  }
}
