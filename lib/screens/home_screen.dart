import 'package:flutter/material.dart';
import 'package:flutter_assessment/widgets/home_app_bar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/product/product.dart';
import '../widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    final List<dynamic> productData = json.decode(response.body);
    setState(() {
      _products = productData.map((json) => Product.fromMap(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Text("Products"),
        flexibleSpace: const HomeAppBar(height: 80),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: RefreshIndicator(
            onRefresh: () async {
              await _fetchProducts();
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: _products.length,
                itemBuilder: (ctx, i) => ProductItem(product: _products[i]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
