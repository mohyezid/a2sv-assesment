import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/utils/constants.dart';
import 'package:flutter_assessment/widgets/favourite_btn.dart';
import '../models/product/product.dart';
import '../screens/product_detail.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductDetailScreen(product: product),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildImage(context), _buildContent()],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 6, top: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.star,
                size: 14,
                color: Color(0xffF6D060),
              ),
              const SizedBox(width: 4),
              Text(
                product.rating?.rate.toString() ?? "0.0",
                style: const TextStyle(fontSize: 14, height: 1.25),
              ),
            ],
          ),
          const SizedBox(height: 6),
          AutoSizeText(product.category ?? "N/A",
              textAlign: TextAlign.center,
              maxLines: 2,
              maxFontSize: 16,
              minFontSize: 12,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, height: 1.2, fontSize: 16)),
          const SizedBox(
            height: 10,
          ),
          // const SizedBox(height: 6),
        ],
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return SizedBox(
      height: 118,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
            child: CachedNetworkImage(
              imageUrl: product.image!,
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
          Positioned(
            top: 12,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Color(0xffFFF5E1)),
              child: const FavouriteBtn(),
            ),
          ),
        ],
      ),
    );
  }
}
