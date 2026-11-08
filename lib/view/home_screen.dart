import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlflite_flutter_task/view/widgets/card_widget.dart';
import 'package:sqlflite_flutter_task/view/widgets/empty_widget.dart';
import '../core/shop_cubit/shop_cubit.dart';
import '../core/shop_cubit/shop_state.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 5, 48),
      body: BlocBuilder<ShopCubit, ShopState>(

          builder: (context, state) {

            if (state is ShopLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ShopLoaded) {

              if (state.shops.isEmpty) {
                return  EmptyWidget();
              }
              return ListView.builder(
                itemCount: state.shops.length,
                itemBuilder: (context, index) {
                  return CardWidget(shop: state.shops[index]);
                },
              );
            } else if (state is ShopError) {
              return Center(child: Text(state.message));
            }
            return SizedBox();
          },

      ),

    );

  }

}