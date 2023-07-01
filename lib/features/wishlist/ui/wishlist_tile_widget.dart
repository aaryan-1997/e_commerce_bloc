import 'package:e_commerce_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';

import '../../home/models/product.dart';

class WishlistTileWidget extends StatelessWidget {
  final Product product;
  final WishlistBloc wishlistBloc;
  const WishlistTileWidget({
    super.key,
    required this.product,
    required this.wishlistBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: double.maxFinite,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            "${product.name}",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${product.description}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${product.price}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        wishlistBloc
                            .add(WishlistProductRemoveEvent(product: product));
                      },
                      icon: const Icon(Icons.favorite_outline_outlined)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.shopping_bag)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
