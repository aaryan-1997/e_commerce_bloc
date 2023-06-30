import 'package:e_commerce_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/ui/product_tile_widget.dart';
import 'cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          // TODO: implement listener
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              CartSuccessState succeseState =state as CartSuccessState;
               return Scaffold(
              
              body: ListView.builder(
                itemCount: succeseState.cartProduct.length,
                itemBuilder: (context, index) => CartTileWidget(
                  product: succeseState.cartProduct[index],
                  //homeBloc: homeBloc,
                ),
              ),
            );
          }
          return Center(
            child: Text('Scaffold Body'),
          );
        },
      ),
    );
  }
}
