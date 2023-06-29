import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductWishlistButtonClickEvent>(
        homeProductWishlistButtonClickEvent);
    on<HomeProductCartButtonClickEvent>(homeProductCartButtonClickEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickEvent(
      HomeProductWishlistButtonClickEvent event, Emitter<HomeState> emit) {
    log("homeProductWishlistButtonClickEvent");
  }

  FutureOr<void> homeProductCartButtonClickEvent(
      HomeProductCartButtonClickEvent event, Emitter<HomeState> emit) {
    log("homeProductCartButtonClickEvent");
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
