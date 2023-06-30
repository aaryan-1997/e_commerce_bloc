import 'package:e_commerce_bloc/features/cart/ui/cart.dart';
import 'package:e_commerce_bloc/features/home/ui/product_tile_widget.dart';
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
    homeBloc.add(HomeInitialEvent());
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
        } else if (state is HomeProductAddToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Product added to cart."),
            duration: Duration(seconds: 2),
          ));
        } else if (state is HomeProductAddToWishlistActionState) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Product added to wishlist."),
            duration: Duration(seconds: 2),
          ));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadedSuccessState:
            final succeseState = state as HomeLoadedSuccessState;
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
              body: ListView.builder(
                itemCount: succeseState.products.length,
                itemBuilder: (context, index) => ProductTileWidget(
                  product: succeseState.products[index],
                  homeBloc: homeBloc,
                ),
              ),
            );
          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("Some error occured."),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
