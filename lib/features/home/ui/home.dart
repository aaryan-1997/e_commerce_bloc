import 'dart:developer';

import 'package:e_commerce_bloc/features/cart/ui/cart.dart';
import 'package:e_commerce_bloc/features/wishlist/ui/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    log("message");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Wishlist()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            actions: [
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeWishlistButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.favorite)),
              IconButton(
                  onPressed: () {
                    homeBloc.add(HomeCartButtonNavigateEvent());
                  },
                  icon: const Icon(Icons.shopping_cart)),
            ],
          ),
          body: const Center(
            child: Text('Scaffold Body'),
          ),
        );
      },
    );
  }
}
