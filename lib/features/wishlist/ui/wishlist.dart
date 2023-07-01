import 'package:e_commerce_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:e_commerce_bloc/features/wishlist/ui/wishlist_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();
  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {
          if (state is WishlistProductRemoveState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Item removed from wishlist")));
          }
        },
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              WishlistSuccessState successState = state as WishlistSuccessState;
              return ListView.builder(
                itemCount: successState.wishlistProducts.length,
                itemBuilder: (context, index) {
                  return WishlistTileWidget(
                      product: successState.wishlistProducts[index],
                      wishlistBloc: wishlistBloc);
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
