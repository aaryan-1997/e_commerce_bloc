part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {
  final Product product;

  HomeProductWishlistButtonClickEvent({required this.product});
}

class HomeProductCartButtonClickEvent extends HomeEvent {
   final Product product;

  HomeProductCartButtonClickEvent({required this.product});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
