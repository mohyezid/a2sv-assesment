import 'package:flutter/material.dart';
import 'package:flutter_assessment/models/cart.dart';

import 'package:flutter_assessment/widgets/home_app_bar.dart';
import 'package:flutter_assessment/widgets/primary_button.dart';
import 'package:flutter_assessment/widgets/product_detail_component.dart';
import 'package:flutter_assessment/widgets/product_header_component.dart';
import 'package:provider/provider.dart';
import '../models/product/product.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final isAlreadyInCart = cart.items.containsKey(product.id.toString());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: Container(
          padding: const EdgeInsets.only(right: 20),
          width: 220,
          child: Text(
            product.title ?? 'N/A',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        flexibleSpace: const HomeAppBar(height: 80),
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 30,
        leading: Container(
          padding: const EdgeInsets.only(
            left: 10.0,
          ),
          child: IconButton(
            iconSize: 20,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                  child: ProductHeaderComponent(
                product: product,
              )),
              // const SliverToBoxAdapter(
              //   child: SizedBox(height: 0.0),
              // ),
              SliverToBoxAdapter(
                child: ProductDetailsComponent(
                  product: product,
                ),
              ),

              if (isAlreadyInCart)
                const SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Text(
                    "This poduct is Added in the cart",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: Colors.red),
                  ),
                )),

              const SliverToBoxAdapter(child: SizedBox(height: 6)),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: PrimaryButton(
              text: "Add to cart",
              borderRadiusSize: 10,
              icon: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.shopify_sharp),
              ),
              reverse: true,
              maximumSize: const Size(double.infinity, 60),
              minimumSize: const Size(double.infinity, 55),
              onPressed: () {
                Provider.of<Cart>(context, listen: false)
                    .addItem(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
