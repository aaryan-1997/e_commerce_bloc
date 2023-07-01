part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<Product> cartProduct;
  CartSuccessState({required this.cartProduct});
}

class CartProductRemoveState extends CartActionState {}
