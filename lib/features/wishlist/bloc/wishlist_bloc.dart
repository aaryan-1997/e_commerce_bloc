import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/data/wishlist.dart';
import 'package:flutter/material.dart';

import '../../home/models/product.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistProductRemoveEvent>(wishlistProductRemoveEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistProducts: wishlistProducts));
  }

  FutureOr<void> wishlistProductRemoveEvent(
      WishlistProductRemoveEvent event, Emitter<WishlistState> emit) {
    wishlistProducts.remove(event.product);
    emit(WishlistSuccessState(wishlistProducts: wishlistProducts));
    emit(WishlistProductRemoveState());
  }
}
