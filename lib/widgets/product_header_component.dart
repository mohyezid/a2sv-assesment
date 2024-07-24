import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/models/product/product.dart';

class ProductHeaderComponent extends StatefulWidget {
  const ProductHeaderComponent({super.key, required this.product});

  final Product product;

  @override
  State<ProductHeaderComponent> createState() => _ProductHeaderComponentState();
}

class _ProductHeaderComponentState extends State<ProductHeaderComponent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SizedBox(height: 300, child: _buildThumbImage()),
      ],
    );
  }

  Widget _buildThumbImage() {
    return Positioned(
      top: 30,
      left: 20,
      right: 35,
      bottom: 60,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Flexible(
          child: CachedNetworkImage(
            imageUrl: widget.product.image!,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.orange[900],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Getting item image",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
