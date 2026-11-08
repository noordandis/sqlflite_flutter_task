

import '../model/shop_model.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopLoaded extends ShopState {
  final List<Shop> shops;
  ShopLoaded(this.shops);
}

class ShopError extends ShopState {
  final String message;
  ShopError(this.message);
}