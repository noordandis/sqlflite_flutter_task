
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlflite_flutter_task/core/shop_cubit/shop_state.dart';

import '../database/database_helper.dart';
import '../model/shop_model.dart';



class ShopCubit extends Cubit<ShopState> {

  final DatabaseHelper _dbHelper = DatabaseHelper();

  ShopCubit() : super(ShopInitial()) {
    fetchShops();
  }

  void fetchShops() async {
    try {
      emit(ShopLoading());
      final shops = await _dbHelper.getShops();
      emit(ShopLoaded(shops));
    } catch (e) {
      emit(ShopError("Failed to fetch shops."));
    }
  }

  void addShop(String productName, String quantity) async {
    try {
      final newShop = Shop(productName: productName, quantity: quantity);
      await _dbHelper.insertShop(newShop);
      fetchShops();
    } catch (e) {
      emit(ShopError("Failed to add shop."));
    }
  }

  void deleteShop(int id) async {
    try {
      await _dbHelper.deleteShop(id);
      fetchShops();
    } catch (e) {
      emit(ShopError("Failed to delete shop."));
    }
  }
}