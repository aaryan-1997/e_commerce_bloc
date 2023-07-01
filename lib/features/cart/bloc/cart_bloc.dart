import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/data/cart.dart';
import 'package:e_commerce_bloc/features/home/models/product.dart';
import 'package:flutter/material.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartProduct: cartProducts));
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartProducts.remove(event.product);
    emit(CartProductRemoveState());
    emit(CartSuccessState(cartProduct: cartProducts));
  }
}
