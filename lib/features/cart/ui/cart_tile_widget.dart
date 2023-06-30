import 'package:flutter/material.dart';

import '../../home/models/product.dart';

class CartTileWidget extends StatelessWidget {
  final Product product;
  //final HomeBloc homeBloc;
  const CartTileWidget(
      {super.key, required this.product,});

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
                        // homeBloc.add(HomeProductWishlistButtonClickEvent(
                        //     product: product));
                      },
                      icon: const Icon(Icons.favorite_outline_outlined)),
                  IconButton(
                      onPressed: () {
                        // homeBloc.add(
                        //     HomeProductCartButtonClickEvent(product: product));
                      },
                      icon: const Icon(Icons.shopping_cart_outlined)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
