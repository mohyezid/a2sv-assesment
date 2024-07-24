import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_assessment/models/cart.dart';
import 'package:flutter_assessment/screens/cart_screen.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  final double height;

  const HomeAppBar({super.key, this.height = 160});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        // color: const Color(0xffF6F6F6),
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                _wishlistButton(context),
                const SizedBox(width: 20),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return CartBadge(
                        count: cart.itemCount.toString(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _wishlistButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // padding: const EdgeInsets.symmetric(vertical: 10),
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              // color: const Color(0xffE8EEF2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/homeWishlistIcon.svg",
                height: 30,
                width: 30,
              ),
            ),
          ),
          // const SizedBox(height: 4),
          // Text(
          //   Language.wishlist.capitalizeByWord(),
          //   style: const TextStyle(fontSize: 13),
          // )
        ],
      ),
    );
  }
}

class CartBadge extends StatelessWidget {
  const CartBadge({
    super.key,
    required this.count,
  });
  final String? count;

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      badgeStyle: const badges.BadgeStyle(
        badgeColor: Colors.amber,
      ),
      badgeContent: Text(
        count!,
        style: const TextStyle(fontSize: 10, color: Colors.black),
      ),
      child: SvgPicture.asset("assets/icons/shopping-badge.svg"),
    );
  }
}
