import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_bloc/data/cart.dart';
import 'package:e_commerce_bloc/data/grocery_data.dart';
import 'package:e_commerce_bloc/data/wishlist.dart';
import 'package:e_commerce_bloc/features/home/models/product.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        log("product loaded");
        emit(HomeLoadedSuccessState(
            products: GroceryData.groceryProducts
                .map((e) => Product.fromMap(e))
                .toList()));
      });
    } catch (e) {
      log("HomeLoadedSuccessState error => $e");
      emit(HomeErrorState());
    }
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    log("homeProductWishlistButtonClickEvent");
    wishlistProducts.add(event.product);
     emit(HomeProductAddToWishlistActionState());
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    log("homeProductCartButtonClickEvent");
    cartProducts.add(event.product);
    emit(HomeProductAddToCartActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeState> emit) {
    log("homeWishlistButtonNavigateEvent");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    log("homeCartButtonNavigateEvent");
    emit(HomeNavigateToCartPageActionState());
  }
}
